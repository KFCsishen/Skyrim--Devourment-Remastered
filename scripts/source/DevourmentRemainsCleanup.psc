scriptName DevourmentRemainsCleanup extends ObjectReference
import Logging


ObjectReference property DungGathererChest auto


float property UpdateInterval = 24.0 autoreadonly
String property PREFIX = "DevourmentRemainsCleanup" autoreadonly
Bool started = false

Event OnUpdateGameTime()
    self.removeAllItems(DungGathererChest, false, true)
    self.disable(false)
    self.delete()
    
endEvent

Event OnLoad()
    self.RegisterForSingleUpdateGameTime(UpdateInterval)
endEvent
