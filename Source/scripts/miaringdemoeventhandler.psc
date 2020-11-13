;/ Decompiled by Champollion V1.0.1
Source   : MiaRingDemoEventHandler.psc
Modified : 2014-12-12 21:53:24
Compiled : 2014-12-12 21:53:25
User     : Ryan
Computer : GUNDAM
/;
scriptName MiaRingDemoEventHandler extends DevourmentEventHandler conditional

;-- Properties --------------------------------------
Int property overrideDialog auto conditional
topic property NotDigestedDialog auto conditional
actor property PredSpeaker auto
Int property digestionUpdate auto conditional
spell property SwallowerPerk auto
actor property Mia auto
topic property DigestedDialog auto conditional
Int property MiaAteYou auto conditional
Int property SwitchLethal auto conditional
Int property playerDead auto conditional
Float property HealthRate auto conditional
Int property guaranteeOverrideIsCanceled auto conditional
topic property DigestionDialog auto conditional

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnSwallow(actor pred, actor prey, Int flags)

	if prey == game.getPlayer() && overrideDialog > 0
		guaranteeOverrideIsCanceled = 0
		HealthRate = game.getPlayer().GetBaseActorValue("HealRate")
		game.getPlayer().SetActorValue("HealRate", 0 as Float)
	endIf
	if prey == game.getPlayer() && MiaAteYou == 1
		Manager.disableEscape(game.getPlayer())
		self.RegisterForSingleUpdate(3 as Float)
		digestionUpdate = 1
	endIf
	if pred == game.getPlayer() && SwitchLethal == 1
		SwitchLethal = 0
		Manager.SwitchLethal(prey)
	endIf
	if pred == game.getPlayer() && MiaAteYou == 1
		MiaAteYou = 0
		Manager.disableEscape(prey)
	endIf
endFunction

function OnInit()

	utility.wait(10 as Float)
	Manager.registerEventHandler(self as DevourmentEventHandler)
	debug.messageBox("Registered.")
endFunction

; Skipped compiler generated GotoState

function OnPreyDeath(actor pred, actor prey, Int flags)

	if prey == game.getPlayer() && overrideDialog > 0
		game.getPlayer().SetActorValue("HealRate", HealthRate)
		if overrideDialog > 0
			playerDead = 1
			pred.say(DigestedDialog, none, false)
			guaranteeOverrideIsCanceled = 1
			self.RegisterForSingleUpdate(5 as Float)
		endIf
	endIf
	if prey == game.getPlayer() && MiaAteYou == 1
		MiaAteYou = 0
		digestionUpdate = 0
	endIf
endFunction

function OnEscape(actor pred, actor prey, Int flags, Bool oral)

	if prey == game.getPlayer() && overrideDialog > 0
		pred.AddSpell(SwallowerPerk, true)
		game.getPlayer().SetActorValue("HealRate", HealthRate)
		MiaAteYou = 0
		guaranteeOverrideIsCanceled = 1
		self.RegisterForSingleUpdate(10 as Float)
	endIf
endFunction

function OnUpdate()

	if digestionUpdate > 0
		actor pred = Manager.whoAte(game.getPlayer())
		Int ticksToGo = 10
		while ticksToGo > 0
			if game.getPlayer().GetActorValue("Health") > 20 as Float
				Manager.AccelerateDigestion(pred, 1)
				ticksToGo -= 1
			endIf
			if game.getPlayer().GetActorValue("Health") <= 20 as Float
				ticksToGo = 0
			endIf
		endWhile
		self.RegisterForSingleUpdate(3 as Float)
	endIf
	if guaranteeOverrideIsCanceled > 0
		overrideDialog = 0
		playerDead = 0
		guaranteeOverrideIsCanceled = 0
	endIf
endFunction
