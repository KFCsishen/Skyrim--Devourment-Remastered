Scriptname DevourmentOptionScript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Debug.sendAnimationEvent(Game.getPlayer(), "mBegin")
	if(Game.GetPlayer().GetLeveledActorBase().GetSex()==1)
		showMainMenu()
	else
		ShowOptionMenu()
	endif
EndEvent

Function ShowMainMenu()
	Actor player=Game.GetPlayer()
	int numVictims=(Victims.getValue()+prevPerkPoints.getValue()*(3+0.5*(-1+prevPerkPoints.getValue()))) as int
	float swallowBonus=15+Player.getAV("Variable05")+Player.getAV("FavorActive")
	if(Player.hasPerk(V5))
		swallowBonus*=2
	elseif(Player.hasPerk(V4))
		swallowBonus*=1.8
	elseif(Player.hasPerk(V3))
		swallowBonus*=1.6
	elseif(Player.hasPerk(V2))
		swallowBonus*=1.4
	elseif(Player.hasPerk(V1))
		swallowBonus*=1.2
	endif
	float Damage=3.0*(0.5+(15+Player.getAV("Variable05"))/100)
	if(Player.hasPerk(SA3))
		Damage*=2.5
	elseif(Player.hasPerk(SA2))
		Damage*=2
	elseif(Player.hasPerk(SA1))
		Damage*=1.5
	endif
	Damage*=(1+Player.getAV("Fame")/100)
	float MaxTime=8.0*(1 + (15+Player.getAV("Variable05"))/100.0)
	if(Player.hasPerk(IS3))
		MaxTime*=2.5
	elseif(Player.hasPerk(IS2))
		MaxTime*=2
	elseif(Player.hasPerk(IS1))
		MaxTime*=1.5
	endif
	MaxTime=MaxTime+Player.getAV("Infamy")
	int result=MainMenu.show(Player.getAV("Variable05")+15,PerkPoints.getValue(),numVictims,swallowBonus,15+Player.getAV("Variable05")+Player.getAV("FavorPointsBonus"),Damage,MaxTime,Player.getAV("FavorsPerDay"))
	if(result==0)
		showPerkMenu()
	elseif(result==1)
		showOptionMenu()
	elseif(result==2)
		showVictimRaceMenu()
	endif
EndFunction

Function ShowPerkMenu()
	Actor player=Game.GetPlayer()
	float vR
	float ISR
	float SAR
	float NR
	float CER
	float SSR
	float SBR
	float SFR

	if(player.hasPerk(V5))
		vR=5
	elseif(player.hasPerk(V4))
		vR=4
	elseif(player.hasPerk(V3))
		vR=3
	elseif(player.hasPerk(V2))
		vR=2
	elseif(player.hasPerk(V1))
		vR=1
	endif

	if(player.hasPerk(IS3))
		ISR=3
	elseif(player.hasPerk(IS2))
		ISR=2
	elseif(player.hasPerk(IS1))
		ISR=1
	endif

	if(player.hasPerk(SA3))
		SAR=3
	elseif(player.hasPerk(SA2))
		SAR=2
	elseif(player.hasPerk(SA1))
		SAR=1
	endif

	if(player.hasPerk(N2))
		NR=2
	elseif(player.hasPerk(N1))
		NR=1
	endif

	if(player.hasPerk(CE))
		CER=1
	endif

	if(player.hasPerk(SS))
		SSR=1
	endif

	if(player.hasPerk(SB))
		SBR=1
	endif

	if(player.hasPerk(SF))
		SFR=1
	endif

	int result=PerkMenu.show(vR,ISR,SAR,NR,CER,SSR,SBR,SFR,PerkPoints.getValue())
	if(result==0)
		ShowVMenu()
	elseif(result==1)
		ShowISMenu()
	elseif(result==2)
		ShowSAMenu()
	elseif(result==3)
		ShowNMenu()
	elseif(result==4)
		ShowCEMenu()
	elseif(result==5)
		ShowSSMenu()
	elseif(result==6)
		ShowSBMenu()
	elseif(result==7)
		ShowSFMenu()
	else
		ShowMainMenu()
	endif
