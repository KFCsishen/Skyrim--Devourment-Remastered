Scriptname DevourmentMenuQuestScript extends SKI_ConfigBase  

; positions

int NPCpredPos
int fatePos
int skillPos
int essentialPos
int newPlayerPos
int raceMenuPos
Int ToggleVal
Int DebugJB

int dTimePos
int dMinPos
int sMinPos
int NPCbonusPos
int weightPos

int V1pos
int V2pos
int V3pos
int V4pos
int V5pos
int IS1pos
int IS2pos
int IS3pos
int SA1pos
int SA2pos
int SA3pos
int N1pos
int N2pos
int CEpos
int SSpos
int SFpos
int SBpos

; values

int NPCpred = 1
int fate = 1
int skill = 4
bool essential = false
bool newPlayer=true
bool disableRace=false

float dTime = 1.0
int dMin = 250
int sMin = 5
float NPCbonus = 1.0
int weight = 2

int flag=0

int thePage=0

; globals

GlobalVariable Property NPCpredGlobal Auto
GlobalVariable Property fateGlobal Auto
GlobalVariable Property skillGlobal Auto
GlobalVariable Property essentialGlobal Auto
GlobalVariable Property disableRaceGlobal Auto
GlobalVariable Property version  Auto  
GlobalVariable Property NewPlayerGlobal  Auto  
GlobalVariable Property dTimeGlobal Auto
GlobalVariable Property dMinGlobal Auto
GlobalVariable Property sMinGlobal Auto
GlobalVariable Property NPCbonusGlobal Auto
GlobalVariable Property weightGlobal Auto

GlobalVariable Property Victims  Auto
GlobalVariable Property perkPoints Auto
GlobalVariable Property prevPerkPoints  Auto 
GlobalVariable Property argD Auto
GlobalVariable Property altD Auto
GlobalVariable Property bosD Auto
GlobalVariable Property breD Auto
GlobalVariable Property dunD Auto
GlobalVariable Property impD Auto
GlobalVariable Property khaD Auto
GlobalVariable Property norD Auto
GlobalVariable Property orsD Auto
GlobalVariable Property redD Auto
GlobalVariable Property Debugger Auto
{Handles Debugging}
GlobalVariable Property prevDov Auto

; arrays

string[] NPCpredList
string[] fateList
string[] notList

; perks

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

; sound

Sound Property PerkSound Auto

; spells
Spell Property oldSkillTree Auto
Spell Property Aura Auto
Spell Property SwallowSpell Auto
Spell Property EndoSpell Auto
Shout Property DevourmentShout Auto
Spell Property DeferredAdd Auto
Spell Property RapidDigestion Auto
Spell Property RapidDigestionCompanion Auto
Spell Property Regurgitate Auto

; message
Message Property DevourmentSkillMessage Auto

; quest
DevourmentNameScript Property NameQuest Auto
DevourmentRegistryScript Property ManagerQuest Auto

; actor
Actor Property NotPlayer Auto

int function GetVersion()
	return 70
endFunction

event OnConfigInit()
	Pages = new string[4]
	Pages[0] = "Stats"
	Pages[1] = "Basic"
	Pages[2] = "Tweaks"
	Pages[3] = "Perks"

	notList=new string[5]
	notList[0]="No"
	notList[1]="Mage"
	notList[2]="Warrior"
	notList[3]="Thief"
	notList[4]="All"

	NPCpredList=new string[3]
	NPCpredList[0]="Disabled"
	NPCpredList[1]="Enabled"
	NPCpredList[2]="Followers only"

	fateList=new string[4]
	fateList[0]="Absorbed entirely"
	fateList[1]="Defecated"
	fateList[2]="Absorbed, items regurgitated"
	fateList[3]="Bones"
endEvent

