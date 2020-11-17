Scriptname ForceOtherToSwallow extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
      bool selected = true
      if(selected&&!ManagerQuest.IsForcePredSelected(akTarget))    
      ManagerQuest.SelectForcePred(akTarget)
      selected = false     
      endif
      
  if(selected&&!ManagerQuest.IsForcePreySelected(akTarget))     
      ManagerQuest.SelectForcePrey(akTarget)
      selected = false
      ManagerQuest.CastForcedSwallow()     
      endif
EndEvent
DevourmentRegistryScript Property ManagerQuest Auto