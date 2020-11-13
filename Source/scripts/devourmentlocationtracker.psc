Scriptname DevourmentLocationTracker extends ActiveMagicEffect  

Cell Property StomachCell Auto

Actor thePrey
Actor thePred

Event OnEffectStart(Actor akTarget, Actor akCaster)
	thePrey=akCaster
	thePred=akTarget
EndEvent

Event OnCellAttach()
	if(thePrey.getParentCell()!=StomachCell)
		thePrey.setPosition(thePred.getPositionX()+2000,thePred.getPositionY()+2000,thePred.getPositionZ())
		thePrey.moveTo(thePred)
	endif
EndEvent