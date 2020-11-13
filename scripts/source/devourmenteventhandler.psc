Scriptname DevourmentEventHandler extends Quest  

Function OnSwallow(Actor pred, Actor prey, int flags)
EndFunction

Function OnEscape(Actor pred, Actor prey, int flags, bool oral)
EndFunction

Function OnDigestionTick(Actor pred, Actor prey, int flags, float numRealTicks)
EndFunction

Function OnPreyDeath(Actor pred, Actor prey, int flags)
EndFunction

Function OnDeadDigestionTick(Actor pred, Actor prey, int flags, float completion) ; Completion ranges from 0-1
EndFunction

Function OnExcretion(Actor pred, Actor prey, int flags)
EndFunction

Function OnDialog(Actor pred, Actor prey, int flags)
EndFunction

Function OnNewCharacter(Actor pred, Actor prey, int flags)
EndFunction

Function OnCustomEvent(Actor pred, Actor prey, int flags, float ID)
EndFunction

DevourmentRegistryScript Property Manager Auto