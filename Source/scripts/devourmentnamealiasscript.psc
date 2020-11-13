Scriptname DevourmentNameAliasScript extends ReferenceAlias  

DevourmentNameScript Property QuestScript Auto
 
Event OnPlayerLoadGame()
	QuestScript.SetPlayerName()
	QuestScript.CheckDependencies()
EndEvent