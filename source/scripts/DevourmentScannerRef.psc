Scriptname DevourmentScannerRef extends ReferenceAlias


DevourmentScannerQuest Property Scanner Auto


Event OnInit()
	Scanner.CheckPotentialPredator(Self)
EndEvent


Event OnReset()
	Scanner.CheckPotentialPredator(Self)
EndEvent
