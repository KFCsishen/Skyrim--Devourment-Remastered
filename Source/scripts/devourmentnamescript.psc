Scriptname DevourmentNameScript extends Quest  

Bool Property nameChanged Auto
String Property newName Auto
String Property lastName Auto
Spell Property NotThere Auto
Spell Property SwallowSpell Auto
Spell Property EndoSpell Auto
Spell Property Aura Auto
Message Property NewPlayerMessage Auto
Message Property NewPlayerMessageToo Auto
Perk[] Property AllThePerks Auto
ObjectReference Property HerStomach Auto
Spell Property devourment Auto
Spell Property devourmentNL Auto
EffectShader Property AbsorbVisual Auto
Explosion Property AbsorbExplosion Auto
Sound Property AbsorbSound Auto
Sound Property AbsorbFinishSound Auto
GlobalVariable Property prevDov Auto
GlobalVariable Property DevourmentPerkGlobal Auto
GlobalVariable Property DevourmentPrevPerkGlobal Auto
GlobalVariable Property NumVictims Auto
GlobalVariable Property NoRaceMenu Auto
Perk Property V1 Auto
Perk Property V2 Auto
Perk Property V3 Auto
Perk Property V4 Auto
Perk Property V5 Auto
Perk Property IS1 Auto
Perk Property IS2 Auto
Perk Property IS3 Auto
Perk Property SA1 Auto
Perk Property SA2 Auto
Perk Property SA3 Auto
Perk Property N1 Auto
Perk Property N2 Auto
Perk Property CE Auto
Perk Property SS Auto
Perk Property SB Auto
Perk Property SF Auto
Perk Property SwallowCorpse Auto
GlobalVariable Property prevDovBountyWhiterun Auto
GlobalVariable Property prevDovBountyWindhelm Auto
GlobalVariable Property prevDovBountyRiften Auto
GlobalVariable Property prevDovBountyMarkarth Auto
GlobalVariable Property prevDovBountyMorthal Auto
GlobalVariable Property prevDovBountySolitude Auto
GlobalVariable Property prevDovBountyWinterhold Auto
GlobalVariable Property prevDovBountyDawnstar Auto
GlobalVariable Property prevDovBountyFalkreath Auto
Faction Property Whiterun Auto
Faction Property Windhelm Auto
Faction Property Riften Auto
Faction Property Markarth Auto
Faction Property Morthal Auto
Faction Property Solitude Auto
Faction Property Winterhold Auto
Faction Property Dawnstar Auto
Faction Property Falkreath Auto
Actor Property fakePlayer Auto
ReferenceAlias Property fakePlayerRef Auto
ReferenceAlias Property FollowerAlias Auto
Faction Property DismissedFaction Auto
Faction Property FollowerFaction Auto
DialogueFollowerScript Property FollowerScript Auto
Quest Property BreakupQuest Auto
Quest Property MarriageQuest Auto
Quest Property MarriageFINQuest Auto
Quest Property WeddingQuest Auto
Faction Property PlayerMarriedFaction Auto
Faction Property FacBanditAlly Auto
Faction Property FacBandit Auto
Faction Property FacBanditFriend Auto
Faction Property FacWinterhold Auto
Faction Property FacComp Auto
Faction Property FacDB Auto
Faction Property FacForsworn Auto
Faction Property FacNecro Auto
Faction Property FacSilverHand Auto
Faction Property FacThalmor Auto
Faction Property FacThief Auto
Faction Property FacVamp Auto
Faction Property FacVampThrall Auto
Faction Property FacWarlockAlly Auto
Faction Property FacWarlock Auto
Spell Property DevourmentNPC Auto
SKI_ConfigBase Property MenuScript Auto
Actor Property humanRef Auto
Actor Property beastRef Auto

Event OnInit()
	SetPlayerName()
	CheckDependencies()
EndEvent

Function SetPlayerName()
	if(nameChanged)
		Game.GetPlayer().getLeveledActorBase().setName(newName)
	endif
EndFunction

