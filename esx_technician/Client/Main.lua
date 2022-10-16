ESX = nil
local PlayerData = {}

MenuOpened = false
CurrentJob = nil

MainBlip = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	while true do
		if ESX == nil then
			Citizen.Wait(1)
		else
			ESX.PlayerData = xPlayer
			break
		end
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent("finishedHacking", function(hackingResult)
	if hackingResult == "DONE" then
		if CurrentJob ~= {} then

			TriggerServerEvent('esx_technician:PayMoney', totalQuest)
			
			ESX.ShowNotification(Config.TranslationList[Config.Translation]["JOB_DONE"] .. "Hai guadagnato ~b~$"..(Config.MoneyAmount*totalQuest)..",-~g~ per le riparazioni!", false, true, 210)
		else
			ESX.ShowNotification(Config.TranslationList[Config.Translation]["MENU_NONE"], false, true, 90)
		end
	end
end)

function displayJob()
	while true do
		if ESX.PlayerData.job.name == "technician" then
			-- Circle
			DrawMarker(
				25, -- Type
				CurrentJob.X, CurrentJob.Y, CurrentJob.Z - 0.98, -- Position
				0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -- Orientation
				1.5, 1.5, 1.5, -- Scale
				0, 255, 0, 155, -- Color
				false, true, 2, nil, nil, false -- Extra
			)

			-- Question Mark
			DrawMarker(
				32, -- Type
				CurrentJob.X, CurrentJob.Y, CurrentJob.Z, -- Position
				0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -- Orientation
				0.75, 0.75, 0.75, -- Scale
				0, 255, 0, 155, -- Color
				false, true, 2, nil, nil, false -- Extra
			)

			
			JobCoords = vector3(CurrentJob.X, CurrentJob.Y, CurrentJob.Z)
			PlayerCoords = GetEntityCoords(PlayerPedId())

			if Vdist2(PlayerCoords, JobCoords) <= 1.5 then
				ESX.ShowHelpNotification(Config.TranslationList[Config.Translation]["JOB_HELP"], true, false, 1)
				if IsControlJustPressed(1, 51) then
					SendNUIMessage({
						type = 'intro'
					})
					TriggerEvent("datacrack:start", 3, function(output)
						if output == true then
							print("Hacking riuscito")
							partialQuest = partialQuest + 1
							if partialQuest == totalQuest then
								RemoveBlip(CurrentJob.Blip)
								DeleteWaypoint()
								SendNUIMessage({
									type = 'success'
								})
								TriggerEvent("finishedHacking","DONE")
							else
								RemoveBlip(CurrentJob.Blip)
								DeleteWaypoint()
								SendNUIMessage({
									type = 'success'
								})
								TriggerEvent("singleFix")
							end
						else
							--print("Hacking fallito")
							SendNUIMessage({
								type = 'fail'
							})
							
							RemoveBlip(CurrentJob.Blip)
							DeleteWaypoint()
							CurrentJob.Enabled = false
							TriggerEvent("singleFix")
						end
					end)
					return
				end
			end
		end
		
		
		Citizen.Wait(1)
	end
end		

function setNewCurrentJob()
	RandomJob = Config.Jobs[math.random(1, #Config.Jobs)]
			
	CurrentJob = {}

	CurrentJob["X"] = RandomJob.X
	CurrentJob["Y"] = RandomJob.Y
	CurrentJob["Z"] = RandomJob.Z

	CurrentJob["Blip"] = AddBlipForCoord(CurrentJob.X, CurrentJob.Y, CurrentJob.Z)
	SetBlipSprite(CurrentJob.Blip, 66)
	SetBlipDisplay(CurrentJob.Blip, 4)
	SetBlipScale(CurrentJob.Blip, 1.0)
	SetBlipColour(CurrentJob.Blip, 64)
	SetBlipAsShortRange(CurrentJob.Blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(Config.JobBlipName)
	EndTextCommandSetBlipName(CurrentJob.Blip)

	SetNewWaypoint(CurrentJob.X, CurrentJob.Y)

	CurrentJob["Enabled"] = false

	ESX.ShowNotification(Config.TranslationList[Config.Translation]["MENU_CREATED"], false, true, 210)
end

RegisterNetEvent("startTechnicianQuest", function()
	if ESX ~= nil then
		if ESX.PlayerData.job.name == "technician" then
			partialQuest = 0
			totalQuest = math.random(1,Config.MaxNumberOfFixes)
			ESX.ShowNotification("Ti sono state assegnate ~b~" .. totalQuest .. " riparazioni!", false, true, 210)
			TriggerEvent("singleFix")
		end
	end
end)

RegisterNetEvent("singleFix", function()
	setNewCurrentJob()
	if CurrentJob.Enabled == false then
		CurrentJob.Enabled = true
		displayJob()
	end
end)

RegisterCommand("quest", function()
	TriggerEvent("startTechnicianQuest")
end)