event OnVersionUpdate(int a_version)
	; a_version is the new version, CurrentVersion is the old version
	if (a_version >= 52 && version.getValue()<52)
		version.setValue(52)
		;remove deprecated spells
		if(game.getPlayer().hasSpell(oldSkillTree))
			game.getPlayer().removeSpell(oldSkillTree)
		endif
		if(game.getPlayer().hasSpell(DevourmentShout))
			game.getPlayer().removeShout(DevourmentShout)
		endif
		Game.GetPlayer().enableAI(true)
		Game.getPlayer().addSpell(deferredAdd,false)
	endif
	if (a_version >= 53 && version.getValue()<53 )
		version.setValue(53)
		Pages = new string[4]
		Pages[0] = "Stats"
		Pages[1] = "Basic"
		Pages[2] = "Tweaks"
		Pages[3] = "Perks"
	endif
	if (a_version >= 54 && version.getValue()<54 )
		version.setValue(54)
		if(Game.getPlayer().getLeveledActorBase().getSex()==1)
			Game.getPlayer().addSpell(rapidDigestion)
		endif
		dMinGlobal.setValue(2500)
		dMin=250
	endif
	if (a_version >= 55 && version.getValue()<55 )
		version.setValue(55)
		Game.getPlayer().addSpell(rapidDigestionCompanion)
	endif
	if(a_version>=70 && version.getValue()<70 && version.getValue()>55)
		version.setValue(70)
		ManagerQuest.ZeroPointSevenUpdate()
		Game.getPlayer().addSpell(Regurgitate)
	endif
	if(a_version >=60 && version.getValue()<60)
		version.setValue(60)
		Game.getPlayer().addSpell(Regurgitate)
	endif
endEvent