Function CheckDependencies()
	if(!Game.GetModByName("Devourment.esp"))
		Debug.MessageBox("WARNING: Skyrim Script Extender is not running. Devourment will not function properly!")
	else
		if(!checkSkeleton())
			Debug.MessageBox("WARNING: Incompatible skeleton detected. Devourment will not function properly!")
		endif
	endif
	if(!Game.GetModByName("SkyUI.esp"))
		Debug.MessageBox("WARNING: SkyUI is not installed. Devourment will not function properly!")
	endif
	checkPlayerSpells()
EndFunction

Function SwitchPlayer(Actor thePred, Actor thePrey)

				absorbVisual.play(thePred,5)
				absorbSound.play(thePred)
				; player takes her name
; Debug.messageBox("Name changed")
				lastName=thePrey.getActorBase().getName()
				newName=thePred.getLeveledActorBase().getName()
				nameChanged=true
				setPlayerName()
				fakePlayer.getLeveledActorBase().setName(lastName)
				fakePlayer.setName(lastName)
				fakePlayerRef.forceRefTo(fakePlayer)
				ActorBase playerBase=thePrey.getActorBase()
				ActorBase predBase=thePred.getLeveledActorBase()
				prevDov.setValue(prevDov.getValue()+1)
				; numVictims.setValue(numVictims.getValue()+1)				

				; No sex change function? Really?
				; if(playerBase.getSex()==0)
				;	playerBase.changeSex()
				; endif

				; hair color
				playerBase.setHairColor(predBase.getHairColor())
; Debug.messageBox("Hair color changed")

				; head parts
				int whichPart=0
				while(whichPart<32)
					HeadPart thePart=predBase.getNthHeadPart(whichPart)
					playerBase.setNthHeadPart(thePart,whichPart)
					if(thePart)
						thePrey.changeHeadPart(thePart)
					endif
					thePrey.queueNiNodeUpdate()
					whichPart=whichPart+1
				endWhile
				; playerBase.setFaceTextureSet(predBase.getFaceTextureSet())
; Debug.messageBox("Head parts changed")
				
				; presets
				playerBase.setFacePreset(predBase.getFacePreset(0),0)
				playerBase.setFacePreset(predBase.getFacePreset(1),1)
				playerBase.setFacePreset(predBase.getFacePreset(2),2)
				playerBase.setFacePreset(predBase.getFacePreset(3),3)
; Debug.messageBox("Presets changed")				

				; face morphs
				int whichMorph=0
				while(whichMorph<19)
					playerBase.setFaceMorph(predBase.getFaceMorph(whichMorph),whichMorph)
					whichMorph=whichMorph+1
				endWhile
				thePrey.regenerateHead()
; Debug.messageBox("Morphs changed")

				; weight
				int playerWeight=playerBase.getWeight() as Int
				int newPlayerWeight=predBase.getWeight() as Int
				if(playerWeight!=newPlayerWeight)
					playerBase.setWeight(newPlayerWeight)
					float neck=(newPlayerWeight/100)-(playerWeight/100)
					thePrey.updateWeight(neck)
					; thePred.QueueNiNodeUpdate()
				endif
; Debug.messageBox("Weight changed")

				; race
				if(thePrey.getRace()!=thePred.getRace())
					thePrey.setRace(thePred.getRace())
; Debug.messageBox("Race changed")
				endif

				; spells
				int spellNum=0
				; int playerSpells=thePrey.getSpellCount()
				; while(spellNum<playerSpells)
				;	Debug.messageBox("Removing spell "+thePrey.getNthSpell(spellNum).getName()+" out of "+playerSpells)
				;	if(!thePrey.removeSpell(thePrey.getNthSpell(spellNum)))
				;		Debug.messageBox("Spell removal failed: "+thePrey.getNthSpell(spellNum))
				;	endif
				;	spellNum=spellNum+1
				; endWhile

				spellNum=0
				int predSpells=thePred.getSpellCount()
				while(spellNum<predSpells)
					thePrey.addSpell(thePred.getNthSpell(spellNum),false)
					spellNum=spellNum+1
				endWhile

				spellNum=0
				predSpells=predBase.getSpellCount()
				while(spellNum<predSpells)
					thePrey.addSpell(predBase.getNthSpell(spellNum),false)
					spellNum=spellNum+1
				endWhile

				thePrey.addSpell(devourment, false)
				thePrey.addSpell(devourmentNL, false)
				thePrey.addSpell(devourmentNPC, false)
