;/ Decompiled by Champollion V1.0.1
Source   : DevourmentNameScript.psc
Modified : 2019-01-15 18:10:47
Compiled : 2019-01-15 18:10:48
User     : Rickard
Computer : GAMEMEISTER
/;
scriptName devourmentnamescript extends Quest

;-- Properties --------------------------------------
actor property fakePlayer auto
faction property Winterhold auto
objectreference property HerStomach auto
Quest property MarriageQuest auto
perk property N2 auto
spell property NotThere auto
faction property Falkreath auto
perk property V2 auto
Quest property BreakupQuest auto
Bool property nameChanged auto
perk property SA1 auto
globalvariable property prevDov auto
faction property Markarth auto
faction property PlayerMarriedFaction auto
globalvariable property prevDovBountyRiften auto
faction property FacThief auto
spell property Aura auto
faction property FacBandit auto
faction property DismissedFaction auto
perk property SF auto
faction property FacComp auto
faction property FacThalmor auto
perk property N1 auto
sound property AbsorbFinishSound auto
faction property Riften auto
globalvariable property prevDovBountyDawnstar auto
globalvariable property prevDovBountyWinterhold auto
message property NewPlayerMessage auto
faction property FollowerFaction auto
perk property IS2 auto
perk property SA3 auto
spell property EndoSpell auto
actor property humanRef auto
perk property V4 auto
globalvariable property DevourmentPrevPerkGlobal auto
referencealias property fakePlayerRef auto
ski_configbase property MenuScript auto
faction property FacSilverHand auto
globalvariable property prevDovBountyWhiterun auto
faction property FacWarlock auto
faction property Morthal auto
spell property devourment auto
faction property FacWarlockAlly auto
globalvariable property NoRaceMenu auto
faction property FacVampThrall auto
spell property SwallowSpell auto
String property newName auto
faction property FacVamp auto
sound property AbsorbSound auto
spell property DevourmentNPC auto
faction property FacDB auto
actor property beastRef auto
faction property FacNecro auto
faction property Dawnstar auto
perk property SB auto
Quest property MarriageFINQuest auto
faction property FacBanditAlly auto
Quest property WeddingQuest auto
faction property FacBanditFriend auto
referencealias property FollowerAlias auto
globalvariable property prevDovBountyMorthal auto
effectshader property AbsorbVisual auto
String property lastName auto
perk property V1 auto
globalvariable property prevDovBountySolitude auto
faction property Whiterun auto
perk property SA2 auto
globalvariable property prevDovBountyFalkreath auto
message property NewPlayerMessageToo auto
perk property V3 auto
globalvariable property prevDovBountyMarkarth auto
dialoguefollowerscript property FollowerScript auto
perk property V5 auto
faction property FacWinterhold auto
perk property SS auto
explosion property AbsorbExplosion auto
perk property IS3 auto
globalvariable property DevourmentPerkGlobal auto
perk property SwallowCorpse auto
faction property FacForsworn auto
globalvariable property prevDovBountyWindhelm auto
globalvariable property NumVictims auto
perk property IS1 auto
faction property Solitude auto
spell property devourmentNL auto
perk[] property AllThePerks auto
faction property Windhelm auto
perk property CE auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function checkPlayerSpells()

	actor theplayer = game.GetPlayer()
	if theplayer.getLeveledActorBase().getSex() == 1
		if !theplayer.hasSpell(SwallowSpell as form)
			theplayer.addSpell(SwallowSpell, true)
		endIf
		if !theplayer.hasSpell(EndoSpell as form)
			theplayer.addSpell(EndoSpell, true)
		endIf
		if !theplayer.hasPerk(SwallowCorpse)
			theplayer.addPerk(SwallowCorpse)
		endIf
	endIf
	if !theplayer.hasSpell(Aura as form)
		theplayer.addSpell(Aura, true)
	endIf
endFunction

Bool function checkSkeleton()

	if game.GetPlayer().getLeveledActorBase().getSex() != 1
		return !netimmerse.hasNode(game.GetPlayer() as objectreference, "Devourment Belly Root", false)
	else
		return netimmerse.hasNode(game.GetPlayer() as objectreference, "Devourment Belly Root", false)
	endIf
endFunction

; Skipped compiler generated GotoState

function CheckDependencies()

	if !game.GetModByName("Devourment.esp")
		debug.MessageBox("WARNING: Skyrim Script Extender is not running. Devourment will not function properly!")
	elseIf !self.checkSkeleton()
		debug.MessageBox("WARNING: Incompatible skeleton detected. Devourment will not function properly!")
	endIf
	if !game.GetModByName("SkyUI.esp")
		debug.MessageBox("WARNING: SkyUI is not installed. Devourment will not function properly!")
	endIf
	self.checkPlayerSpells()
