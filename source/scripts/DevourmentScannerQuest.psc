Scriptname DevourmentScannerQuest extends Quest
{
This quest checks NPCs near the player and casts upon them either the 
DevourmentAI spell, or the Devourment Block spell, based on the filter
files and the pred-auto and pred-block factions.
}


Spell Property DevourmentSkipSpell Auto
Spell Property DevourmentAI Auto
Faction Property DevourmentPredAuto Auto
Faction Property DevourmentPredBlock Auto
FormList Property DevourmentPredNPCs Auto
FormList Property DevourmentPredRaces Auto
FormList Property DevourmentPredFactions Auto
FormList Property DevourmentPredKeywords Auto


String Property TAG = "DevourmentScannerTAG" AutoReadOnly
{The tag for JContainers lifetime management.}


Float Property PERIOD = 4.0 Auto
{The number of seconds between updates.}


String Property NPC_FILE = "data\\skse\\devourment\\predator_npcs.json" AutoReadOnly
{The file where the list of predator NPCs is stored.}


String Property RACE_FILE = "data\\skse\\devourment\\predator_races.json" AutoReadOnly
{The file where the list of predator races is stored.}


String Property FACTION_FILE = "data\\skse\\devourment\\predator_factions.json" AutoReadOnly
{The file where the list of predator factions is stored.}


String Property KEYWORD_FILE = "data\\skse\\devourment\\predator_keywords.json" AutoReadOnly
{The file where the list of predator keywords is stored.}


Int Property PredNPCs
{The JContainers array containing the list of predator NPCs.}
	Int Function get()
		_arrPredNPCs = Getter(_arrPredNPCs, NPC_FILE, DevourmentPredNPCs)
		return _arrPredNPCs
	EndFunction
EndProperty
Int _arrPredNPCs


Int Property PredRaces
{The JContainers array containing the list of predator races.}
	Int Function get()
		_arrPredRaces = Getter(_arrPredRaces, RACE_FILE, DevourmentPredRaces)
		return _arrPredRaces
	EndFunction
EndProperty
Int _arrPredRaces


Int Property PredFactions
{The JContainers array containing the list of predator factions.}
	Int Function get()
		_arrPredFactions = Getter(_arrPredFactions, FACTION_FILE, DevourmentPredFactions)
		return _arrPredFactions
	EndFunction
EndProperty
Int _arrPredFactions


Int Property PredKeywords
{The JContainers array containing the list of predator keywords.}
	Int Function get()
		_arrPredKeywords = Getter(_arrPredKeywords, KEYWORD_FILE, DevourmentPredKeywords)
		return _arrPredKeywords
	EndFunction
EndProperty
Int _arrPredKeywords


Function CheckPotentialPredator(ReferenceAlias ref)
{
Checks an actors to see if they are a predator, and then casts the appropriate spell on them.
}
	If (ref == None || ref.GetActorRef() == None)
		;Debug.Trace("DevourmentScannerRef.CheckPotentialPredator(): " + ref + " is invalid.")		
		return
	EndIf

	Debug.Trace("DevourmentScannerRef.CheckPotentialPredator(): " + ref)
	; Most of the checking is already done in the Alias conditions.
	
	Actor subject = ref.GetActorRef()
	ActorBase base = subject.GetLeveledActorBase()
	Debug.Trace("DevourmentScannerRef.CheckPotentialPredator(): subject = " + subject + ", base = " + base)
	
	If subject.IsInFaction(DevourmentPredBlock)
		Debug.Trace("DevourmentScannerRef.CheckPotentialPredator(): " + subject + " is in the block-list.")
		BlockAI(subject)
	ElseIf subject.IsInFaction(DevourmentPredAuto) 
		Debug.Trace("DevourmentScannerRef.CheckPotentialPredator(): " + subject + " is in the accept-list.")
		AddAI(subject)
	ElseIf IsPredatorRef(subject)
		Debug.Trace("DevourmentScannerRef.CheckPotentialPredator(): " + subject + " is in the predator NPC list.")
		AddAI(subject)
	ElseIf IsPredatorNPC(base)
		Debug.Trace("DevourmentScannerRef.CheckPotentialPredator(): " + base + " is in the predator NPC list.")
		AddAI(subject)
	ElseIf IsPredatorRace(base) 
		Debug.Trace("DevourmentScannerRef.CheckPotentialPredator(): " + Base + " is in the predator race list.")
		AddAI(subject)
	ElseIf InPredatorFaction(subject) 
		Debug.Trace("DevourmentScannerRef.CheckPotentialPredator(): " + subject + " is in the predator faction list.")
		AddAI(subject)
	ElseIf HasPredatorKeyword(subject)
		Debug.Trace("DevourmentScannerRef.CheckPotentialPredator(): " + subject + " has a predator keyword.")
		AddAI(subject)
	Else
		Debug.Trace("DevourmentScannerRef.CheckPotentialPredator(): " + subject + " had no matches, blocking.")
		BlockAI(subject)
	EndIf
	