; Debug.messageBox("Spells changed")

				; items
				int[] slotMasks=new int[29]
				slotMasks[0]=0x00000001
				slotMasks[1]=0x00000002
				slotMasks[2]=0x00000004
				slotMasks[3]=0x00000008
				slotMasks[4]=0x00000010
				slotMasks[5]=0x00000020
				slotMasks[6]=0x00000040
				slotMasks[7]=0x00000080
				slotMasks[8]=0x00000100
				slotMasks[9]=0x00000200
				slotMasks[10]=0x00000400
				slotMasks[11]=0x00000800
				slotMasks[12]=0x00001000
				slotMasks[13]=0x00002000
				slotMasks[14]=0x00004000
				slotMasks[15]=0x00008000
				slotMasks[16]=0x00020000
				slotMasks[17]=0x00040000
				slotMasks[18]=0x00080000
				slotMasks[19]=0x00400000
				slotMasks[20]=0x00800000
				slotMasks[21]=0x01000000
				slotMasks[22]=0x02000000
				slotMasks[23]=0x04000000
				slotMasks[24]=0x08000000
				slotMasks[25]=0x10000000
				slotMasks[26]=0x20000000
				slotMasks[27]=0x40000000
				slotMasks[28]=0x80000000
				int whichSlot=0
				Armor[] newSlots=new Armor[29]
				while(whichSlot<slotMasks.Length)
					Armor replacement = thePred.getWornForm(slotMasks[whichSlot]) as Armor
					if(replacement)
						newSlots[whichSlot]=replacement
					endif
					whichSlot=whichSlot+1
				endWhile

				Form leftItem=thePred.getEquippedObject(0)
				Form rightItem=thePred.getEquippedObject(1)
				Form voiceItem=thePred.getEquippedObject(2)
; Debug.messageBox("Items calculated")

				; perks
				int whichPerk=0
				while(whichPerk<allThePerks.Length)
					thePrey.removePerk(allThePerks[whichPerk])
					whichPerk=whichPerk+1
				endWhile
				Game.setPerkPoints(-1+thePrey.getLevel())
				Game.getPlayer().removePerk(V1)
				Game.getPlayer().removePerk(V2)
				Game.getPlayer().removePerk(V3)
				Game.getPlayer().removePerk(V4)
				Game.getPlayer().removePerk(V5)
				Game.getPlayer().removePerk(IS1)
				Game.getPlayer().removePerk(IS2)
				Game.getPlayer().removePerk(IS3)
				Game.getPlayer().removePerk(SA1)
				Game.getPlayer().removePerk(SA2)
				Game.getPlayer().removePerk(SA3)
				Game.getPlayer().removePerk(N1)
				Game.getPlayer().removePerk(N2)
				Game.getPlayer().removePerk(CE)
				Game.getPlayer().removePerk(SS)
				Game.getPlayer().removePerk(SB)
				Game.getPlayer().removePerk(SF)
; Debug.messageBox("Perks reset")

				; all the freakin actor values
				String[] AVArray = new String[33]
				AVArray[0]="Health"
				AVArray[1]="Magicka"
				AVArray[2]="Stamina"
				AVArray[3]="OneHanded"
				AVArray[4]="TwoHanded"
				AVArray[5]="Marksman"
				AVArray[6]="Block"
				AVArray[7]="Smithing"
				AVArray[8]="HeavyArmor"
				AVArray[9]="LightArmor"
				AVArray[10]="Pickpocket"
				AVArray[11]="Lockpicking"
				AVArray[12]="Sneak"
				AVArray[13]="Alchemy"
				AVArray[14]="Speechcraft"
				AVArray[15]="Alteration"
				AVArray[16]="Conjuration"
				AVArray[17]="Destruction"
				AVArray[18]="Illusion"
				AVArray[19]="Restoration"
				AVArray[20]="Enchanting"
				AVArray[21]="DiseaseResist"
				AVArray[22]="PoisonResist"
				AVArray[23]="FireResist"
				AVArray[24]="ElectricResist"
				AVArray[25]="FrostResist"
				AVArray[26]="MagicResist"
				AVArray[27]="WaterBreathing"
				AVArray[28]="FavorPointsBonus"
				AVArray[29]="FavorsPerDayTimer"
				AVArray[30]="FavorActive"
				AVArray[31]="Fame"
				AVArray[32]="Infamy"

				int which=0
				while(which<AVArray.Length)
					thePrey.setAV(AVArray[which],thePred.getBaseAV(AVArray[which]))
					thePrey.forceAV(AVArray[which],thePred.getBaseAV(AVArray[which]))
					which=which+1
				endWhile

				int baseDevourment=thePred.getBaseAV("Variable05") as Int+thePred.getLevel()
				int totalDevourment=thePred.getAV("Variable05") as Int+thePred.getLevel()
				if(baseDevourment<85)
					thePrey.setAV("Variable05",baseDevourment)
				else
					thePrey.setAV("Variable05",85)
				endif
				if(totalDevourment<85)
					thePrey.forceAV("Variable05",totalDevourment)
				else
					thePrey.forceAV("Variable05",85)
				endif