event OnPageReset(string page)
	Actor player=Game.GetPlayer()
	if(page=="Basic")
		UnloadCustomContent()
		setCursorFillMode(LEFT_TO_RIGHT)
		NPCpredPos=addMenuOption("NPC predators enabled",NPCpredList[NPCpred])
		fatePos=addMenuOption("Fate of digested characters",fateList[fate])
		skillPos=addMenuOption("Skill gain from digested characters",notList[skill])
		essentialPos=addToggleOption("Digest essential characters",essential)
		newPlayerPos=addToggleOption("Continue playing after digestion?",newPlayer)
		raceMenuPos=addToggleOption("Disable racemenu upon character switch?",disableRace)
		
		thePage=1
	elseif(page=="Tweaks")
		UnloadCustomContent()
		setCursorFillMode(LEFT_TO_RIGHT)
		dTimePos		= addSliderOption("Digestion time multiplier",dTime,"{1}x")
		dMinPos			= addSliderOption("Body digestion time",dMin,"{0} seconds")
		sMinPos			= addSliderOption("Minimum swallow chance",sMin,"{0} percent")
		NPCbonusPos		= addSliderOption("NPC swallow chance multiplier",NPCbonus,"{1}x")
		weightPos		= addSliderOption("Weight gain per NPC digested",weight,"{0} percent")
			ToggleVal 	= Debugger.GetValue() as Int
		DebugJB			= AddToggleOption("EnableDebugging:", ToggleVal)
		AddEmptyOption() ; To even out the menu
		thePage=2
	elseif(page=="Perks" && Game.GetPlayer().getLeveledActorBase().getSex()==1)
		UnloadCustomContent()
		setCursorFillMode(TOP_TO_BOTTOM)
		addHeaderOption("Devourment skill: "+(player.getAV("Variable05")+15) as Int+"        Perk points: "+perkPoints.getValueInt())
		V1pos=addToggleOption("Voracious I",player.hasPerk(V1)||player.hasPerk(V2)||player.hasPerk(V3)||player.hasPerk(V4)||player.hasPerk(V5))
		if((!player.hasPerk(V1)&&!player.hasPerk(V2)&&!player.hasPerk(V3)&&!player.hasPerk(V4)&&!player.hasPerk(V5)) || player.getAV("Variable05")<5)
			flag=OPTION_FLAG_DISABLED
		endif
		V2pos=addToggleOption("Voracious II",player.hasPerk(V2)||player.hasPerk(V3)||player.hasPerk(V4)||player.hasPerk(V5),flag)
		flag=0
		if((!player.hasPerk(V2)&&!player.hasPerk(V3)&&!player.hasPerk(V4)&&!player.hasPerk(V5)) || player.getAV("Variable05")<25)
			flag=OPTION_FLAG_DISABLED
		endif
		V3pos=addToggleOption("Voracious III",player.hasPerk(V3)||player.hasPerk(V4)||player.hasPerk(V5),flag)
		flag=0
		if((!player.hasPerk(V3)&&!player.hasPerk(V4)&&!player.hasPerk(V5)) || player.getAV("Variable05")<45)
			flag=OPTION_FLAG_DISABLED
		endif
		V4pos=addToggleOption("Voracious IV",player.hasPerk(V4)||player.hasPerk(V5),flag)
		flag=0
		if((!player.hasPerk(V4)&&!player.hasPerk(V5)) || player.getAV("Variable05")<65)
			flag=OPTION_FLAG_DISABLED
		endif
		V5pos=addToggleOption("Voracious V",player.hasPerk(V5),flag)
		flag=0
		setCursorPosition(1)
		if(player.getAV("Variable05")<10)
			flag=OPTION_FLAG_DISABLED
		endif
		IS1pos=addToggleOption("Iron Stomach I",player.hasPerk(IS1)||player.hasPerk(IS2)||player.hasPerk(IS3),flag)
		if((!player.hasPerk(IS1)&&!player.hasPerk(IS2)&&!player.hasPerk(IS3)) || player.getAV("Variable05")<35)
			flag=OPTION_FLAG_DISABLED
		endif
		IS2pos=addToggleOption("Iron Stomach II",player.hasPerk(IS2)||player.hasPerk(IS3),flag)
		flag=0
		if((!player.hasPerk(IS2)&&!player.hasPerk(IS3)) || player.getAV("Variable05")<60)
			flag=OPTION_FLAG_DISABLED
		endif
		IS3pos=addToggleOption("Iron Stomach III",player.hasPerk(IS3),flag)
		flag=0
		if(player.getAV("Variable05")<15)
			flag=OPTION_FLAG_DISABLED
		endif
		SA1pos=addToggleOption("Strong Acid I",player.hasPerk(SA1)||player.hasPerk(SA2)||player.hasPerk(SA3),flag)
		flag=0
		if((!player.hasPerk(SA1)&&!player.hasPerk(SA2)&&!player.hasPerk(SA3)) || player.getAV("Variable05")<45)
			flag=OPTION_FLAG_DISABLED
		endif
		SA2pos=addToggleOption("Strong Acid II",player.hasPerk(SA2)||player.hasPerk(SA3),flag)
		flag=0
		if((!player.hasPerk(SA2)&&!player.hasPerk(SA3)) || player.getAV("Variable05")<75)
			flag=OPTION_FLAG_DISABLED
		endif
		SA3pos=addToggleOption("Strong Acid III",player.hasPerk(SA3),flag)
		flag=0
		setCursorPosition(12)
		if(player.getAV("Variable05")<15)
			flag=OPTION_FLAG_DISABLED
		endif
		SSpos=addToggleOption("Silent Swallow",player.hasPerk(SS),flag)
		flag=0
		if(player.getAV("Variable05")<20)
			flag=OPTION_FLAG_DISABLED
		endif
		N1pos=addToggleOption("Nourishment I",player.hasPerk(N1)||player.hasPerk(N2),flag)
		flag=0
		if((!player.hasPerk(N1)&&!player.hasPerk(N2)) || player.getAV("Variable05")<30)
			flag=OPTION_FLAG_DISABLED
		endif
		N2pos=addToggleOption("Nourishment II",player.hasPerk(N2),flag)
		flag=0
		setCursorPosition(13)
		if(player.getAV("Variable05")<45)
			flag=OPTION_FLAG_DISABLED
		endif
		CEpos=addToggleOption("Consume Essence",player.hasPerk(CE),flag)
		flag=0
		if(player.getAV("Variable05")<55)
			flag=OPTION_FLAG_DISABLED
		endif
		SBpos=addToggleOption("Strong Back",player.hasPerk(SB),flag)
		flag=0
		if(player.getAV("Variable05")<85)
			flag=OPTION_FLAG_DISABLED
		endif
		SFpos=addToggleOption("Soul Food",player.hasPerk(SF),flag)
		flag=0
		thePage=3
	elseif(page=="Perks")
		UnloadCustomContent()
		addHeaderOption("Males do not receive Devourment perks")
		thePage=3
	elseif(page=="Stats" && Game.getPlayer().getLeveledActorBase().getSex()==1)
		UnloadCustomContent()
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
		float Damage=ManagerQuest.getDigestionDamage(Player, NotPlayer)
		float MaxTime=ManagerQuest.getDigestionTime(Player)
		
		setCursorFillMode(TOP_TO_BOTTOM)
		addHeaderOption("Devourment v0.70")	
		addHeaderOption("Statistics")
		addTextOption("Devourment skill: ",""+(Player.getAV("Variable05")+15) as Int)
		addTextOption("Devourment perk points: ",""+PerkPoints.getValue() as Int)
		addEmptyOption()
		addTextOption("Swallow bonus: ",""+swallowBonus as Int)
		addTextOption("Swallow resistance: ",""+(15+Player.getAV("Variable05")+Player.getAV("FavorPointsBonus")) as Int)
		addTextOption("Stomach damage/sec: ",""+Damage as Int)
		addTextOption("Digestion duration: ",""+maxTime as Int)
		addTextOption("Acid resistance: ",""+Player.getAV("FavorsPerDay") as Int)
		setCursorPosition(1)
		addHeaderOption("Total victims digested: "+numVictims)
		addTextOption("Altmer digested: ",""+altD.getValueInt())
		addTextOption("Argonians digested: ",""+argD.getValueInt())
		addTextOption("Bosmer digested: ",""+bosD.getValueInt())
		addTextOption("Bretons digested: ",""+breD.getValueInt())
		addTextOption("Dunmer digested: ",""+dunD.getValueInt())
		addTextOption("Imperials digested: ",""+impD.getValueInt())
		addTextOption("Khajiit digested: ",""+khaD.getValueInt())
		addTextOption("Nords digested: ",""+norD.getValueInt())
		addTextOption("Orsimer digested: ",""+orsD.getValueInt())
		addTextOption("Redguards digested: ",""+redD.getValueInt())
		addTextOption("Previous Dovahkiins digested: ",""+prevDov.getValueInt())
		if(prevDov.getValueInt()>0)
			addTextOption("Last Dovahkiin digested: ",NameQuest.lastName)
		endif

		thePage=4
	elseif(page=="Stats")
		UnloadCustomContent()
		addHeaderOption("Devourment v0.55")	
		addTextOption("Swallow resistance: ",""+(15+Player.getAV("Variable05")+Player.getAV("FavorPointsBonus")) as Int)
		addTextOption("Acid resistance: ",""+Player.getAV("FavorsPerDay") as Int)
		thePage=4
	else
		LoadCustomContent("Devourment.dds",-9)
		thePage=0
	endif