EndFunction


Bool Function isPredatorNPC(ActorBase base) 
{
Tests if an ActorBase is in the predator NPC list.
This Function TRUSTS that it will not be passed a NONE.
}
	Debug.Trace("DevourmentScannerQuest.IsPredatorNPC(" + base + ")")
	
	If JArray.findForm(PredNPCs, base) >= 0
		Debug.Trace("DevourmentScannerQuest.IsPredatorNPC(" + base + ") -- MATCH!")
		Return True
	EndIf

	Return False
EndFunction


Bool Function isPredatorRef(Actor subject) 
{
Tests if an ActorBase is in the predator NPC list.
This Function TRUSTS that it will not be passed a NONE.
}
	Debug.Trace("DevourmentScannerQuest.IsPredatorNPC(" + subject + ")")
	
	If JArray.findForm(PredNPCs, subject) >= 0
		Debug.Trace("DevourmentScannerQuest.IsPredatorNPC(" + subject + ") -- MATCH!")
		Return True
	EndIf

	Return False
EndFunction


Bool Function isPredatorRace(ActorBase base) 
{
Tests if an ActorBase is a member of a predator race.
This Function TRUSTS that it will not be passed a NONE.
}
	Debug.Trace("DevourmentScannerQuest.IsPredatorRace(" + base + ")")

	Race r = base.getRace()
	
	If r != None && JArray.findForm(PredRaces, r) >= 0
		Debug.Trace("DevourmentScannerQuest.IsPredatorRace(" + base + ") -> " + r + " -- MATCH!")
		Return True
	EndIf
	
	Return False
EndFunction


Bool Function inPredatorFaction(Actor subject) 
{
Tests if an Actor is a member of a predator faction.
This Function TRUSTS that it will not be passed a NONE.
}
	Debug.Trace("DevourmentScannerQuest.InPredatorFaction(" + subject + ")")

	int i = 0;
	int count = JValue.count(PredFactions)
	
	While i < count 
		Faction f = JArray.GetForm(PredFactions, i)	as Faction	
		If subject.IsInFaction(f)
			Debug.Trace("DevourmentScannerQuest.InPredatorFaction(" + subject + ") -> " + f + " -- MATCH!")
			Return True
		EndIf
		
		i += 1
	EndWhile
	
	Return False
EndFunction


Bool Function hasPredatorKeyword(Actor subject) 
{
Tests if an Actor has a predator keyword.
This Function TRUSTS that it will not be passed a NONE.
}
	Debug.Trace("DevourmentScannerQuest.hasPredatorKeyword(" + subject + ")")

	int i = 0;
	int count = JValue.count(PredKeywords)
	
	While i < count 
		Keyword k = JArray.GetForm(PredKeywords, i)	as Keyword	
		If subject.HasKeyword(k)
			Debug.Trace("DevourmentScannerQuest.hasPredatorKeyword(" + subject + ") -> " + k + " -- MATCH!")
			Return True
		EndIf
		
		i += 1
	EndWhile
	
	Return False
EndFunction


Event OnInit()
{Starts the update cycle.}
	RegisterForSingleUpdate(PERIOD)
EndEvent


Event OnUpdate()
{Resets the quest, thereby reloading the aliases.}
	self.Stop()
	self.Start();
	RegisterForSingleUpdate(PERIOD)
EndEvent


Function AddAI(Actor subject) 
{
Places the devourmentAI spell on the subject.
This Function TRUSTS that it will not be passed a NONE.
}
	Debug.Trace("DevourmentScannerQuest.AddAI(" + subject + ")")
	DevourmentAI.Cast(subject, none)
EndFunction


Function BlockAI(Actor subject) 
{
Places the skip spell on the subject.
This Function TRUSTS that it will not be passed a NONE.
}
	Debug.Trace("DevourmentScannerQuest.BlockAI(" + subject + ")")
	DevourmentSkipSpell.Cast(subject, none)
EndFunction


Int Function Getter(Int obj, String file, FormList supplemental)
{Does the work of checking if arrays are still loaded, and reading the files and formlists.}
	If !JValue.IsExists(obj)
		obj = JValue.ReleaseAndRetain(obj, JValue.readFromFile(file), TAG)
		If !JValue.IsExists(obj) 
			obj = JValue.ReleaseAndRetain(obj, JArray.object(), TAG)
		EndIf
		JArray.addFromFormList(obj, supplemental)
		return obj
	Else
		Return obj
	EndIf		
EndFunction
