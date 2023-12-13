function PlaceObject(pObject, cb)
    local objectHash, playerPed = GetHashKey(pObject), PlayerPedId()
    local minV, maxV = GetModelDimensions(objectHash)
    
    local ObjHead = GetEntityHeading(playerPed)
    local CentCoords = {} -- Idk why
    local ObjectCoords = CentCoords

    Object = CreateObject(objectHash, CentCoords.x, CentCoords.y, CentCoords.z, true, true, true)
    SetEntityCollision(Object, false, true)
    RequestModelHash(objectHash)
    local placed = false
    local isInvisible = false
    local canPlace = false
    Placing = true

    CreateThread(function()
        while Placing do
            local CentCoords = GetEntityCoords(playerPed) + (GetEntityForwardVector(playerPed) * 1.5)
            DisablePlayerFiring(PlayerPedId(), true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(1, 38, true)
            DisableControlAction(0, 44, true)
            exports['qb-core']:DrawText('[ESC] Stop </br>[◄/►] Turn </br>[ENTER] Place', 'left')
            if IsDisabledControlJustPressed(0, 177) then
                exports['qb-core']:HideText()
                stopPlacing()
            end
            if IsDisabledControlJustPressed(0, 174) then
                ObjHead = ObjHead + 5
                if ObjHead > 360 then ObjHead = 0.0 end
            end
            if IsDisabledControlJustPressed(0, 175) then
                ObjHead = ObjHead - 5
                if ObjHead < 0 then ObjHead = 360.0 end
            end
            SetEntityCoords(Object, CentCoords.x, CentCoords.y, CentCoords.z, 0.0, 0.0, 0.0, false)
            PlaceObjectOnGroundProperly_2(Object)
            SetEntityHeading(Object, ObjHead)
            local rayHandle = StartShapeTestBox(CentCoords, maxV - minV, GetEntityRotation(playerPed, 2), 2, 339, playerPed, 4)
            local retval, hit, endCoords, _, materialHash, _ = GetShapeTestResultIncludingMaterial(rayHandle)
            SetEntityAlpha(Object, 99, true)
            if hit == 1 then
                canPlace = false
                if not isInvisible then
                    SetObjectVisibilityState(Object, true, function(pState)
                        isInvisible = pState
                    end)
                end
            else
                local rayHandle = StartExpensiveSynchronousShapeTestLosProbe(CentCoords.x, CentCoords.y, CentCoords.z, CentCoords.x, CentCoords.y, CentCoords.z - 2, 1, 0, 4)
                local retval, hit, endCoords, _, materialHash, _ = GetShapeTestResultIncludingMaterial(rayHandle)
                local properMaterial = 1
                canPlace = properMaterial
                if properMaterial and isInvisible then
                    SetObjectVisibilityState(Object, false, function(pState)
                        isInvisible = pState
                    end)
                elseif not properMaterial and not isInvisible then
                    SetObjectVisibilityState(Object, true, function(pState)
                        isInvisible = pState
                    end)
                end
            end

            if canPlace and IsControlJustPressed(0, 191) then
                ObjectCoords = GetEntityCoords(Object)
                ObjHead = GetEntityHeading(Object)
                Placing = false
                placed = true
                if Object then
                    DeleteObject(Object)
                end
                exports['qb-core']:HideText()
            end
            Wait(0)
        end
        cb(placed, ObjectCoords, ObjHead)
    end)
end

function stopPlacing()
    exports['qb-core']:HideText()
    if Object then
        DeleteObject(Object)
    end
    Placing = false
    placed = false
end

function SetObjectVisibilityState(pObject, pState, cb)
    if pState then
        SetEntityAlpha(pObject, 0, true)
    else
        ResetEntityAlpha(pObject)
    end
    cb(pState)
end

function RequestModelHash(Model)
    RequestModel(Model)
    while not HasModelLoaded(Model) do
        Wait(1)
    end
end

function RequestAnimationDict(AnimDict)
    RequestAnimDict(AnimDict)
    while not HasAnimDictLoaded(AnimDict) do
        Citizen.Wait(1)
    end
end

function createTableAtCoords(pCoords, pHeading, Type)
    local Model = GetHashKey(TableConfig.Settings['Tables'][Type]['Prop'])
    RequestModelHash(Model)
    local tableObject = CreateObject(Model, pCoords.x, pCoords.y, pCoords.z, 0, 0, 0)
    FreezeEntityPosition(tableObject, true)
    if not pHeading then pHeading = 0.0 end
    SetEntityHeading(tableObject, pHeading + 0.00001)
    PlaceObjectOnGroundProperly(tableObject)
    return tableObject
end

function removeTable(tableId)
    if ActiveTables[tableId] then
        DeleteObject(ActiveTables[tableId].object)
        ActiveTables[tableId] = nil
    end
end