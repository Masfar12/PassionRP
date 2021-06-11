Citizen.CreateThread(function()
	while true do
		SetVehicleDensityMultiplierThisFrame(0.7)
	    SetPedDensityMultiplierThisFrame(0.8)
	    SetParkedVehicleDensityMultiplierThisFrame(0.3)
		SetScenarioPedDensityMultiplierThisFrame(0.8, 0.8)

		Citizen.Wait(3)
	end
end)