local QBCore = exports['qb-core']:GetCoreObject()
local canplacebench = true
local placedbench, crafting, benchprop, benchcoords, benchtype, benchlevel, benchhealth = false, false, nil, nil, nil, 0, 0

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(50)
    end
end

local function playanim(animdic, anim)
    local ped = PlayerPedId()
    loadAnimDict(animdic)
    TaskPlayAnim(ped, animdic, anim, 1.0, -1.0,-1,1,0,0, 0,0)
    Citizen.Wait(1500)
    ClearPedTasksImmediately(ped)
end

local function OpenCraft(benchid)
    local columns = {
        {
            header = "Crafting",
            isMenuHeader = true,
        },
    }
    for k, v in pairs(Config.benches[benchid].crafting) do
        if tonumber(benchlevel) >= tonumber(v.minbenchlevel) then
            local item = {}
            item.header = "<img src=nui://"..Config.inventorylink..QBCore.Shared.Items[v.itemname].image.." width=35px style='margin-right: 10px'> " .. v.label
            local text = ""
            for k, v in pairs(v.materials) do
                text = text .. "- " .. QBCore.Shared.Items[v.item].label .. ": " .. v.amount .. "<br>"
            end
            item.text = text
            item.params = {
                event = 'flex-pwb:client:craft',
                args = {
                    id = k,
                    bench = benchid,
                    item = Config.benches[benchid].crafting[k].itemname,
                    itemtype = Config.benches[benchid].crafting[k].itemtype
                }
            }
            table.insert(columns, item)
        end
    end

    exports['qb-menu']:openMenu(columns)
end

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    if DoesEntityExist(benchprop) then
        playanim('random@domestic', 'pickup_low')
        QBCore.Functions.Notify(Lang:t("success.grabbench"), "success", 5000)
        DeleteEntity(benchprop)
        TriggerServerEvent('flex-pwb:server:givebench', benchtype, benchlevel, benchhealth)
        placedbench, crafting, benchprop, benchcoords, benchtype, benchlevel, benchhealth = false, false, nil, nil, nil, nil, nil
    end
end)