EndFunction

Function ShowOptionMenu()
	int result=OptionMenu.show(ScatGlobal.getValue(),SkillGainGlobal.getValue(),SwallowChanceGlobal.getValue(),DTimeGlobal.getValue(),KillEssential.getValue(),NPCPreds.getValue(),MinDigestion.getValue(),NPCBOnus.getValue())
	if(result==0)
		ShowScatMenu()
	elseif(result==1)
		ShowSkillMenu()
	elseif(result==2)
		ShowSwallowMenu()
	elseif(result==3)
		ShowDTimeMenu()
	elseif(result==4)
		if(KillEssential.getValue()==0)
			KillEssential.setValue(1)
		else
			KillEssential.setValue(0)
		endif
		showOptionMenu()
	elseif(result==5)
		showNPCPredMenu()
	elseif(result==6)
		ShowMinDMenu()
	elseif(result==7)
		ShowNPCBonusMenu()
	elseif(Game.GetPlayer().GetLeveledActorBase().GetSex()==1)
		ShowMainMenu()
	endif
EndFunction

Function ShowVMenu()
	Actor player=Game.GetPlayer()
	int result=mV.show()
	if(result==0)
		if(Player.hasPerk(V4))
			if(Player.getAV("Variable05")>=65)
				Player.addPerk(V5)
				Player.removePerk(V4)
				PerkPoints.setValue(-1+PerkPoints.getValue())
				PerkSound.play(Player)
			else
				noSkill.show()
			endif
		elseif(Player.hasPerk(V3))
			if(Player.getAV("Variable05")>=45)
				Player.addPerk(V4)
				Player.removePerk(V3)
				PerkPoints.setValue(-1+PerkPoints.getValue())
				PerkSound.play(Player)
			else
				noSkill.show()
			endif
		elseif(Player.hasPerk(V2))
			if(Player.getAV("Variable05")>=25)
				Player.addPerk(V3)
				Player.removePerk(V2)
				PerkPoints.setValue(-1+PerkPoints.getValue())
				PerkSound.play(Player)
			else
				noSkill.show()
			endif
		elseif(Player.hasPerk(V1))
			if(Player.getAV("Variable05")>=5)
				Player.addPerk(V2)
				Player.removePerk(V1)
				PerkPoints.setValue(-1+PerkPoints.getValue())
				PerkSound.play(Player)
			else
				noSkill.show()
			endif
		else
			Player.addPerk(V1)
			PerkPoints.setValue(-1+PerkPoints.getValue())
			PerkSound.play(Player)
		endif
	endif	
	ShowPerkMenu()
EndFunction

Function ShowISMenu()
	Actor player=Game.GetPlayer()
	int result=mIS.show()
	if(result==0)
		if(Player.hasPerk(IS2))
			if(Player.getAV("Variable05")>=60)
				Player.addPerk(IS3)
				Player.removePerk(IS2)
				PerkPoints.setValue(-1+PerkPoints.getValue())
				PerkSound.play(Player)
			else
				noSkill.show()
			endif
		elseif(Player.hasPerk(IS1))
			if(Player.getAV("Variable05")>=35)
				Player.addPerk(IS2)
				Player.removePerk(IS1)
				PerkPoints.setValue(-1+PerkPoints.getValue())
				PerkSound.play(Player)
			else
				noSkill.show()
			endif
		else
			if(Player.getAV("Variable05")>=10)
				Player.addPerk(IS1)
				PerkPoints.setValue(-1+PerkPoints.getValue())
				PerkSound.play(Player)
			else
				noSkill.show()
			endif
		endif
	endif	
	ShowPerkMenu()
EndFunction

