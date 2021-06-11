RegisterCommand("kick", function(source, args, rawCommand)
	local src = source
	local reason = ""
	for i,theArg in pairs(args) do
		if i ~= 1 then 
			reason = reason.." "..theArg
		end
	end
	if args[1] and tonumber(args[1]) then
		TriggerServerEvent("prp-panel:kickPlayerPanel", tonumber(args[1]), reason)
	end
end, false)

RegisterCommand("warn", function(source, args, rawCommand)
	local src = source
	local reason = ""
	for i,theArg in pairs(args) do
		if i ~= 1 then 
			reason = reason.." "..theArg
		end
	end
	if args[1] and tonumber(args[1]) then
		TriggerServerEvent("prp-panel:warnPlayerPanel", tonumber(args[1]), reason)
	end
end, false)


RegisterCommand("commend", function(source, args, rawCommand)
	local src = source
	local reason = ""
	for i,theArg in pairs(args) do
		if i ~= 1 then 
			reason = reason.." "..theArg
		end
	end
	if args[1] and tonumber(args[1]) then
		TriggerServerEvent("prp-panel:commendPlayerPanel", tonumber(args[1]), reason)
	end
end, false)

RegisterCommand("ban", function(source, args, rawCommand)
	local src = source
	if args[1] and tonumber(args[1]) then
		local reason = ""
		for i,theArg in pairs(args) do
			if i ~= 1 and i ~= 2 then
				reason = reason.." "..theArg
			end
		end
		if args[1] and tonumber(args[1]) then
			TriggerServerEvent("prp-panel:banPlayerPanel", tonumber(args[1]), reason, tonumber(args[2]))
		end
	end
end, false)


RegisterCommand("trustscore", function(source, args)
	local src = source
	if args[1] and tonumber(args[1]) then
		TriggerServerEvent("prp-panel:trustscorePlayer", tonumber(args[1]))
	end
end, false)

RegisterCommand("history", function(source, args)
    local src = source
    if args[1] and tonumber(args[1]) then
        TriggerServerEvent("prp-panel:historyPlayer", tonumber(args[1]))
    end
end, false)

