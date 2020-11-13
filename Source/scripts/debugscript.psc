Scriptname DebugScript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Acto akCaster)
	if(!akTarget.hasMagicEffect(thisEffect))
		Game.SetCameraTarget(akTarget)
		akTarget.SetPlayerControls(true)
	else
		Game.SetCameraTarget(None)
	endif
EndEvent

MagicEffect Property ThisEffect Auto