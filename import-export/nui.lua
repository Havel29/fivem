
--Store the blip in the map legend
blip = nil

function initializeBlip()
    local blipName = "Import/Export"
    local blipCoords = vector3(1214,-3268,14) --Non c'è bisogno di averne più di uno, quindi non creiamo un file coords.lua
    blip = AddBlipForCoord(blipCoords.x, blipCoords.y, blipCoords.z)
    SetBlipScale(blip, 1.0)
    SetBlipSprite(blip, 568)
    SetBlipColour(blip, 46)
    SetBlipAlpha(blip, 255)
    AddTextEntry("IMPORT", "Import/Export")
    BeginTextCommandSetBlipName("Import")
    EndTextCommandSetBlipName(blip)
    SetBlipCategory(blip, 2)
end

marker = nil
local markerPos = vector3(1218,-3223,6)
local isInMarker = false

function initializeMarker()
    local ped = GetPlayerPed(-1)
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(ped)
        local distance = #(playerCoords - markerPos)
        if distance < 100.0 then
            DrawMarker(2, markerPos.x, markerPos.y, markerPos.z + 1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 128, 0, 50, false, true, 2, nil, nil, false, false)
            if distance < 2.0 then
                isInMarker = true
            end
        else
            Citizen.Wait(2000)
        end
    end
end

Citizen.CreateThread(initializeBlip)
Citizen.CreateThread(initializeMarker)


--Load ESX Object and PlayerData

ESX = nil

local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)




--Now handle the UI Part


local display = false
RegisterCommand("nui", function(source, args)
    if PlayerData.job ~= nil and PlayerData.job.name == 'import' and isInMarker then --Activate display only if player is an import's employee
        SetDisplay(not display)
    end
end)

RegisterNUICallback("exit", function(data)
    --chat("Sei uscito dal menu", {0,255,0})
    SetDisplay(false)
end)

RegisterNUICallback("vendi", function(data)
    --Give the player money correspondent to the amount of stuff and remove the stuff from their inventory
    local quantita = data.quantita
    local merce = data.merce
    
 

    TriggerServerEvent("venduto", quantita, merce, GetPlayerServerId(PlayerId()))
    
    SetDisplay(false)


    --TODO: Remove the items the player sold

end)

RegisterNUICallback("error", function(data)
    chat(data.error, {255,0,0})
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        -- https://runtime.fivem.net/doc/natives/#_0xFE99B66D079CF6BC
        --[[ 
            inputGroup -- integer , 
	        control --integer , 
            disable -- boolean 
        ]]
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

function chat(str, color)
    TriggerEvent(
        'chat:addMessage',
        {
            color = color,
            multiline = true,
            args = {str}
        }
    )
end