; Debug.messageBox("Actor values changed")

				; devourment perks
				DevourmentPerkGlobal.setValue(DevourmentPrevPerkGlobal.getValue())

				; factions
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
				if(thePred.isInFaction(FacBanditAlly)||thePred.isInFaction(FacBandit)||thePred.isInFaction(FacBanditFriend))
					thePrey.addToFaction(FacBandit)
				endif
				if(thePred.isInFaction(FacWinterhold))
					thePrey.addToFaction(FacWinterhold)
				endif
				if(thePred.isInFaction(FacComp))
					thePrey.addToFaction(FacComp)
				endif
				if(thePred.isInFaction(FacDB))
					thePrey.addToFaction(FacDB)
				endif
				if(thePred.isInFaction(FacForsworn))
					thePrey.addToFaction(FacForsworn)
				endif
				if(thePred.isInFaction(FacNecro))
					thePrey.addToFaction(FacNecro)
				endif
				if(thePred.isInFaction(FacSilverHand))
					thePrey.addToFaction(FacSilverHand)
				endif
				if(thePred.isInFaction(FacThalmor))
					thePrey.addToFaction(FacThalmor)
				endif
				if(thePred.isInFaction(FacThief))
					thePrey.addToFaction(FacThief)
				endif
				if(thePred.isInFaction(FacVamp)||thePred.isInFaction(FacVampThrall))
					thePrey.addToFaction(FacVamp)
				endif
				if(thePred.isInFaction(FacWarlock)||thePred.isInFaction(FacWarlockAlly))
					thePrey.addToFaction(FacWarlock)
				endif

				; bounties
				prevDovBountyWhiterun.setValue(Whiterun.getCrimeGold())
				whiterun.setCrimeGold(0)
				whiterun.setCrimeGoldViolent(0)
				prevDovBountyWindhelm.setValue(Windhelm.getCrimeGold())
				windhelm.setCrimeGold(0)
				windhelm.setCrimeGoldViolent(0)
				prevDovBountyRiften.setValue(Riften.getCrimeGold())
				Riften.setCrimeGold(0)
				Riften.setCrimeGoldViolent(0)
				prevDovBountyMarkarth.setValue(Markarth.getCrimeGold())
				Markarth.setCrimeGold(0)
				Markarth.setCrimeGoldViolent(0)
				prevDovBountyMorthal.setValue(Morthal.getCrimeGold())
				Morthal.setCrimeGold(0)
				Morthal.setCrimeGoldViolent(0)
				prevDovBountyWinterhold.setValue(Winterhold.getCrimeGold())
				winterhold.setCrimeGold(0)
				winterhold.setCrimeGoldViolent(0)
				prevDovBountySolitude.setValue(Solitude.getCrimeGold())
				solitude.setCrimeGold(0)
				solitude.setCrimeGoldViolent(0)
				prevDovBountyDawnstar.setValue(Dawnstar.getCrimeGold())
				dawnstar.setCrimeGold(0)
				dawnstar.setCrimeGoldViolent(0)
				prevDovBountyFalkreath.setValue(falkreath.getCrimeGold())
				falkreath.setCrimeGold(0)
				falkreath.setCrimeGoldViolent(0)

				; followers
				;/Actor formerFollower=FollowerAlias.getActorRef() as Actor
				formerFollower.AddToFaction(DismissedFaction)
				formerFollower.SetPlayerTeammate(false)
				formerFollower.RemoveFromFaction(followerFaction)
				formerFollower.SetAV("WaitingForPlayer", 0)/;
				FollowerScript.dismissFollower(0,0)

				; remove spouse
				BreakupQuest.start()
				BreakupQuest.setStage(0)
				BreakupQuest.completeQuest()
				MarriageFINQuest.stop()
				WeddingQuest.stop()
				Game.GetPlayer().RemoveFromFaction(PlayerMarriedFaction)
				MarriageQuest.start()
				MarriageQuest.setStage(10)
				MarriageQuest.setStage(15)

				thePred.removeAllItems(thePrey)
				if(voiceItem)
					thePrey.equipItemEx(voiceItem, 2)
				endif
				if(rightItem)
					thePrey.equipItemEx(rightItem, 1)
				endif
				if(leftItem)
					thePrey.equipItemEx(leftItem, 0)
				endif
				whichSlot=0
				while(whichSlot<newSlots.Length)
					if(newSlots[whichSlot])
						thePrey.equipItem(newSlots[whichSlot], false, true)
					endif
					whichSlot=whichSlot+1
				endWhile
