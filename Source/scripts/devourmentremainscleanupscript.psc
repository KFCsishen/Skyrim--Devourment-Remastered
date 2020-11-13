Scriptname DevourmentRemainsCleanupScript extends ObjectReference  

bool started=false
ObjectReference Property DungGathererChest Auto

Event OnLoad()
	if(!started)
		started=true
		RegisterForSingleUpdateGameTime(24.0)
	endif
EndEvent

Event OnUpdateGameTime()
	removeAllItems(DungGathererChest, false, true)
	disable()
	delete()
EndEvent