local function benchdistancecheck()
    CreateThread(function()
        while true do
            Citizen.Wait(1)
            if crafting then
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local distance = #(benchcoords - pos)
                local closestVehicle, closestDistance = QBCore.Functions.GetClosestVehicle(pos)
                if closestDistance < 5 then
                    if DoesEntityExist(benchprop) then
                        playanim('random@domestic', 'pickup_low')
                        QBCore.Functions.Notify(Lang:t("error.cartoclose"), "error", 5000)
                        DeleteEntity(benchprop)
                        TriggerServerEvent('flex-pwb:server:givebench', benchtype, benchlevel, benchhealth)
                        placedbench, crafting, benchprop, benchcoords, benchtype, benchlevel, benchhealth = false, false, nil, nil, nil, nil, nil
                    end
                elseif distance >= 5 then
                    if DoesEntityExist(benchprop) then
                        playanim('random@domestic', 'pickup_low')
                        DeleteEntity(benchprop)
                        TriggerServerEvent('flex-pwb:server:givebench', benchtype, benchlevel, benchhealth)
                        placedbench, crafting, benchprop, benchcoords, benchtype, benchlevel, benchhealth = false, false, nil, nil, nil, nil, nil
                    end
                elseif tonumber(benchhealth) <= 0 then
                    if DoesEntityExist(benchprop) then
                        QBCore.Functions.Notify(Lang:t("error.benchbroke"), "error", 5000)
                        DeleteEntity(benchprop)
                        placedbench, crafting, benchprop, benchcoords, benchtype, benchlevel, benchhealth = false, false, nil, nil, nil, nil, nil
                    end
                else
                    QBCore.Functions.DrawText3D(benchcoords.x, benchcoords.y, benchcoords.z+0.7+Config.benches[benchtype].text3dYoffset, '~o~'..Lang:t("text.benchlevel")..'~w~: '..benchlevel)
                    QBCore.Functions.DrawText3D(benchcoords.x, benchcoords.y, benchcoords.z+0.6+Config.benches[benchtype].text3dYoffset, '~o~'..Lang:t("text.benchhealth")..'~w~: '..benchhealth..'%')
                    QBCore.Functions.DrawText3D(benchcoords.x, benchcoords.y, benchcoords.z+0.5+Config.benches[benchtype].text3dYoffset, '[~o~E~w~] '..Lang:t("text.craft")..' [~o~G~w~] '..Lang:t("text.takebench")..' [~o~H~w~] '..Lang:t("text.repair"))
                    if distance <= 1.8 then
                        if IsControlJustReleased(0, 38) then
                            OpenCraft(benchtype)
                        elseif IsControlJustReleased(0, 47) then
                            if DoesEntityExist(benchprop) then
                                playanim('random@domestic', 'pickup_low')
                                QBCore.Functions.Notify(Lang:t("success.grabbench"), "success", 5000)
                                DeleteEntity(benchprop)
                                TriggerServerEvent('flex-pwb:server:givebench', benchtype, benchlevel, benchhealth)
                                placedbench, crafting, benchprop, benchcoords, benchtype, benchlevel, benchhealth = false, false, nil, nil, nil, nil, nil
                            end
                        elseif IsControlJustReleased(0, 101) then
                            if tonumber(benchhealth) < 100 then
                                QBCore.Functions.TriggerCallback("flex-pwb:server:canRepair", function(hasMaterials)
                                    if (hasMaterials) then
                                        local ped = PlayerPedId()
                                        local pos = GetEntityCoords(ped)
                                        SetPedCanPlayAmbientAnims(ped, true) 
                                        TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_HAMMERING', 0, false)
                                        QBCore.Functions.Progressbar('repair_bench', Lang:t("info.repairingworkbench"), Config.benches[benchtype].benchrepairtime * 1000, false, false, {
                                            disableMovement = true,
                                            disableCarMovement = true,
                                            disableMouse = false,
                                            disableCombat = true,
                                        }, {
                                            animDict = nil,
                                            anim = nil,
                                            }, {}, {}, function() -- Success
                                            QBCore.Functions.Notify(Lang:t("success.repairedbench"), 'success')
                                            benchhealth = 100
                                            for k, v in pairs(Config.benches[benchtype].repaircost) do
                                                TriggerServerEvent('flex-pwb:server:removeItem', v.item, v.amount)
                                            end
                                            local hammer = GetClosestObjectOfType(pos.x, pos.y, pos.z, 5.0, GetHashKey('prop_tool_hammer'), false, true ,true)
                                            if DoesEntityExist(hammer) then
                                                SetEntityAsMissionEntity(hammer, false, false)
                                                DeleteObject(hammer)
                                            end
                                            ClearPedTasksImmediately(ped)
                                        end, function() -- Cancel
                                            local hammer = GetClosestObjectOfType(pos.x, pos.y, pos.z, 5.0, GetHashKey('prop_tool_hammer'), false, true ,true)
                                            if DoesEntityExist(hammer) then
                                                SetEntityAsMissionEntity(hammer, false, false)
                                                DeleteObject(hammer)
                                            end
                                            ClearPedTasksImmediately(ped)
                                            QBCore.Functions.Notify(Lang:t("error.stoppedrepairbench"), 'error', 5000)
                                        end)
                                    else
                                        QBCore.Functions.Notify(Lang:t("error.notenoughtorepair"), 'error', 5000)
                                        for k, v in pairs(Config.benches[benchtype].repaircost) do
                                            QBCore.Functions.Notify(Lang:t("error.youdonthave")..v.amount..' x '..QBCore.Shared.Items[v.item].name, 'error', 5000)
                                        end
                                    end
                                end, Config.benches[benchtype].repaircost)
                            else
                                QBCore.Functions.Notify(Lang:t("success.alreadymaxhealth"), 'success', 5000)
                            end
                        end
                    end
                end
            else
                break
            end
        end
    end)
end