; Debug.messageBox("Items changed")

				thePred.placeAtMe(absorbExplosion)
				absorbFinishSound.play(thePred)

				thePred.disable()
				thePrey.moveTo(thePred)
				thePred.moveTo(HerStomach)
				thePrey.removeSpell(NotThere)
				thePrey.setAlpha(100)
				thePrey.setGhost(false)
				thePrey.setPlayerControls(true)
				thePrey.enableAI(true)
				Game.setCameraTarget(thePrey)
				Game.EnablePlayerControls()
				thePrey.queueNiNodeUpdate()

				if(NoRaceMenu.getValue()!=0)
					newPlayerMessageToo.show()
				else
					newPlayerMessage.show()
					Game.ShowLimitedRaceMenu()
				endif

				thePred.stopCombat()
				thePred.stopCombatAlarm()
				thePrey.stopCombat()
				thePrey.stopCombatAlarm()
EndFunction

bool Function checkSkeleton()
	if(Game.getPlayer().getLeveledActorBase().getSex()!=1)
		return !NetImmerse.hasNode(Game.getPlayer(), "Devourment Belly Root", false)
	else
		; Debug.messageBox(NetImmerse.hasNode(Game.getPlayer(), "Devourment Belly Root", false))
		; Debug.messageBox(!NetImmerse.hasNode(Game.getPlayer(), "NPC GenitalsBase [GenBase]", false))
		return NetImmerse.hasNode(Game.getPlayer(), "Devourment Belly Root", false); && !NetImmerse.hasNode(Game.getPlayer(), "NPC GenitalsBase [GenBase]", false)
	endif
	; bool humanSkeleton=NetImmerse.hasNode(humanRef, "Devourment Belly Root", false) && !NetImmerse.hasNode(humanRef, "NPC GenitalsBase [GenBase]", false)
	; Debug.messageBox(NetImmerse.hasNode(humanRef, "Devourment Belly Root", false))
	; Debug.messageBox(!NetImmerse.hasNode(humanRef, "NPC GenitalsBase [GenBase]", false))
	; bool beastSkeleton=NetImmerse.hasNode(beastRef, "Devourment Belly Root", false) && !NetImmerse.hasNode(beastRef, "NPC GenitalsBase [GenBase]", false)
	; return humanSkeleton && beastSkeleton
EndFunction

Function checkPlayerSpells()
	Actor theplayer=Game.getPlayer()
	if(thePlayer.getLeveledActorBase().getSex()==1)
		if(!thePlayer.hasSpell(SwallowSpell))
			ThePlayer.addSpell(SwallowSpell)
		endif
		if(!thePlayer.hasSpell(EndoSpell))
			ThePlayer.addSpell(EndoSpell)
		endif
		if(!thePlayer.hasPerk(SwallowCorpse))
			ThePlayer.addPerk(SwallowCorpse)
		endif
	endif
	if(!thePlayer.hasSpell(Aura))
		ThePlayer.addSpell(Aura, true)
	endif
EndFunction