Scriptname RND_WeightBootstrap extends Quest  

event OnInit()
	RNDstatus = Game.GetFormFromFile(0x00012c4c, "RealisticNeedsandDiseases.esp") as GlobalVariable
	if ( RNDstatus != None )
		RegisterForSingleUpdate( 1.0 )
	endIf
endEvent

event OnUpdate()
	if RNDstatus.GetValueInt() == 1
		RNDWeight.Start()
	else
		RNDWeight.Stop()
	endIf
	RegisterForSingleUpdate( 1.0 )
endEvent

GlobalVariable RNDstatus = None

Quest Property RNDWeight  Auto  
