ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.pedsPos) do
        local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
        SetBlipSprite (blip, 66)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 46)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('Misja dzienna')
		EndTextCommandSetBlipName(blip)

        RequestModel(GetHashKey(v.ped))
        while not HasModelLoaded(GetHashKey(v.ped)) do
            Wait(1)
        end

        local mareczek = CreatePed(4, GetHashKey(v.ped), v.coords.x, v.coords.y, v.coords.z - 1, v.coords.w, true, true)
        FreezeEntityPosition(mareczek, true)
        SetEntityInvincible(mareczek, true)
        SetBlockingOfNonTemporaryEvents(mareczek, true)

        exports.qtarget:AddTargetEntity(mareczek,{
            options = {
                {
                    event = v.event,
                    icon = "fas fa-comment",
                    label = "Weź misję",
                },
            },
            distance = 2.5
        })
    end
end)

RegisterNetEvent('rvl:mis:1',function()
    ESX.ShowNotification('Misja nr.1')
end)

RegisterNetEvent('rvl:mis:2',function()
    ESX.ShowNotification('Misja nr.2')
end)

RegisterNetEvent('rvl:mis:3',function()
    ESX.ShowNotification('Misja nr.3')
end)

RegisterNetEvent('rvl:mis:4',function()
    ESX.ShowNotification('Misja nr.4')
end)