endEvent

event OnOptionSelect(int option)
if(thePage==1)
	if(option==essentialPos)
		if(essential==true)
			essentialGlobal.setValue(0)
		else
			essentialGlobal.setValue(1)
		endif
		essential=essentialGlobal.getValueInt() as Bool
		setToggleOptionValue(essentialPos, essential)
	elseif(option==newPlayerPos)
		if(newPlayer==true)
			newPlayerGlobal.setValue(0)
		else
			newPlayerGlobal.setValue(1)
		endif
		newPlayer=newPlayerGlobal.getValueInt() as Bool
		setToggleOptionValue(newPlayerPos,newPlayer)
	elseif(option==raceMenuPos)
		if(disableRace==true)
			disableRaceGlobal.setValue(0)
		else
			disableRaceGlobal.setValue(1)
		endif
		disableRace=disableRaceGlobal.getValueInt() as Bool
		setToggleOptionValue(raceMenuPos,disableRace)
	ElseIf (Option == DebugJB)
		If Debugger.GetValue() == 0
			SetToggleOptionValue(DebugJB, True)
			Debugger.SetValue(1)
		Else
			SetToggleOptionValue(DebugJB, False)
			Debugger.SetValue(0)
		EndIf
	endif
elseif(thePage==3&&perkPoints.getValueInt()>0)
	Actor Player=Game.GetPlayer()
	bool perked=false
	if(option==V1Pos&&!player.hasPerk(V1)&&!player.hasPerk(V2)&&!player.hasPerk(V3)&&!player.hasPerk(V4)&&!player.hasPerk(V5))
		player.addPerk(V1)
		perked=true
	elseif(option==V2Pos&&!player.hasPerk(V2)&&!player.hasPerk(V3)&&!player.hasPerk(V4)&&!player.hasPerk(V5))
		player.removePerk(V1)
		player.addPerk(V2)
		perked=true
	elseif(option==V3Pos&&!player.hasPerk(V3)&&!player.hasPerk(V4)&&!player.hasPerk(V5))
		player.removePerk(V2)
		player.addPerk(V3)
		perked=true
	elseif(option==V4Pos&&!player.hasPerk(V4)&&!player.hasPerk(V5))
		player.removePerk(V3)
		player.addPerk(V4)
		perked=true
	elseif(option==V5pos&&!player.hasPerk(V5))
		player.removePerk(V4)
		player.addPerk(V5)
		perked=true
	elseif(option==IS1Pos&&!player.hasPerk(IS1)&&!player.hasPerk(IS2)&&!player.hasPerk(IS3))
		player.addPerk(IS1)
		perked=true
	elseif(option==IS2Pos&&!player.hasPerk(IS2)&&!player.hasPerk(IS3))
		player.removePerk(IS1)
		player.addPerk(IS2)
		perked=true
	elseif(option==IS3Pos&&!player.hasPerk(IS3))
		player.removePerk(IS2)
		player.addPerk(IS3)
		perked=true
	elseif(option==SA1Pos&&!player.hasPerk(SA1)&&!player.hasPerk(SA2)&&!player.hasPerk(SA3))
		player.addPerk(SA1)
		perked=true
	elseif(option==SA2Pos&&!player.hasPerk(SA2)&&!player.hasPerk(SA3))
		player.removePerk(SA1)
		player.addPerk(SA2)
		perked=true
	elseif(option==SA3Pos&&!player.hasPerk(SA3))
		player.removePerk(SA2)
		player.addPerk(SA3)
		perked=true
	elseif(option==N1Pos&&!player.hasPerk(N1)&&!player.hasPerk(N2))
		player.addPerk(N1)
		perked=true
	elseif(option==N2Pos&&!player.hasPerk(N2))
		player.removePerk(N1)
		player.addPerk(N2)
		perked=true
	elseif(option==SSpos&&!player.hasPerk(SS))
		player.addPerk(SS)
		perked=true
	elseif(option==SBPos&&!player.hasPerk(SB))
		player.addPerk(SB)
		perked=true
	elseif(option==SFPos&&!player.hasPerk(SF))
		player.addPerk(SF)
		perked=true
	elseif(option==CEPos&&!player.hasPerk(CE))
		player.addPerk(CE)
		perked=true
	endif

	if(perked)
		perkPoints.setValue(-1+perkPoints.getValue())
		perkSound.play(player)
		forcepagereset()
	endif