Function ShowSAMenu()
	Actor player=Game.GetPlayer()
	int result=mSA.show()
	if(result==0)
		if(Player.hasPerk(SA2))
			if(Player.getAV("Variable05")>=75)
				Player.addPerk(SA3)
				Player.removePerk(SA2)
				PerkPoints.setValue(-1+PerkPoints.getValue())
				PerkSound.play(Player)
			else
				noSkill.show()
			endif
		elseif(Player.hasPerk(SA1))
			if(Player.getAV("Variable05")>=45)
				Player.addPerk(SA2)
				Player.removePerk(SA1)
				PerkPoints.setValue(-1+PerkPoints.getValue())
				PerkSound.play(Player)
			else
				noSkill.show()
			endif
		else
			if(Player.getAV("Variable05")>=15)
				Player.addPerk(SA1)
				PerkPoints.setValue(-1+PerkPoints.getValue())
				PerkSound.play(Player)
			else
				noSkill.show()
			endif
		endif
	endif	
	ShowPerkMenu()
EndFunction

Function ShowNMenu()
	Actor player=Game.GetPlayer()
	int result=mN.show()
	if(result==0)
		if(Player.hasPerk(N1))
			if(Player.getAV("Variable05")>=30)
				Player.addPerk(N2)
				Player.removePerk(N1)
				PerkPoints.setValue(-1+PerkPoints.getValue())
				PerkSound.play(Player)
			else
				noSkill.show()
			endif
		else
			if(Player.getAV("Variable05")>=20)
				Player.addPerk(N1)
				PerkPoints.setValue(-1+PerkPoints.getValue())
				PerkSound.play(Player)
			else
				noSkill.show()
			endif
		endif
	endif	
	ShowPerkMenu()
EndFunction

Function ShowCEMenu()
	Actor player=Game.GetPlayer()
	int result=mCE.show()
	if(result==0)
		if(Player.getAV("Variable05")>=45)
			PerkPoints.setValue(-1+PerkPoints.getValue())
			PerkSound.play(Player)
			Player.addPerk(CE)
		else
			noSkill.show()
		endif
	endif	
	ShowPerkMenu()
EndFunction

Function ShowSSMenu()
	Actor player=Game.GetPlayer()
	int result=mSS.show()
	if(result==0)
		if(Player.getAV("Variable05")>=15)
			PerkPoints.setValue(-1+PerkPoints.getValue())
			PerkSound.play(Player)
			Player.addPerk(SS)
		else
			noSkill.show()
		endif
	endif	
	ShowPerkMenu()
EndFunction

Function ShowSBMenu()
	Actor player=Game.GetPlayer()
	int result=mSB.show()
	if(result==0)
		if(Player.getAV("Variable05")>=55)
			PerkPoints.setValue(-1+PerkPoints.getValue())
			PerkSound.play(Player)
			Player.addPerk(SB)
		else
			noSkill.show()
		endif
	endif	
	ShowPerkMenu()
EndFunction

Function ShowSFMenu()
	Actor player=Game.GetPlayer()
	int result=mSF.show()
	if(result==0)
		if(Player.getAV("Variable05")>=85)
			PerkPoints.setValue(-1+PerkPoints.getValue())
			PerkSound.play(Player)
			Player.addPerk(SF)
		else
			noSkill.show()
		endif
	endif	
	ShowPerkMenu()
EndFunction

Function ShowSkillMenu()
	int result=SkillGainMenu.show()
	SkillGainGlobal.setValue(result)
	ShowOptionMenu()
EndFunction

Function ShowSwallowMenu()
	int result=SwallowChanceMenu.show()
	if(result==0)
		SwallowChanceGlobal.setValue(1)
	elseif(result==1)
		SwallowChanceGlobal.setValue(5)
	elseif(result==2)
		SwallowChanceGlobal.setValue(10)
	else
		SwallowChanceGlobal.setValue(20)
	endif
	ShowOptionMenu()
EndFunction

Function ShowDTimeMenu()
	int result=DTimeMenu.show()
	if(result==1)
		DTimeGlobal.setValue(2.0)
	elseif(result==2)
		DTimeGlobal.setValue(0.5)
	else
		DTimeGlobal.setValue(1)
	endif
	ShowOptionMenu()
