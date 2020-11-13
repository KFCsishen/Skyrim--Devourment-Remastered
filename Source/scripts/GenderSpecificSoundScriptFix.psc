Scriptname GenderSpecificSoundScriptFix extends DevourmentEventHandler  

Event OnInit()
	Utility.wait(10)
	Manager.RegisterEventHandler(self)
	Debug.messageBox("Event handler registered: "+Manager.isHandlerRegistered(self))
EndEvent

Function OnPreyDeath(Actor pred, Actor prey, int flags)
	If (prey.GetActorBase().GetSex() == 1)
		FemalePraySound.Play(pred)
	ElseIf (prey.GetActorBase().GetSex() == 0)
		MalePraySound.Play(pred)
	EndIf
EndFunction
		
Sound property FemalePraySound auto
Sound property MalePraySound auto