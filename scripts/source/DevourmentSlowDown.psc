Scriptname DevourmentSlowDown extends activemagiceffect  
DevourmentRegistryScript Property ManagerQuest Auto
float oldspeedmult
actor pred
MiscObject property WeightUpdate auto
float modifier = 1.0
float preyhealth
float dbump1 = 0.0
float bump1 = 1.0

float dbump2 = 0.0
float bump2 = 1.0

float dbump3 = 0.0
float bump3 = 1.0
Event OnEffectStart(Actor akTarget, Actor akCaster)
    pred = akCaster
RegisterForSingleUpdate(0.1)
EndEvent


Event OnUpdate()
SliderAnimation()
RegisterForSingleUpdate(0.01)  
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
     NiOverride.SetBodyMorph(pred, "struggleslider1", "memes", 0)
     NiOverride.SetBodyMorph(pred, "struggleslider2", "memes", 0)
     NiOverride.SetBodyMorph(pred, "struggleslider3", "memes", 0)
     NiOverride.UpdateModelWeight(pred)
EndEvent
 
Function SliderAnimation()
   If dbump1 == 1
       bump1 = bump1 + Utility.RandomFloat(0.01*0.75, 0.5*0.75)
        If bump1 >= 1
            dbump1 = 0
        EndIf
    Else
        bump1 = bump1 - Utility.RandomFloat(0.01*0.75, 0.5*0.75)
        If bump1 <= 0
            dbump1 = 1
        EndIf
    EndIf
    If dbump2 == 1
        bump2 = bump2 + Utility.RandomFloat(0.05*0.75, 0.20*0.75)
        If bump2 >= 1
            dbump2 = 0
        EndIf
    Else
        bump2 = bump2 - Utility.RandomFloat(0.05*0.75, 0.20*0.75)
        If bump2 <= 0
            dbump2 = 1
        EndIf
    EndIf
    If dbump3 == 1
        bump3 = bump3 + Utility.RandomFloat(0.1*0.75, 0.15*0.75)
        If bump3 >= 1
            dbump3 = 0
        EndIf
    Else
        bump3 = bump3 - Utility.RandomFloat(0.1*0.75, 0.15*0.75)
        If bump3 <= 0
            dbump3 = 1
        EndIf
    EndIf
  
    NiOverride.SetBodyMorph(pred, "struggleslider1", "memes", bump1 )
    NiOverride.SetBodyMorph(pred, "struggleslider2", "memes", bump2)
    NiOverride.SetBodyMorph(pred, "struggleslider3", "memes", bump3)
        NiOverride.UpdateModelWeight(pred)
EndFunction