EndFunction

Function ShowVictimRaceMenu()
	int result=RaceMenu.show(Bre.getValue()+Imp.getValue()+Nor.getValue()+Red.getValue(), Alt.getValue()+Bos.getValue()+Dun.getValue()+Ors.getValue(), Arg.getValue()+Kha.getValue())
	if(result==0)
		ShowVictimRaceMenuH()
	elseif(result==1)
		ShowVictimRaceMenuE()
	elseif(result==2)
		ShowVictimRaceMenuB()
	else
		ShowMainMenu()
	endif
EndFunction

Function ShowVictimRaceMenuH()
	int result=RaceMenuH.show(Bre.getValue(),Imp.getValue(),Nor.getValue(),Red.getValue())
	ShowVictimRaceMenu()
EndFunction

Function ShowVictimRaceMenuE()
	int result=RaceMenuE.show(Alt.getValue(),Bos.getValue(),Dun.getValue(),Ors.getValue())
	ShowVictimRaceMenu()
EndFunction

Function ShowVictimRaceMenuB()
	int result=RaceMenuB.show(Arg.getValue(),Kha.getValue())
	ShowVictimRaceMenu()
EndFunction

Function ShowMinDMenu()
	int result=MinDMenu.show()
	if(result==0)
		MinDigestion.setValue(5)
	elseif(result==1)
		MinDigestion.setValue(10)
	else
		MinDigestion.setValue(15)
	endif
	ShowOptionMenu()
EndFunction

Function ShowNPCBonusMenu()
	int result=NPCBonusMenu.show()
	if(result==0)
		NPCBonus.setValue(1.0)
	elseif(result==1)
		NPCBonus.setValue(1.5)
	else
		NPCBonus.setValue(2)
	endif
	ShowOptionMenu()
EndFunction

Function ShowScatMenu()
	int result=ScatMenu.show()
	ScatGlobal.setValue(result)
	ShowOptionMenu()
EndFunction

Function ShowNPCPredMenu()
	int result=NPCPredMenu.show()
	NPCPreds.setValue(result)
	ShowOptionMenu()
EndFunction

Message Property MainMenu Auto
Message Property PerkMenu Auto
Message Property OptionMenu Auto
GlobalVariable Property ScatGlobal Auto
GlobalVariable Property PerkPoints Auto
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
Message Property mV Auto
Message Property mIS Auto
Message Property mSA Auto
Message Property mN Auto
Message Property mCE Auto
Message Property mSS Auto
Message Property mSB Auto
Message Property mSF Auto
Sound Property PerkSound Auto
Message Property noSkill Auto

Message Property SkillGainMenu Auto
GlobalVariable Property SkillGainGlobal Auto
Message Property DTimeMenu Auto
GlobalVariable Property DTimeGlobal Auto
Message Property SwallowChanceMenu Auto
GlobalVariable Property SwallowChanceGlobal Auto
GlobalVariable Property KillEssential  Auto  

GlobalVariable Property prevPerkPoints  Auto  

GlobalVariable Property Victims  Auto

Message Property RaceMenu Auto
Message Property RaceMenuH Auto
Message Property RaceMenuE Auto
Message Property RaceMenuB Auto

GlobalVariable Property Alt Auto
GlobalVariable Property Arg Auto
GlobalVariable Property Bos Auto
GlobalVariable Property Bre Auto
GlobalVariable Property Dun Auto
GlobalVariable Property Imp Auto
GlobalVariable Property Kha Auto
GlobalVariable Property Nor Auto
GlobalVariable Property Ors Auto
GlobalVariable Property Red Auto
GlobalVariable Property NPCPreds  Auto  
GlobalVariable Property MinDigestion  Auto 
GlobalVariable Property NPCBonus Auto

Message Property MinDMenu Auto
Message Property NPCBonusMenu Auto
Message Property ScatMenu Auto
Message Property NPCPredMenu Auto