endif
endEvent

event OnOptionSliderOpen(int option)
	if (option == dTimePos)
            SetSliderDialogStartValue(dTime)
            SetSliderDialogDefaultValue(1.0)
            SetSliderDialogRange(0.5, 5.0)
            SetSliderDialogInterval(0.1)
	elseif (option==dMinPos)
		SetSliderDialogStartValue(dMin)
            SetSliderDialogDefaultValue(250.0)
            SetSliderDialogRange(250.0, 1200.0)
            SetSliderDialogInterval(10.0)
	elseif (option==sMinPos)
		SetSliderDialogStartValue(sMin)
            SetSliderDialogDefaultValue(5.0)
            SetSliderDialogRange(1.0, 20.0)
            SetSliderDialogInterval(1.0)
	elseif (option==NPCbonusPos)
		SetSliderDialogStartValue(NPCbonus)
            SetSliderDialogDefaultValue(1.0)
            SetSliderDialogRange(0.5, 3.0)
            SetSliderDialogInterval(0.1)
	elseif (option==weightPos)
		SetSliderDialogStartValue(weight)
            SetSliderDialogDefaultValue(2.0)
            SetSliderDialogRange(0.0, 20.0)
            SetSliderDialogInterval(1.0)
      endif
endEvent

event OnOptionSliderAccept(int option, float value)
	if(option==dTimePos)
		dTimeGlobal.setValue(value)
		dTime=dTimeGlobal.getValue()
		setSliderOptionValue(option, dTime, "{1}x")
	elseif(option==dMinPos)
		dMinGlobal.setValue(value*10)
		dMin=dMinGlobal.getValueInt()/10
		setSliderOptionValue(option, dMin, "{0} seconds")
	elseif(option==sMinPos)
		sMinGlobal.setValue(value)
		sMin=sMinGlobal.getValueInt()
		setSliderOptionValue(option, sMin, "{0} percent")
	elseif(option==NPCbonusPos)
		NPCbonusGlobal.setValue(value)
		NPCbonus=NPCbonusGlobal.getValue()
		setSliderOptionValue(option, NPCbonus, "{1}x")
	elseif(option==weightPos)
		weightGlobal.setValue(value)
		weight=weightGlobal.getValueInt()
		setSliderOptionValue(option, weight, "{0} percent")
	endif