endFunction

function SetPlayerName()

	if nameChanged
		game.GetPlayer().getLeveledActorBase().setName(newName)
	endIf
endFunction

function OnInit()

	self.SetPlayerName()
	self.CheckDependencies()
endFunction

function SwitchPlayer(actor thePred, actor thePrey)

	AbsorbVisual.play(thePred as objectreference, 5 as Float)
	AbsorbSound.play(thePred as objectreference)
	lastName = thePrey.getActorBase().getName()
	newName = thePred.getLeveledActorBase().getName()
	nameChanged = true
	self.SetPlayerName()
	fakePlayer.getLeveledActorBase().setName(lastName)
	fakePlayer.setName(lastName)
	fakePlayerRef.forceRefTo(fakePlayer as objectreference)
	actorbase playerBase = thePrey.getActorBase()
	actorbase predBase = thePred.getLeveledActorBase()
	prevDov.setValue(prevDov.getValue() + 1 as Float)
	playerBase.setHairColor(predBase.getHairColor())
	Int whichPart = 0
	while whichPart < 32
		headpart thePart = predBase.getNthHeadPart(whichPart)
		playerBase.setNthHeadPart(thePart, whichPart)
		if thePart
			thePrey.changeHeadPart(thePart)
		endIf
		thePrey.queueNiNodeUpdate()
		whichPart += 1
	endWhile
	playerBase.setFacePreset(predBase.getFacePreset(0), 0)
	playerBase.setFacePreset(predBase.getFacePreset(1), 1)
	playerBase.setFacePreset(predBase.getFacePreset(2), 2)
	playerBase.setFacePreset(predBase.getFacePreset(3), 3)
	Int whichMorph = 0
	while whichMorph < 19
		playerBase.setFaceMorph(predBase.getFaceMorph(whichMorph), whichMorph)
		whichMorph += 1
	endWhile
	thePrey.regenerateHead()
	Int playerWeight = playerBase.getWeight() as Int
	Int newPlayerWeight = predBase.getWeight() as Int
	if playerWeight != newPlayerWeight
		playerBase.setWeight(newPlayerWeight as Float)
		Float neck = (newPlayerWeight / 100 - playerWeight / 100) as Float
		thePrey.updateWeight(neck)
	endIf
	if thePrey.getRace() != thePred.getRace()
		thePrey.setRace(thePred.getRace())
	endIf
	Int spellNum = 0
	spellNum = 0
	Int predSpells = thePred.getSpellCount()
	while spellNum < predSpells
		thePrey.addSpell(thePred.getNthSpell(spellNum), false)
		spellNum += 1
	endWhile
	spellNum = 0
	predSpells = predBase.getSpellCount()
	while spellNum < predSpells
		thePrey.addSpell(predBase.getNthSpell(spellNum), false)
		spellNum += 1
	endWhile
	thePrey.addSpell(devourment, false)
	thePrey.addSpell(devourmentNL, false)
	thePrey.addSpell(DevourmentNPC, false)
	Int[] slotMasks = new Int[29]
	slotMasks[0] = 1
	slotMasks[1] = 2
	slotMasks[2] = 4
	slotMasks[3] = 8
	slotMasks[4] = 16
	slotMasks[5] = 32
	slotMasks[6] = 64
	slotMasks[7] = 128
	slotMasks[8] = 256
	slotMasks[9] = 512
	slotMasks[10] = 1024
	slotMasks[11] = 2048
	slotMasks[12] = 4096
	slotMasks[13] = 8192
	slotMasks[14] = 16384
	slotMasks[15] = 32768
	slotMasks[16] = 131072
	slotMasks[17] = 262144
	slotMasks[18] = 524288
	slotMasks[19] = 4194304
	slotMasks[20] = 8388608
	slotMasks[21] = 16777216
	slotMasks[22] = 33554432
	slotMasks[23] = 67108864
	slotMasks[24] = 134217728
	slotMasks[25] = 268435456
	slotMasks[26] = 536870912
	slotMasks[27] = 1073741824
	slotMasks[28] = -2147483648
	Int whichSlot = 0
	armor[] newSlots = new armor[29]
	while whichSlot < slotMasks.length
		armor replacement = thePred.getWornForm(slotMasks[whichSlot]) as armor
		if replacement
			newSlots[whichSlot] = replacement
		endIf
		whichSlot += 1
	endWhile
	form leftItem = thePred.getEquippedObject(0)
	form rightItem = thePred.getEquippedObject(1)
	form voiceItem = thePred.getEquippedObject(2)
	Int whichPerk = 0
	while whichPerk < AllThePerks.length
		thePrey.removePerk(AllThePerks[whichPerk])
		whichPerk += 1
	endWhile
	game.setPerkPoints(-1 + thePrey.getLevel())
	game.GetPlayer().removePerk(V1)
	game.GetPlayer().removePerk(V2)
	game.GetPlayer().removePerk(V3)
	game.GetPlayer().removePerk(V4)
	game.GetPlayer().removePerk(V5)
	game.GetPlayer().removePerk(IS1)
	game.GetPlayer().removePerk(IS2)
	game.GetPlayer().removePerk(IS3)
	game.GetPlayer().removePerk(SA1)
	game.GetPlayer().removePerk(SA2)
	game.GetPlayer().removePerk(SA3)
	game.GetPlayer().removePerk(N1)
	game.GetPlayer().removePerk(N2)
	game.GetPlayer().removePerk(CE)
	game.GetPlayer().removePerk(SS)
	game.GetPlayer().removePerk(SB)
	game.GetPlayer().removePerk(SF)
	String[] AVArray = new String[33]
	AVArray[0] = "Health"
	AVArray[1] = "Magicka"
	AVArray[2] = "Stamina"
	AVArray[3] = "OneHanded"
	AVArray[4] = "TwoHanded"
	AVArray[5] = "Marksman"
	AVArray[6] = "Block"
	AVArray[7] = "Smithing"
	AVArray[8] = "HeavyArmor"
	AVArray[9] = "LightArmor"
	AVArray[10] = "Pickpocket"
	AVArray[11] = "Lockpicking"
	AVArray[12] = "Sneak"
	AVArray[13] = "Alchemy"
	AVArray[14] = "Speechcraft"
	AVArray[15] = "Alteration"
	AVArray[16] = "Conjuration"
	AVArray[17] = "Destruction"
	AVArray[18] = "Illusion"
	AVArray[19] = "Restoration"
	AVArray[20] = "Enchanting"
	AVArray[21] = "DiseaseResist"
	AVArray[22] = "PoisonResist"
	AVArray[23] = "FireResist"
	AVArray[24] = "ElectricResist"
	AVArray[25] = "FrostResist"
	AVArray[26] = "MagicResist"
	AVArray[27] = "WaterBreathing"
	AVArray[28] = "FavorPointsBonus"
	AVArray[29] = "FavorsPerDayTimer"
	AVArray[30] = "FavorActive"
	AVArray[31] = "Fame"
	AVArray[32] = "Infamy"
	Int which = 0
	while which < AVArray.length
		thePrey.setAV(AVArray[which], thePred.getBaseAV(AVArray[which]))
		thePrey.forceAV(AVArray[which], thePred.getBaseAV(AVArray[which]))
		which += 1
	endWhile
	Int baseDevourment = thePred.getBaseAV("Variable05") as Int + thePred.getLevel()
	Int totalDevourment = thePred.getAV("Variable05") as Int + thePred.getLevel()
	if baseDevourment < 85
		thePrey.setAV("Variable05", baseDevourment as Float)
	else
		thePrey.setAV("Variable05", 85 as Float)
	endIf
	if totalDevourment < 85
		thePrey.forceAV("Variable05", totalDevourment as Float)
	else
		thePrey.forceAV("Variable05", 85 as Float)
	endIf
	DevourmentPerkGlobal.setValue(DevourmentPrevPerkGlobal.getValue())
	thePrey.removeFromFaction(FacBanditAlly)
	thePrey.removeFromFaction(FacBandit)
	thePrey.removeFromFaction(FacBanditFriend)
	thePrey.removeFromFaction(FacWinterhold)
	thePrey.removeFromFaction(FacComp)
	thePrey.removeFromFaction(FacDB)
	thePrey.removeFromFaction(FacForsworn)
	thePrey.removeFromFaction(FacNecro)
	thePrey.removeFromFaction(FacSilverHand)
	thePrey.removeFromFaction(FacThalmor)
	thePrey.removeFromFaction(FacThief)
	thePrey.removeFromFaction(FacVamp)
	thePrey.removeFromFaction(FacVampThrall)
	thePrey.removeFromFaction(FacWarlockAlly)
	thePrey.removeFromFaction(FacWarlock)
	if thePred.isInFaction(FacBanditAlly) || thePred.isInFaction(FacBandit) || thePred.isInFaction(FacBanditFriend)
		thePrey.addToFaction(FacBandit)
	endIf
	if thePred.isInFaction(FacWinterhold)
		thePrey.addToFaction(FacWinterhold)
	endIf
	if thePred.isInFaction(FacComp)
		thePrey.addToFaction(FacComp)
	endIf
	if thePred.isInFaction(FacDB)
		thePrey.addToFaction(FacDB)
	endIf
	if thePred.isInFaction(FacForsworn)
		thePrey.addToFaction(FacForsworn)
	endIf
	if thePred.isInFaction(FacNecro)
		thePrey.addToFaction(FacNecro)
	endIf
	if thePred.isInFaction(FacSilverHand)
		thePrey.addToFaction(FacSilverHand)
	endIf
	if thePred.isInFaction(FacThalmor)
		thePrey.addToFaction(FacThalmor)
	endIf
	if thePred.isInFaction(FacThief)
		thePrey.addToFaction(FacThief)
	endIf
	if thePred.isInFaction(FacVamp) || thePred.isInFaction(FacVampThrall)
		thePrey.addToFaction(FacVamp)
	endIf
	if thePred.isInFaction(FacWarlock) || thePred.isInFaction(FacWarlockAlly)
		thePrey.addToFaction(FacWarlock)
	endIf
	prevDovBountyWhiterun.setValue(Whiterun.getCrimeGold() as Float)
	Whiterun.setCrimeGold(0)
	Whiterun.setCrimeGoldViolent(0)
	prevDovBountyWindhelm.setValue(Windhelm.getCrimeGold() as Float)
	Windhelm.setCrimeGold(0)
	Windhelm.setCrimeGoldViolent(0)
	prevDovBountyRiften.setValue(Riften.getCrimeGold() as Float)
	Riften.setCrimeGold(0)
	Riften.setCrimeGoldViolent(0)
	prevDovBountyMarkarth.setValue(Markarth.getCrimeGold() as Float)
	Markarth.setCrimeGold(0)
	Markarth.setCrimeGoldViolent(0)
	prevDovBountyMorthal.setValue(Morthal.getCrimeGold() as Float)
	Morthal.setCrimeGold(0)
	Morthal.setCrimeGoldViolent(0)
	prevDovBountyWinterhold.setValue(Winterhold.getCrimeGold() as Float)
	Winterhold.setCrimeGold(0)
	Winterhold.setCrimeGoldViolent(0)
	prevDovBountySolitude.setValue(Solitude.getCrimeGold() as Float)
	Solitude.setCrimeGold(0)
	Solitude.setCrimeGoldViolent(0)
	prevDovBountyDawnstar.setValue(Dawnstar.getCrimeGold() as Float)
	Dawnstar.setCrimeGold(0)
	Dawnstar.setCrimeGoldViolent(0)
	prevDovBountyFalkreath.setValue(Falkreath.getCrimeGold() as Float)
	Falkreath.setCrimeGold(0)
	Falkreath.setCrimeGoldViolent(0)
	FollowerScript.dismissFollower(0, 0)
	BreakupQuest.start()
	BreakupQuest.setStage(0)
	BreakupQuest.completeQuest()
	MarriageFINQuest.stop()
	WeddingQuest.stop()
	game.GetPlayer().removeFromFaction(PlayerMarriedFaction)
	MarriageQuest.start()
	MarriageQuest.setStage(10)
	MarriageQuest.setStage(15)
	thePred.removeAllItems(thePrey as objectreference, false, false)
	if voiceItem
		thePrey.equipItemEx(voiceItem, 2, false, true)
	endIf
	if rightItem
		thePrey.equipItemEx(rightItem, 1, false, true)
	endIf
	if leftItem
		thePrey.equipItemEx(leftItem, 0, false, true)
	endIf
	whichSlot = 0
	while whichSlot < newSlots.length
		if newSlots[whichSlot]
			thePrey.equipItem(newSlots[whichSlot] as form, false, true)
		endIf
		whichSlot += 1
	endWhile
	thePred.placeAtMe(AbsorbExplosion as form, 1, false, false)
	AbsorbFinishSound.play(thePred as objectreference)
	thePred.disable(false)
	thePrey.moveTo(thePred as objectreference, 0.000000, 0.000000, 0.000000, true)
	thePred.moveTo(HerStomach, 0.000000, 0.000000, 0.000000, true)
	thePrey.removeSpell(NotThere)
	thePrey.setAlpha(100 as Float, false)
	thePrey.setGhost(false)
	thePrey.setPlayerControls(true)
	thePrey.enableAI(true)
	game.setCameraTarget(thePrey)
	game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
	thePrey.queueNiNodeUpdate()
	if NoRaceMenu.getValue() != 0 as Float
		NewPlayerMessageToo.show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	else
		NewPlayerMessage.show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		game.ShowLimitedRaceMenu()
	endIf
	thePred.stopCombat()
	thePred.stopCombatAlarm()
	thePrey.stopCombat()
	thePrey.stopCombatAlarm()
endFunction
