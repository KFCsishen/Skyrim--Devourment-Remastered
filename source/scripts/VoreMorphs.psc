Scriptname VoreMorphs extends ObjectReference 
actor preda
float dbump1 = 0.0
float bump1 = 1.0

float dbump2 = 0.0
float bump2 = 1.0

float dbump3 = 0.0
float bump3 = 1.0
Spell property vore auto
function OnUnequipped(Actor akActor)

    ; Empty function
endFunction



Event OnEquipped(Actor akActor)
      preda = akActor
    slideranimation(Game.GetPlayer())
    NiOverride.SetBodyMorph(Game.GetPlayer(), "struggleslider1", "memes", 100)
    NiOverride.UpdateModelWeight(Game.GetPlayer())
    RegisterForSingleUpdate(0.1)
EndEvent
Event OnUpdate()
    slideranimation(Game.GetPlayer())
RegisterForSingleUpdate(0.1)
EndEvent

Function SliderAnimation(actor pred)
   If dbump1 == 1
        bump1 = bump1 + 0.1
        If bump1 >= 1
            dbump1 = 0
        EndIf
    Else
        bump1 = bump1 - 0.1
        If bump1 <= 0
            dbump1 = 1
        EndIf
    EndIf
    If dbump2 == 1
        bump2 = bump2 + 0.1
        If bump2 >= 1
            dbump2 = 0
        EndIf
    Else
        bump2 = bump2 - 0.1
        If bump2 <= 0
            dbump2 = 1
        EndIf
    EndIf
    If dbump3 == 1
        bump3 = bump3 + 0.1
        If bump3 >= 1
            dbump3 = 0
        EndIf
    Else
        bump3 = bump3 - 0.1
        If bump3 <= 0
            dbump3 = 1
        EndIf
    EndIf
  
    NiOverride.SetBodyMorph(pred, "struggleslider1", "memes", bump1)
    NiOverride.SetBodyMorph(pred, "bump_2", "memes", bump2)
    NiOverride.SetBodyMorph(pred, "bump_3", "memes", bump3)
        NiOverride.UpdateModelWeight(pred)
EndFunction