endEvent

event OnOptionMenuOpen(int option)
       if (option == NPCpredPos)
             SetMenuDialogOptions(NPCpredList)
             SetMenuDialogStartIndex(NPCpred)
             SetMenuDialogDefaultIndex(1)
	elseif (option==fatePos)
		SetMenuDialogOptions(fateList)
		SetMenuDialogStartIndex(fate)
		SetMenuDialogDefaultIndex(1)
	elseif (option==skillPos)
		SetMenuDialogOptions(notList)
		SetMenuDialogStartIndex(skill)
		SetMenuDialogDefaultIndex(4)
      endIf
endEvent

event OnOptionMenuAccept(int option, int index)
	if (option == NPCpredPos)
		NPCpredGlobal.setValue(index)
		NPCpred=NPCpredGlobal.getValueInt()
		setMenuOptionValue(option, NPCpredList[NPCpred])
	elseif (option == fatePos)
		fateGlobal.setValue(index)
		fate=fateGlobal.getValueInt()
		setMenuOptionValue(option, fateList[fate])
	elseif (option == skillPos)
		skillGlobal.setValue(index)
		skill=skillGlobal.getValueInt()
		setMenuOptionValue(option, notList[skill])
	endif
endEvent

event OnOptionDefault(int option)
if(thePage==1)
	if(option==NPCpredPos)
		NPCpredGlobal.setValue(1)
		NPCpred=NPCpredGlobal.getValueInt()
		setMenuOptionValue(option, NPCpredList[NPCpred])
	elseif(option==fatePos)
		fateGlobal.setValue(1)
		fate=fateGlobal.getValueInt()
		setMenuOptionValue(option, fateList[fate])
	elseif(option==skillPos)
		skillGlobal.setValue(4)
		skill=skillGlobal.getValueInt()
		setMenuOptionValue(option, notList[skill])
	elseif(option==essentialPos)
		essentialGlobal.setValue(0)
		essential=essentialGlobal.getValueInt() as Bool
		setToggleOptionValue(essentialPos, essential)
	endif
elseif(thePage==2)
	if(option==dTimePos)
		dTimeGlobal.setValue(1)
		dTime=dTimeGlobal.getValue()
		setSliderOptionValue(option, dTime, "{1}x")
	elseif(option==dMinPos)
		dMinGlobal.setValue(250)
		dMin=dMinGlobal.getValueInt()
		setSliderOptionValue(option, dMin, "{0} seconds")
	elseif(option==sMinPos)
		sMinGlobal.setValue(5)
		sMin=sMinGlobal.getValueInt()
		setSliderOptionValue(option, sMin, "{0} percent")
	elseif(option==NPCbonusPos)
		NPCbonusGlobal.setValue(1)
		NPCbonus=NPCbonusGlobal.getValue()
		setSliderOptionValue(option, NPCbonus, "{1}x")
	elseif(option==weightPos)
		weightGlobal.setValue(2)
		weight=weightGlobal.getValueInt()
		setSliderOptionValue(option, weight, "{0} percent")
	endif
