local function entity_destroyed(event)
	if (storage.FlyingItems[event.registration_number]) then -- ##### VERY IMPORTANT THIS IS HOW LANDING OF THROWN ITEMS IS DETECTED #####
		ResolveThrownItem(storage.FlyingItems[event.registration_number])
	end

	if (storage.CatapultList[event.registration_number]) then
		if (storage.CatapultList[event.registration_number].entangled) then
			for each, entity in pairs(storage.CatapultList[event.registration_number].entangled) do
				entity.destroy()
			end
		end
		storage.CatapultList[event.registration_number] = nil
		if (storage.ThrowerPaths) then
			for ComponentNumber, TrackedStuff in pairs(storage.ThrowerPaths) do
				for ThrowerUN, _ in pairs(TrackedStuff) do
					if (ThrowerUN == event.registration_number) then
						storage.ThrowerPaths[ComponentNumber][ThrowerUN] = nil
					end
				end
			end
		end
	end

	if (storage.PrimerThrowerLinks[event.registration_number]) then
		storage.PrimerThrowerLinks[event.registration_number] = nil
	end

	if (storage.TrainRamps[event.registration_number]) then
		if (storage.TrainRamps[event.registration_number].blocker and storage.TrainRamps[event.registration_number].blocker.valid) then
			storage.TrainRamps[event.registration_number].blocker.destroy()
		end
		if (storage.TrainRamps[event.registration_number].power) then -- magent ramps
			for each, tile in pairs(storage.TrainRamps[event.registration_number].tiles) do
				tile.destroy()
			end
			storage.TrainRamps[event.registration_number].power.destroy()
		end
		storage.TrainRamps[event.registration_number] = nil
	end
	-- storage.MagnetRamps isnt used anymore but this section is kept for migration
	if (storage.MagnetRamps and storage.MagnetRamps[event.registration_number]) then
		for each, tile in pairs(storage.MagnetRamps[event.registration_number].tiles) do
			tile.destroy()
		end
		storage.MagnetRamps[event.registration_number].power.destroy()
		storage.MagnetRamps[event.registration_number] = nil
	end

	if (storage.TrainCollisionDetectors[event.registration_number]) then
		storage.TrainCollisionDetectors[event.registration_number] = nil
	end

	if (storage.OnTheWay[event.registration_number]) then
		storage.OnTheWay[event.registration_number] = nil
	end

	if (storage.ThrowerPaths[event.registration_number] ~= nil) then
		for ThrowerDestroyNumber, TrackedItems in pairs(storage.ThrowerPaths[event.registration_number]) do
			if (storage.CatapultList[ThrowerDestroyNumber]) then
				for item, ligma in pairs(TrackedItems) do
					storage.CatapultList[ThrowerDestroyNumber].targets[item] = nil
				end
			end
		end
		storage.ThrowerPaths[event.registration_number] = nil
	end

	if (storage.ZiplineTerminals[event.registration_number] ~= nil) then
		if (storage.ZiplineTerminals[event.registration_number].tag and storage.ZiplineTerminals[event.registration_number].tag.valid) then
			storage.ZiplineTerminals[event.registration_number].tag.destroy()
		end
		for each, player in pairs(game.players) do
			if (player.gui.center.RTZiplineTerminalGUI and player.gui.center.RTZiplineTerminalGUI.tags.ID == event.registration_number) then
				player.gui.center.RTZiplineTerminalGUI.destroy()
			end
		end
		storage.ZiplineTerminals[event.registration_number] = nil
	end

	if (storage.DestructionLinks[event.registration_number]) then
		for each, entity in pairs(storage.DestructionLinks[event.registration_number]) do
			if (entity.valid) then
				entity.destroy()
			end
		end
		storage.DestructionLinks[event.registration_number] = nil
	end

	if (storage.HoverGFX[event.registration_number]) then
		storage.HoverGFX[event.registration_number] = nil
		-- attached graphics should be destroyed with the entity
	end

	if (storage.TrapdoorWagonsOpen[event.registration_number]) then
		storage.TrapdoorWagonsOpen[event.registration_number] = nil
	end
	if (storage.TrapdoorWagonsClosed[event.registration_number]) then
		storage.TrapdoorWagonsClosed[event.registration_number] = nil
	end

	if (storage.BeltRamps[event.registration_number]) then
		if (storage.BeltRamps[event.registration_number].PlayerTrigger and storage.BeltRamps[event.registration_number].PlayerTrigger.valid) then
			storage.BeltRamps[event.registration_number].PlayerTrigger.destroy()
		end
		storage.BeltRamps[event.registration_number] = nil
	end

	if (storage.VacuumHatches[event.registration_number]) then
		storage.VacuumHatches[event.registration_number] = nil
	end

	if (storage.ItemCannons[event.registration_number]) then
		if (storage.ItemCannons[event.registration_number].chest and storage.ItemCannons[event.registration_number].chest.valid) then
			storage.ItemCannons[event.registration_number].chest.destroy()
		end
		if (storage.ItemCannons[event.registration_number].mask and storage.ItemCannons[event.registration_number].mask.valid) then
			storage.ItemCannons[event.registration_number].mask.destroy()
		end
		storage.ItemCannons[event.registration_number] = nil
	end
end

return entity_destroyed
