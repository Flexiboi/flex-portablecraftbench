local QBCore = exports['qb-core']:GetCoreObject()

local ox_inventory = nil
if Config.inventory == 'ox' then
    ox_inventory = exports.ox_inventory
end

QBCore.Commands.Add('givebench', Lang:t("command.testcommamd"), {{name = 'PlayerID', help = 'ID'}, {name = 'BenchID', help = Lang:t("command.name")}, {name = 'BenchLevel', help = Lang:t("command.level")},{name = 'BenchHealth', help = Lang:t("command.health")} }, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local info = {
        benchlevel = args[3],
        benchhealth = args[4]
    }
    if Config.inventory == 'ox' then
        exports.ox_inventory:AddItem(src, args[2], 1, info)
    else
        Player.Functions.AddItem(args[2], 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', args[2], QBCore.Shared.Items[args[2]], "add")
    end
end, 'admin')

for k, v in pairs(Config.benches) do
    QBCore.Functions.CreateUseableItem(v.benchitem, function(source,item)
        if item.info.benchlevel ~= nil and item.info.benchhealth ~= nil then
            TriggerClientEvent('flex-pwb:client:placebench', source, v.benchitem, item.info.benchlevel, item.info.benchhealth, item)
        else
            TriggerClientEvent('flex-pwb:client:placebench', source, v.benchitem, 0, 100, item)
        end
    end)
end

QBCore.Functions.CreateCallback('flex-pwb:server:canCraft', function(source, cb, materials)
    local src = source
    local hasItems = false
    local idk = 0
    local player = QBCore.Functions.GetPlayer(source)
    for k, v in pairs(materials) do
        if player.Functions.GetItemByName(v.item) and player.Functions.GetItemByName(v.item).amount >= v.amount then
            idk = idk + 1
            if idk == #materials then
                cb(true)
            end
        else
            cb(false)
            return
        end
    end
end)

QBCore.Functions.CreateCallback('flex-pwb:server:canRepair', function(source, cb, materials)
    local src = source
    local hasItems = false
    local idk = 0
    local player = QBCore.Functions.GetPlayer(source)
    for k, v in pairs(materials) do
        if player.Functions.GetItemByName(v.item) and player.Functions.GetItemByName(v.item).amount >= v.amount then
            idk = idk + 1
            if idk == #materials then
                cb(true)
            end
        else
            cb(false)
            return
        end
    end
end)

RegisterNetEvent('flex-pwb:server:removeBench', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item.name, 1, item.slot)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item.name], "remove")
end)

RegisterNetEvent('flex-pwb:server:removeItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.inventory == 'ox' then
        exports.ox_inventory:RemoveItem(src, item, 1, info)
    else
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount)
        Player.Functions.RemoveItem(item, amount)
    end
end)

RegisterNetEvent('flex-pwb:server:giveItem', function(item, itemtype)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = nil
    if itemtype == 'bench' then
        info = {
            benchlevel = 0,
            benchhealth = 100
        }
    end
    if Config.inventory == 'ox' then
        exports.ox_inventory:AddItem(src, item, 1, info)
    else
        Player.Functions.AddItem(item, 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
    end
end)

RegisterNetEvent('flex-pwb:server:givebench', function(benchtype, blevel, bhealth)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {
        benchlevel = blevel,
        benchhealth = bhealth
    }
    if Config.inventory == 'ox' then
        exports.ox_inventory:AddItem(src, benchtype, 1, info)
    else
        Player.Functions.AddItem(benchtype, 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[benchtype], "add")
    end
end)