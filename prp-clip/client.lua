
------------------------
-- Usage and Provides --
------------------------

-- This script provides the following Commands in-game:
-- /record  starts/stops record
-- /editor  launches rockstar editor

RegisterCommand('record', function(source, args)
	if(IsRecording()) then
		StopRecordingAndSaveClip()
	else
		StartRecording(1)
	end
end)

RegisterCommand('editor', function(source, args)
	NetworkSessionLeaveSinglePlayer()
	ActivateRockstarEditor()
end)