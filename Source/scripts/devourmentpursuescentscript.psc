Scriptname DevourmentPursueScentScript extends ActiveMagicEffect  

Actor Target
Actor Caster

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForSingleUpdate(0.1)
	Target=akTarget
	Caster=akCaster
EndEvent

Event OnUpdate()
	if(Target.getDistance(Caster)<1600&&!Target.getCombatTarget().hasMagicEffect(SmellsNice)&&!Target.getCombatTarget().hasMagicEffect(SmellsNiceAlso)&&!Target.getCombatTarget().hasMagicEffect(SmellsNiceToo)&&!Target.isPlayerTeammate())
		Target.StopCombat()
		Target.StartCombat(Caster)
	endif
	; RegisterForSingleUpdate(0.1)
EndEvent

MagicEffect Property SmellsNice Auto
MagicEffect Property SmellsNiceAlso Auto 
MagicEffect Property SmellsNiceToo Auto