RegisterNetEvent('flex-pwb:client:placebench', function(id, level, health, itemdata)
    if placedbench then return QBCore.Functions.Notify(Lang:t("error.alreadyplaced"), "error", 5000) end
    local ped = PlayerPedId()
    local pos, heading = GetEntityCoords(ped), GetEntityHeading(ped)
    -- if pos.z < Config.undergroundZcheck then return QBCore.Functions.Notify(Lang:t("error.notvalidplace"), "error", 5000) end
    if not canplacebench then return QBCore.Functions.Notify(Lang:t("error.notvalidplace"), "error", 5000) end
    if Config.benches[id] ~= nil and id ~= nil and level ~= nil and health ~= nil then
        benchtype, benchlevel, benchhealth = id, level, health
        crafting = true
        local closestVehicle, closestDistance = QBCore.Functions.GetClosestVehicle(pos)
        if closestDistance > 10 then
            PlaceObject(Config.benches[id].model, function(pPlaced, pCoords, pHeading)
                if pPlaced then
                    benchprop = CreateObject(Config.benches[id].model, pCoords.x, pCoords.y, pCoords.z, true, true, true)
                    PlaceObjectOnGroundProperly(benchprop)
                    benchcoords = GetEntityCoords(benchprop)
                    SetEntityHeading(benchprop, pHeading)
                    benchdistancecheck()
                    QBCore.Functions.Notify(Lang:t("success.placedbench"), "success", 5000)
                    TriggerServerEvent('flex-pwb:server:removeBench', itemdata)
                    placedbench = true
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("error.cartoclose"), "error", 5000)
        end
    end
end)

local function craft(item, matid, bench, itemtype)
    local ped = PlayerPedId()
    local propcoords = GetEntityCoords(benchprop)
    QBCore.Functions.FaceToPos(propcoords.x, propcoords.y, propcoords.z)
    QBCore.Functions.Progressbar('crafting_item', Lang:t("info.crafting", {value = Config.benches[bench].crafting[matid].label}), Config.benches[bench].crafting[matid].crafttime * 1000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_ped",
        }, {}, {}, function() -- Success
        QBCore.Functions.Notify(Lang:t("success.crafted", {value = Config.benches[bench].crafting[matid].label}), 'success')
        TriggerServerEvent('flex-pwb:server:giveItem', item, itemtype)
        if tonumber(benchlevel) < Config.benches[bench].crafting[#Config.benches[bench].crafting].minbenchlevel then
            benchlevel = benchlevel + Config.benches[bench].crafting[matid].gainxp
        end
        if math.random(0, 100) <= Config.benches[bench].benchbreakchance then
            benchhealth = benchhealth - Config.benches[bench].benchbreakpercent
        end
        for k, v in pairs(Config.benches[bench].crafting[matid].materials) do
            TriggerServerEvent('flex-pwb:server:removeItem', v.item, v.amount)
        end
        ClearPedTasks(ped)
    end, function() -- Cancel
        ClearPedTasks(ped)
        QBCore.Functions.Notify(Lang:t("error.stoppedcrafting"), 'error', 5000)
    end)
end

RegisterNetEvent('flex-pwb:client:craft', function(data)
    QBCore.Functions.TriggerCallback("flex-pwb:server:canCraft", function(hasMaterials)
        if (hasMaterials) then
            craft(data.item, data.id, data.bench, data.itemtype)
        else
            QBCore.Functions.Notify(Lang:t("error.notenoughtmats"), "error", 5000)
            return
        end
    end, Config.benches[data.bench].crafting[data.id].materials)
end)

AddEventHandler('onResourceStop', function(resource)
    if GetCurrentResourceName() == resource then
		if DoesEntityExist(benchprop) then
            QBCore.Functions.Notify(Lang:t("success.grabbench"), "success", 5000)
            DeleteEntity(benchprop)
            TriggerServerEvent('flex-pwb:server:givebench', benchtype, benchlevel, benchhealth)
            placedbench, crafting, benchprop, benchcoords, benchtype, benchlevel, benchhealth = false, false, nil, nil, nil, nil, nil
        end
    end
end)

-- EXPORTS
local function BenchPlaceState(state)
	canplacebench = state
	return canplacebench
end

exports("BenchPlaceState", BenchPlaceState)