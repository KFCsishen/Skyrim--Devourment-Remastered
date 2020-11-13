Scriptname KongPowQuestScriptRNDWorks extends DevourmentEventHandler  

Event OnInit()

	Utility.wait(10)

	Manager.registerEventHandler(self)
	Debug.messageBox("Event handler registered: "+Manager.isHandlerRegistered(self))

EndEvent


Function OnDeadDigestionTick(Actor pred, Actor prey, int flags, float numRealTicks)
	HungerPoints.mod(-1.0)
	If(HungerPoints.GetValue() < 0)
		Hungerpoints.SetValue(0.0)
	EndIf
EndFunction

GlobalVariable Property HungerPoints Auto