endif
endEvent

event OnOptionHighlight(int option)
if(thePage==1)
	if(option==NPCpredPos)
		SetInfoText("Choose whether only the player, all female NPCs, or only the player and female followers can swallow")
	elseif(option==fatePos)
		SetInfoText("If absorption is chosen, the prey's items will be added to the predator's inventory")
	elseif(option==skillPos)
		SetInfoText("If a character had a skill higher than yours, digesting them will add one point to that skill")
	elseif(option==essentialPos)
		SetInfoText("This can easily break quests; use at your own risk!")
	elseif(option==newPlayerPos)
		SetInfoText("Continue playing as the character who digested you, inheriting her skills and other stats.\nPerks are cleared and converted to perk points. Currently this only works for female characters.")
	elseif(option==raceMenuPos)
		SetInfoText("Disable minor character customization window after character switch. Can prevent crashes.")
	endif
elseif(thePage==2)
	if(option==dTimePos)
		SetInfoText("Digestion damage will be adjusted inversely for balance reasons")
	elseif(option==dMinPos)
		SetInfoText("Dead characters will take this long to digest. This occurs 50x as quickly in combat, or when Rapid Digestion is cast.")
	elseif(option==sMinPos)
		SetInfoText("All predators have at least this chance of swallowing anyone")
	elseif(option==NPCbonusPos)
		SetInfoText("NPCs' swallow chances are multiplied by this value. This applies to followers as well.")
	elseif(option==weightPos)
		SetInfoText("When someone digests a character, her weight slider will increase by this amount.")
	ElseIf (Option == DebugJB)
		SetInfoText("This will enable or disable debugging. The messages will be posted on your Papyrus logging, AND on your console in real time. If you have any questions or have errors, please grab a copy of your papyrus log, and find SCHAKEN at HTTPS://SCHAKEN-MODSCHAT.COM")
	endif
elseif(thePage==3)
	if(option==V1Pos)
		SetInfoText("Swallow bonus improves by 20%")
	elseif(option==V2Pos)
		SetInfoText("Swallow bonus improves by 40% (Minimum skill 20)")
	elseif(option==V3Pos)
		SetInfoText("Swallow bonus improves by 60% (Minimum skill 40)")
	elseif(option==V4Pos)
		SetInfoText("Swallow bonus improves by 80% (Minimum skill 60)")
	elseif(option==V5Pos)
		SetInfoText("Swallow bonus is doubled (Minimum skill 80)")
	elseif(option==IS1Pos)
		SetInfoText("Hold prey in your stomach 50% longer (Minimum skill 25)")
	elseif(option==IS2Pos)
		SetInfoText("Hold prey in your stomach 100% longer (Minimum skill 50)")
	elseif(option==IS3Pos)
		SetInfoText("Hold prey in your stomach 150% longer (Minimum skill 75)")
	elseif(option==SA1Pos)
		SetInfoText("Your stomach deals 50% more damage per second (Minimum skill 30)")
	elseif(option==SA2Pos)
		SetInfoText("Your stomach deals 100% more damage per second (Minimum skill 60)")
	elseif(option==SA3Pos)
		SetInfoText("Your stomach deals 150% more damage per second (Minimum skill 90)")
	elseif(option==N1Pos)
		SetInfoText("Recover twice as much health and stamina while digesting prey (Minimum skill 35)")
	elseif(option==N2Pos)
		SetInfoText("Recover magicka while digesting prey (Minimum skill 45)")
	elseif(option==CEpos)
		SetInfoText("Gain twice the permanent health/magicka/stamina bonuses by digesting prey (Minimum skill 60)")
	elseif(option==SSPos)
		SetInfoText("Swallowing someone does not break stealth (Minimum skill 30)")
	elseif(option==SBpos)
		SetInfoText("You are not slowed when someone is in your stomach (Minimum skill 70)")
	elseif(option==SFpos)
		SetInfoText("Trap the souls of digested prey in your stomach (Minimum skill 100)")
	endif
endif
endEvent