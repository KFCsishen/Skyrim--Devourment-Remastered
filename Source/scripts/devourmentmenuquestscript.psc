Scriptname DevourmentMenuQuestScript extends SKI_ConfigBase  

; Debugging

Int DebugJB
Int ToggleVal

; positions

int NPCpredPos
int fatePos
int skillPos
int essentialPos
int newPlayerPos
int raceMenuPos
int fempredpos
int malepredpos
int multipreypos
int multipreynpcpos
int animalpredpos
int strugglepos
int Shititemspos
int BreastVorepos
int CockVorepos
int Morphanimpos
int noescapepos
int strippos
int loadscreenpos
int playercentricpos
int unwillingaudiopos
int ScatMoanspos
int MorphOnlypos

int dTimePos
int dMinPos
int sMinPos
int bellyscaleminpos
int NPCbonusPos
int weightPos
int damagemodpos

; Predator perk tree
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
int CGpos


; Prey perk tree
int SD1Pos
int SD2Pos
int SD3Pos
int SD4Pos
int SD5Pos

int R1Pos
int R2Pos
int R3Pos
int R4Pos
int R5Pos

int S1Pos
int S2Pos
int S3Pos
int S4Pos
int S5Pos

int PGPos
int DEPos
int COPos
int RDPos

; values

int NPCpred = 1
int fate = 1
int skill = 4
bool essential = false
bool newPlayer=true
bool disableRace=false
bool fempredbool =True
bool malepredbool =True
bool multipreybool = false
bool multipreynpcbool = false
bool animalpredbool = false
bool strugglebool = True
bool Shititemsbool = False
bool BreastVorebool = False
bool CockVorebool = false
bool Morphanimbool = false
bool noescapebool = false
bool stripbool = false
bool loadscreenbool = true
bool playercentricbool = false
bool unwillingaudiobool = true
bool ScatMoansbool = true
bool MorphOnlybool = false

float 	dTime = 1.0
int 	dMin = 250
int 	sMin = 5
float 	bellyscaleint= 1.0
float 	NPCbonus = 1.0
int 	weight = 2
float 	damagemodf = 1.0
int 	flag=0
int 	thePage=0

; globals

GlobalVariable Property NPCpredGlobal Auto
GlobalVariable Property fateGlobal Auto
GlobalVariable Property skillGlobal Auto
GlobalVariable Property essentialGlobal Auto
GlobalVariable Property disableRaceGlobal Auto
GlobalVariable Property Fempred Auto
GlobalVariable Property Malepred Auto
GlobalVariable Property Multiprey Auto
GlobalVariable Property Multipreynpc Auto
GlobalVariable Property Animalpred Auto
GlobalVariable Property struggle Auto
GlobalVariable Property Shititems auto
GlobalVariable Property Breastvore auto
GlobalVariable Property Cockvore Auto
GlobalVariable Property Morphanim auto
GlobalVariable Property Noescape auto
GlobalVariable Property strip auto
GlobalVariable Property loadscreen auto
GlobalVariable Property playercentric auto
GlobalVariable Property Unwillingaudio auto
GlobalVariable Property ScatMoans Auto
GlobalVariable Property MorphOnly Auto

GlobalVariable Property dTimeGlobal Auto
GlobalVariable Property dMinGlobal Auto
GlobalVariable Property sMinGlobal Auto
GlobalVariable Property NPCbonusGlobal Auto
GlobalVariable Property weightGlobal Auto
GlobalVariable Property damagemod auto
GlobalVariable Property version Auto  
GlobalVariable Property Debugger Auto
GlobalVariable Property NewPlayerGlobal  Auto  
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
GlobalVariable Property _DragonEaten Auto
GlobalVariable Property _HorseEaten Auto
GlobalVariable Property _TrollEaten Auto
GlobalVariable Property _DraugrEaten Auto
GlobalVariable Property _FalmerEaten Auto
GlobalVariable Property _FoxEaten Auto
GlobalVariable Property _FishEaten Auto
GlobalVariable Property _BearEaten Auto
GlobalVariable Property _MudcrabEaten Auto
GlobalVariable Property _SpiderEaten Auto
GlobalVariable Property _ChickenEaten Auto
GlobalVariable Property _DogEaten Auto
GlobalVariable Property _DeerEaten Auto
GlobalVariable Property _GoatEaten Auto
GlobalVariable Property _CowEaten Auto
GlobalVariable Property _ChaurusEaten Auto
GlobalVariable Property _GiantEaten Auto
GlobalVariable Property _DwarvenMachineEaten Auto
GlobalVariable Property _HagravenEaten Auto
GlobalVariable Property _MammothEaten Auto
GlobalVariable Property _SabrecatEaten Auto
GlobalVariable Property _WerewolfEaten Auto
GlobalVariable Property _WolfEaten Auto
GlobalVariable Property _DragonPriestEaten Auto
GlobalVariable Property _DremoraEaten Auto
GlobalVariable Property _HareEaten Auto
GlobalVariable Property _HorkerEaten Auto
GlobalVariable Property _VampireEaten Auto
GlobalVariable Property _WomenEaten Auto
GlobalVariable Property _MenEaten Auto
GlobalVariable Property _bellyscale Auto
GlobalVariable Property prevDov Auto

; arrays

string[] NPCpredList
string[] fateList
string[] notList

; Predator perks

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
Perk Property SF Auto
Perk Property CG Auto
Perk Property RD Auto
Perk Property SwallowCorpse Auto

; Prey Perks
Perk Property SD1 Auto
Perk Property SD2 Auto
Perk Property SD3 Auto
Perk Property SD4 Auto
Perk Property SD5 Auto

Perk Property R1 Auto
Perk Property R2 Auto
Perk Property R3 Auto
Perk Property R4 Auto
Perk Property R5 Auto

Perk Property S1 Auto
Perk Property S2 Auto
Perk Property S3 Auto
Perk Property S4 Auto
Perk Property S5 Auto

Perk Property PG Auto
Perk Property DE Auto
Perk Property CO Auto


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
	return Version.GetValue() as Int
endFunction

event OnConfigInit()
	Pages = new string[6]
	Pages[0] = "Stats"
	Pages[1] = "Basic"
	Pages[2] = "Tweaks"
	Pages[3] = "Predator Perks"
	Pages[4] = "Prey Perks"
	Pages[5] = "Toggles"
	

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
EndEvent

event OnVersionUpdate(int a_version)
	; a_version is the new version, CurrentVersion is the old version
	if (a_version >= 52 && version.getValue()<52)
		version.setValue(52)
		;remove deprecated spells
		If (game.getPlayer().hasSpell(oldSkillTree))
			game.getPlayer().removeSpell(oldSkillTree)
		EndIf
		If (game.getPlayer().hasSpell(DevourmentShout))
			game.getPlayer().removeShout(DevourmentShout)
		EndIf
		Game.GetPlayer().enableAI(true)
		Game.getPlayer().addSpell(deferredAdd,false)
	EndIf
	if (a_version >= 53 && version.getValue()<53 )
		version.setValue(53)
		Pages = new string[6]
		Pages[0] = "Stats"
		Pages[1] = "Basic"
		Pages[2] = "Tweaks"
		Pages[3] = "Predator Perks"
		Pages[4] = "Prey Perks"
		Pages[5] = "Toggles"
	EndIf
	if (a_version >= 54 && version.getValue()<54 )
		version.setValue(54)
	   
			Game.getPlayer().addSpell(rapidDigestion)
		
		dMinGlobal.setValue(2500)
		dMin=250
	EndIf
	if (a_version >= 55 && version.getValue()<55 )
		version.setValue(55)
		Game.getPlayer().addSpell(rapidDigestionCompanion)
	EndIf
	If (a_version>=70 && version.getValue()<70 && version.getValue()>55)
		version.setValue(70)
		ManagerQuest.ZeroPointSevenUpdate()
		Game.getPlayer().addSpell(Regurgitate)
	EndIf
	If (a_version >=60 && version.getValue()<60)
		version.setValue(60)
		Game.getPlayer().addSpell(Regurgitate)
	EndIf
EndEvent

event OnPageReset(string page)
	Actor player=Game.GetPlayer()
	If (page=="Basic")
		UnloadCustomContent()
		setCursorFillMode(LEFT_TO_RIGHT)
		NPCpredPos		= addMenuOption("NPC predators enabled",NPCpredList[NPCpred])
		fatePos			= addMenuOption("Fate of digested characters",fateList[fate])
		skillPos		= addMenuOption("Skill gain from digested characters",notList[skill])
		essentialPos	= AddToggleOption("Digest essential characters",essential)
		newPlayerPos	= AddToggleOption("Continue playing after digestion?",newPlayer)
		raceMenuPos		= AddToggleOption("Disable racemenu upon character switch?",disableRace)
			ToggleVal 	= Debugger.GetValue() as Int
		DebugJB			= AddToggleOption("Enable Debugging:", ToggleVal)
		thePage=1
		
	ElseIf (page=="Tweaks")
		UnloadCustomContent()
		setCursorFillMode(LEFT_TO_RIGHT)
		dTimePos=addSliderOption("Digestion time multiplier",dTime,"{1}x")
		dMinPos=addSliderOption("Body digestion time",dMin,"{0} seconds")
		sMinPos=addSliderOption("Minimum swallow chance",sMin,"{0} percent")
		bellyscaleminpos=addSliderOption("Belly Size",bellyscaleint,"{1} Size")
		NPCbonusPos=addSliderOption("NPC swallow chance multiplier",NPCbonus,"{1}x")
		weightPos=addSliderOption("Weight gain per NPC digested",weight,"{0} percent")
		damagemodpos=addSliderOption("Stomach acid damage multiplier",damagemodf,"{1}x")
		thePage=2
		
	ElseIf (page=="Predator Perks" )
		UnloadCustomContent()
		setCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption(" skill: "+(player.getAV("Variable05")+15) as Int+"		Perk points: "+perkPoints.getValueInt())
		V1pos=AddToggleOption("Voracious I",player.hasPerk(V1)||player.hasPerk(V2)||player.hasPerk(V3)||player.hasPerk(V4)||player.hasPerk(V5))
		If ((!player.hasPerk(V1)&&!player.hasPerk(V2)&&!player.hasPerk(V3)&&!player.hasPerk(V4)&&!player.hasPerk(V5)) || player.getAV("Variable05")<5)
			flag=OPTION_FLAG_DISABLED
		EndIf
		V2pos=AddToggleOption("Voracious II",player.hasPerk(V2)||player.hasPerk(V3)||player.hasPerk(V4)||player.hasPerk(V5),flag)
		flag=0
		If ((!player.hasPerk(V2)&&!player.hasPerk(V3)&&!player.hasPerk(V4)&&!player.hasPerk(V5)) || player.getAV("Variable05")<25)
			flag=OPTION_FLAG_DISABLED
		EndIf
		V3pos=AddToggleOption("Voracious III",player.hasPerk(V3)||player.hasPerk(V4)||player.hasPerk(V5),flag)
		flag=0
		If ((!player.hasPerk(V3)&&!player.hasPerk(V4)&&!player.hasPerk(V5)) || player.getAV("Variable05")<45)
			flag=OPTION_FLAG_DISABLED
		EndIf
		V4pos=AddToggleOption("Voracious IV",player.hasPerk(V4)||player.hasPerk(V5),flag)
		flag=0
		If ((!player.hasPerk(V4)&&!player.hasPerk(V5)) || player.getAV("Variable05")<65)
			flag=OPTION_FLAG_DISABLED
		EndIf
		V5pos=AddToggleOption("Voracious V",player.hasPerk(V5),flag)
		flag=0
		setCursorPosition(1)
		If (player.getAV("Variable05")<10)
			flag=OPTION_FLAG_DISABLED
		EndIf
		IS1pos=AddToggleOption("Iron Stomach I",player.hasPerk(IS1)||player.hasPerk(IS2)||player.hasPerk(IS3),flag)
		If ((!player.hasPerk(IS1)&&!player.hasPerk(IS2)&&!player.hasPerk(IS3)) || player.getAV("Variable05")<35)
			flag=OPTION_FLAG_DISABLED
		EndIf
		IS2pos=AddToggleOption("Iron Stomach II",player.hasPerk(IS2)||player.hasPerk(IS3),flag)
		flag=0
		If ((!player.hasPerk(IS2)&&!player.hasPerk(IS3)) || player.getAV("Variable05")<60)
			flag=OPTION_FLAG_DISABLED
		EndIf
		IS3pos=AddToggleOption("Iron Stomach III",player.hasPerk(IS3),flag)
		flag=0
		If (player.getAV("Variable05")<15)
			flag=OPTION_FLAG_DISABLED
		EndIf
		SA1pos=AddToggleOption("Strong Acid I",player.hasPerk(SA1)||player.hasPerk(SA2)||player.hasPerk(SA3),flag)
		flag=0
		If ((!player.hasPerk(SA1)&&!player.hasPerk(SA2)&&!player.hasPerk(SA3)) || player.getAV("Variable05")<45)
			flag=OPTION_FLAG_DISABLED
		EndIf
		SA2pos=AddToggleOption("Strong Acid II",player.hasPerk(SA2)||player.hasPerk(SA3),flag)
		flag=0
		If ((!player.hasPerk(SA2)&&!player.hasPerk(SA3)) || player.getAV("Variable05")<75)
			flag=OPTION_FLAG_DISABLED
		EndIf
		SA3pos=AddToggleOption("Strong Acid III",player.hasPerk(SA3),flag)
		flag=0
		setCursorPosition(12)
		If (player.getAV("Variable05")<15)
			flag=OPTION_FLAG_DISABLED
		EndIf
		SSpos=AddToggleOption("Silent Swallow",player.hasPerk(SS),flag)
		flag=0
		If (player.getAV("Variable05")<20)
			flag=OPTION_FLAG_DISABLED
		EndIf
		N1pos=AddToggleOption("Nourishment I",player.hasPerk(N1)||player.hasPerk(N2),flag)
		flag=0
		If ((!player.hasPerk(N1)&&!player.hasPerk(N2)) || player.getAV("Variable05")<30)
			flag=OPTION_FLAG_DISABLED
		EndIf
		N2pos=AddToggleOption("Nourishment II",player.hasPerk(N2),flag)
		flag=0
		setCursorPosition(13)
		If (player.getAV("Variable05")<45)
			flag=OPTION_FLAG_DISABLED
		EndIf
		CEpos=AddToggleOption("Consume Essence",player.hasPerk(CE),flag)
		flag=0
		If (player.getAV("Variable05")<55)
			flag=OPTION_FLAG_DISABLED
		EndIf
		CGpos=AddToggleOption("Constricting Grip",player.hasPerk(CG),flag)
		flag=0
		If (player.getAV("Variable05")<75)
			flag=OPTION_FLAG_DISABLED
		EndIf
		RDpos=AddToggleOption("Stomach Bound Thralls",player.hasPerk(RD),flag)
		flag=0
		If (player.getAV("Variable05")<85)
			flag=OPTION_FLAG_DISABLED
		EndIf
		SFpos=AddToggleOption("Soul Food",player.hasPerk(SF),flag)
		flag=0
		thePage=3
		
	ElseIf (page=="Perks") ; =====================================================================================================
		UnloadCustomContent()
		AddHeaderOption("Males do not receive Devourment perks")
		thePage=3
		
	ElseIf (page=="Stats")
		UnloadCustomContent()
		int numVictims=(Victims.getValue()+prevPerkPoints.getValue()*(3+0.5*(-1+prevPerkPoints.getValue()))) as int
		float swallowBonus=15+Player.getAV("Variable05")+Player.getAV("FavorActive")
		If (Player.hasPerk(V5))
			swallowBonus*=2
		ElseIf (Player.hasPerk(V4))
			swallowBonus*=1.8
		ElseIf (Player.hasPerk(V3))
			swallowBonus*=1.6
		ElseIf (Player.hasPerk(V2))
			swallowBonus*=1.4
		ElseIf (Player.hasPerk(V1))
			swallowBonus*=1.2
		EndIf
		float Damage = ManagerQuest.getDigestionDamage(Player, NotPlayer)
		float MaxTime = ManagerQuest.getDigestionTime(Player)
		float StruggleDamage = ManagerQuest.getstrugglingdamage(Player, Notplayer)
		int acidresistance = ManagerQuest.getAcidResistance(Player, Notplayer)
		float swallowresistance = (15+Player.getAV("Variable05")+Player.getAV("FavorPointsBonus"))
		If (player.hasperk(S1))
			swallowresistance *= 1.1
		ElseIf (player.hasperk(S2))
			swallowresistance *= 1.2
		ElseIf (player.hasperk(S3))
			swallowresistance *= 1.3
		ElseIf (player.hasperk(S4))
			swallowresistance *= 1.4
		ElseIf (player.hasperk(S5))
			swallowresistance *= 1.5
		EndIf
		
		setCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("Devourment v"+GetVersion()) 
		AddHeaderOption("Statistics")
		AddTextOption("Devourment skill: ",""+(Player.getAV("Variable05")+15) as Int)
		AddTextOption("Devourment perk points: ",""+PerkPoints.getValue() as Int)
		AddEmptyOption()
		AddTextOption("Swallow bonus: ",""+swallowBonus as Int)
		AddTextOption("Swallow resistance: ",swallowresistance as Int)
		AddTextOption("Stomach damage/sec: ",""+Damage as Int)
		AddTextOption("Struggling damage: ",""+StruggleDamage as Int)
		AddTextOption("Digestion duration: ",""+maxTime as Int)
		AddTextOption("Acid resistance: ",acidresistance+"%" as int)
		setCursorPosition(1)
		AddHeaderOption("Total victims digested: "+numVictims)
		AddTextOption("Women digested: ",""+_WomenEaten.getValueInt())
		AddTextOption("Men digested: ",""+_MenEaten.getValueInt())
		AddTextOption("Altmer digested: ",""+altD.getValueInt())
		AddTextOption("Argonians digested: ",""+argD.getValueInt())
		AddTextOption("Bosmer digested: ",""+bosD.getValueInt())
		AddTextOption("Bretons digested: ",""+breD.getValueInt())
		AddTextOption("Dunmer digested: ",""+dunD.getValueInt())
		AddTextOption("Imperials digested: ",""+impD.getValueInt())
		AddTextOption("Khajiit digested: ",""+khaD.getValueInt())
		AddTextOption("Nords digested: ",""+norD.getValueInt())
		AddTextOption("Orsimer digested: ",""+orsD.getValueInt())
		AddTextOption("Redguards digested: ",""+redD.getValueInt())
		AddTextOption("Dragons digested: ",""+_DragonEaten.getValueInt())
		AddTextOption("Horses digested: ",""+_HorseEaten.getValueInt())
		AddTextOption("Trolls digested: ",""+_TrollEaten.getValueInt())
		AddTextOption("Draugrs digested: ",""+_DraugrEaten.getValueInt())
		AddTextOption("Falmer digested: ",""+_FalmerEaten.getValueInt())
		AddTextOption("Foxes digested: ",""+_FoxEaten.getValueInt())
		AddTextOption("Slaughterfish digested: ",""+_FishEaten.getValueInt())
		AddTextOption("Bears digested: ",""+_BearEaten.getValueInt())
		AddTextOption("Mudcrabs digested: ",""+_MudcrabEaten.getValueInt())
		AddTextOption("Spiders digested: ",""+_SpiderEaten.getValueInt())
		AddTextOption("Chickens digested: ",""+_ChickenEaten.getValueInt())
		AddTextOption("Dogs digested: ",""+_DogEaten.getValueInt())
		AddTextOption("Deers digested: ",""+_DeerEaten.getValueInt())
		AddTextOption("Goats digested: ",""+_GoatEaten.getValueInt())
		AddTextOption("Cows digested: ",""+_CowEaten.getValueInt())
		AddTextOption("Chaurus digested: ",""+_ChaurusEaten.getValueInt())
		AddTextOption("Giants digested: ",""+_GiantEaten.getValueInt())
		AddTextOption("Dwarven Machines digested: ",""+_DwarvenMachineEaten.getValueInt())
		AddTextOption("Hagravens digested: ",""+_HagravenEaten.getValueInt())
		AddTextOption("Mammoths digested: ",""+_MammothEaten.getValueInt())
		AddTextOption("Sabrecats digested: ",""+_SabrecatEaten.getValueInt())
		AddTextOption("Werewolves digested: ",""+_WerewolfEaten.getValueInt())
		AddTextOption("Wolves digested: ",""+_WolfEaten.getValueInt())
		AddTextOption("Dragon Priests digested: ",""+_DragonPriestEaten.getValueInt())
		AddTextOption("Dremora digested: ",""+_DremoraEaten.getValueInt())
		AddTextOption("Hares digested: ",""+_HareEaten.getValueInt())
		AddTextOption("Horkers digested: ",""+_HorkerEaten.getValueInt())
		AddTextOption("Vampires digested: ",""+_VampireEaten.getValueInt())	   
		AddTextOption("Previous Dovahkiins digested: ",""+prevDov.getValueInt())
		If (prevDov.getValueInt()>0)
			AddTextOption("Last Dovahkiin digested: ",NameQuest.lastName)
		EndIf
		thePage=4
		
	ElseIf (page=="Toggles")
		UnloadCustomContent()
	fempredpos			= AddToggleOption("Female predators",fempredbool)
	malepredpos			= AddToggleOption("Male predators",malepredbool)
	multipreypos		= AddToggleOption("Player multiprey",multipreybool )
	multipreynpcpos		= AddToggleOption("Npc multiprey",multipreynpcbool )
	animalpredpos		= AddToggleOption("Animal predators",animalpredbool )
	strugglepos			= AddToggleOption("Struggle Mechanic",strugglebool)
	shititemspos		= AddToggleOption("Prey's gear shown when disposed",shititemsbool)
	breastvorepos		= AddToggleOption("Breast Vore",breastvorebool)
	Cockvorepos			= AddToggleOption("Cock Vore",cockvorebool)
	noescapepos			= AddToggleOption("No escape once swallowed",noescapebool)
	strippos			= AddToggleOption("Player Strips in Stomach",stripbool)
	loadscreenpos		= AddToggleOption("Loading screens",loadscreenbool)
	playercentricpos	= AddToggleOption("Player Centric",playercentricbool)
	unwillingaudiopos	= AddToggleOption("Unwilling Struggling Sounds",unwillingaudiobool)
	ScatMoanspos		= AddToggleOption("Scat Sounds",ScatMoansbool)
	MorphOnlypos		= AddToggleOption("Only Morphs",MorphOnlybool)
	thePage=5
	
	ElseIf (page=="Prey perks")
	  UnloadCustomContent()
		setCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("Devourment skill: "+(player.getAV("Variable05")+15) as Int+"		Perk points: "+perkPoints.getValueInt())
	   
		;; Resilience perks
		R1pos=AddToggleOption("Resilience I",player.hasPerk(R1)||player.hasPerk(R2)||player.hasPerk(R3)||player.hasPerk(R4)||player.hasPerk(R5))
		If ((!player.hasPerk(R1)&&!player.hasPerk(R2)&&!player.hasPerk(R3)&&!player.hasPerk(R4)&&!player.hasPerk(R5)) || player.getAV("Variable05")<5)
			flag=OPTION_FLAG_DISABLED
		EndIf
		R2pos=AddToggleOption("Resilience II",player.hasPerk(R2)||player.hasPerk(R3)||player.hasPerk(R4)||player.hasPerk(R5),flag)
		flag=0
		If ((!player.hasPerk(R2)&&!player.hasPerk(R3)&&!player.hasPerk(R4)&&!player.hasPerk(R5)) || player.getAV("Variable05")<25)
			flag=OPTION_FLAG_DISABLED
		EndIf
		R3pos=AddToggleOption("Resilience III",player.hasPerk(R3)||player.hasPerk(R4)||player.hasPerk(R5),flag)
		flag=0
		If ((!player.hasPerk(R3)&&!player.hasPerk(R4)&&!player.hasPerk(R5)) || player.getAV("Variable05")<45)
			flag=OPTION_FLAG_DISABLED
		EndIf
		R4pos=AddToggleOption("Resilience IV",player.hasPerk(R4)||player.hasPerk(R5),flag)
		flag=0
		If ((!player.hasPerk(R4)&&!player.hasPerk(R5)) || player.getAV("Variable05")<65)
			flag=OPTION_FLAG_DISABLED
		EndIf
		R5pos=AddToggleOption("Resilience V",player.hasPerk(R5),flag)
		flag=0
		setCursorPosition(1)
		;; Slippery perks
		S1pos=AddToggleOption("Slippery I",player.hasPerk(S1)||player.hasPerk(S2)||player.hasPerk(S3)||player.hasPerk(S4)||player.hasPerk(S5))
		If ((!player.hasPerk(S1)&&!player.hasPerk(S2)&&!player.hasPerk(S3)&&!player.hasPerk(S4)&&!player.hasPerk(S5)) || player.getAV("Variable05")<5)
			flag=OPTION_FLAG_DISABLED
		EndIf
		S2pos=AddToggleOption("Slippery II",player.hasPerk(S2)||player.hasPerk(S3)||player.hasPerk(S4)||player.hasPerk(S5),flag)
		flag=0
		If ((!player.hasPerk(S2)&&!player.hasPerk(S3)&&!player.hasPerk(S4)&&!player.hasPerk(S5)) || player.getAV("Variable05")<25)
			flag=OPTION_FLAG_DISABLED
		EndIf
		S3pos=AddToggleOption("Slippery III",player.hasPerk(S3)||player.hasPerk(S4)||player.hasPerk(S5),flag)
		flag=0
		If ((!player.hasPerk(S3)&&!player.hasPerk(S4)&&!player.hasPerk(S5)) || player.getAV("Variable05")<45)
			flag=OPTION_FLAG_DISABLED
		EndIf
		S4pos=AddToggleOption("Slippery IV",player.hasPerk(S4)||player.hasPerk(S5),flag)
		flag=0
		If ((!player.hasPerk(S4)&&!player.hasPerk(S5)) || player.getAV("Variable05")<65)
			flag=OPTION_FLAG_DISABLED
		EndIf
		S5pos=AddToggleOption("Slippery V",player.hasPerk(S5),flag)
		flag=0	   
		If (player.getAV("Variable05")<80)
			flag=OPTION_FLAG_DISABLED
		EndIf
		
		
		
		 PGpos=AddToggleOption("Parting Gift",player.hasPerk(PG),flag)
		flag=0
		If (player.getAV("Variable05")<35)
			flag=OPTION_FLAG_DISABLED
		EndIf
		 DEpos=AddToggleOption("Delicious",player.hasPerk(DE),flag)
		flag=0
		If (player.getAV("Variable05")<10)
			flag=OPTION_FLAG_DISABLED
		EndIf		
		COpos=AddToggleOption("Comfy",player.hasPerk(CO),flag)
		flag=0
		If (player.getAV("Variable05")<10)
			flag=OPTION_FLAG_DISABLED
		EndIf
		
		
		setCursorPosition(1)			  
		If (player.getAV("Variable05")<10)
			flag=OPTION_FLAG_DISABLED
		EndIf		 
		thePage=4
	ElseIf (page=="Stats")
		UnloadCustomContent()
		AddHeaderOption("Devourment v0.55") 
		AddTextOption("Swallow resistance: ",""+(15+Player.getAV("Variable05")+Player.getAV("FavorPointsBonus")) as Int)
		AddTextOption("Acid resistance: ",""+Player.getAV("FavorsPerDay") as Int)
		thePage=4
	else
		LoadCustomContent("Devourment.dds",-9)
		thePage=0
	EndIf
EndEvent

event OnOptionSelect(int option)
If (thePage==1)
	If (Option == essentialPos)
		If (essential==true)
			essentialGlobal.setValue(0)
		else
			essentialGlobal.setValue(1)
		EndIf
		essential=essentialGlobal.getValueInt() as Bool
		setToggleOptionValue(essentialPos, essential)
	ElseIf (Option == newPlayerPos)
		If (newPlayer==true)
			newPlayerGlobal.setValue(0)
		else
			newPlayerGlobal.setValue(1)
		EndIf
		newPlayer=newPlayerGlobal.getValueInt() as Bool
		setToggleOptionValue(newPlayerPos,newPlayer)
	ElseIf (Option == raceMenuPos)
		If (disableRace==true)
			disableRaceGlobal.setValue(0)
		else
			disableRaceGlobal.setValue(1)
		EndIf
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
	EndIf
ElseIf (thePage==5)
	If (Option == fempredpos)
		If (fempredbool==true)
			fempred.setValue(0)
		else
			fempred.setValue(1)
		EndIf
		fempredbool=fempred.getValueInt() as Bool
		setToggleOptionValue(fempredpos,fempredbool)   
  
	ElseIf (Option == malepredpos)
		If (malepredbool==true)
			malepred.setValue(0)
		else
			malepred.setValue(1)
		EndIf
		malepredbool=malepred.getValueInt() as Bool
		setToggleOptionValue(malepredpos,malepredbool)
	ElseIf (Option == multipreypos)
		If (multipreybool==true)
			multiprey.setValue(0)
		else
			multiprey.setValue(1)
		EndIf
		multipreybool=multiprey.getValueInt() as Bool
		setToggleOptionValue(multipreypos,multipreybool)
	ElseIf (Option == multipreynpcpos)
		If (multipreynpcbool==true)
			multipreynpc.setValue(0)
		else
			multipreynpc.setValue(1)
		EndIf
		multipreynpcbool=multipreynpc.getValueInt() as Bool
		setToggleOptionValue(multipreynpcpos,multipreynpcbool)
	ElseIf (Option == animalpredpos)
		If (animalpredbool==true)
			animalpred.setValue(0)
		else
			animalpred.setValue(1)
		EndIf
		animalpredbool=animalpred.getValueInt() as Bool
		setToggleOptionValue(animalpredpos,animalpredbool)
	ElseIf (Option == StrugglePos)
		If (Strugglebool==true)
			Struggle.setValue(0)
		else
			Struggle.setValue(1)
		EndIf
		Strugglebool=Struggle.getValueInt() as Bool
		setToggleOptionValue(StrugglePos, Strugglebool)
	ElseIf (Option == ShititemsPos)
		If (Shititemsbool==true)
			Shititems.setValue(0)
		else
			Shititems.setValue(1)
		EndIf
		Shititemsbool=Shititems.getValueInt() as Bool
		setToggleOptionValue(ShititemsPos, Shititemsbool)
	ElseIf (Option == breastvorePos)
		If (breastvorebool==true)
			breastvore.setValue(0)
		else
			breastvore.setValue(1)
		EndIf
		breastvorebool=breastvore.getValueInt() as Bool
		setToggleOptionValue(breastvorePos, breastvorebool)
	ElseIf (Option == cockvorePos)
		If (cockvorebool==true)
			cockvore.setValue(0)
		else
			cockvore.setValue(1)
		EndIf
		cockvorebool=cockvore.getValueInt() as Bool
		setToggleOptionValue(cockvorePos, cockvorebool)
	ElseIf (Option == morphanimPos)
		If (morphanimbool==true)
			morphanim.setValue(0)
		else
			morphanim.setValue(1)
		EndIf
		morphanimbool= morphanim.getValueInt() as Bool
		setToggleOptionValue(morphanimPos, morphanimbool)
	ElseIf (Option == NoescapePos)
		If (Noescapebool==true)
			Noescape.setValue(0)
		else
			Noescape.setValue(1)
		EndIf
		Noescapebool=Noescape.getValueInt() as Bool
		setToggleOptionValue(NoescapePos, Noescapebool)
	ElseIf (Option == stripPos)
		If (stripbool==true)
			strip.setValue(0)
		else
			strip.setValue(1)
		EndIf
		stripbool=strip.getValueInt() as Bool
		setToggleOptionValue(stripPos, stripbool)
	ElseIf (Option == loadscreenPos)
		If (loadscreenbool==true)
			loadscreen.setValue(0)
		else
			loadscreen.setValue(1)
		EndIf
		loadscreenbool=loadscreen.getValueInt() as Bool
		setToggleOptionValue(loadscreenPos, loadscreenbool)
	ElseIf (Option == playercentricPos)
		If (playercentricbool==true)
			playercentric.setValue(0)
		else
			playercentric.setValue(1)
		EndIf
		playercentricbool=playercentric.getValueInt() as Bool
		setToggleOptionValue(playercentricPos, playercentricbool)
	ElseIf (Option == unwillingaudioPos)
		If (unwillingaudiobool==true)
			unwillingaudio.setValue(0)
		else
			unwillingaudio.setValue(1)
		EndIf
		unwillingaudiobool=unwillingaudio.getValueInt() as Bool
		setToggleOptionValue(unwillingaudioPos, unwillingaudiobool)
	ElseIf (Option == ScatMoansPos)
		If (ScatMoansbool==true)
			ScatMoans.setValue(0)
		else
			ScatMoans.setValue(1)
		EndIf
		ScatMoansbool=ScatMoans.getValueInt() as Bool
		setToggleOptionValue(ScatMoansPos, ScatMoansbool)
	ElseIf (Option == morphonlyPos)
		If (morphonlybool==true)
			morphonly.setValue(0)
		else
			morphonly.setValue(1)
		EndIf
		morphonlybool=morphonly.getValueInt() as Bool
		setToggleOptionValue(morphonlyPos, morphonlybool)
	
   
	EndIf
ElseIf (thePage==4&&perkPoints.getValueInt()>0)
	Actor Player=Game.GetPlayer()
	bool perked=false
	If (Option == SD1Pos&&!player.hasPerk(SD1)&&!player.hasPerk(SD2)&&!player.hasPerk(SD3)&&!player.hasPerk(SD4)&&!player.hasPerk(SD5))
		player.addPerk(SD1)
		perked=true
	ElseIf (Option == SD2Pos&&!player.hasPerk(SD2)&&!player.hasPerk(SD3)&&!player.hasPerk(SD4)&&!player.hasPerk(SD5))
		player.removePerk(SD1)
		player.addPerk(SD2)
		perked=true
	ElseIf (Option == SD3Pos&&!player.hasPerk(SD3)&&!player.hasPerk(SD4)&&!player.hasPerk(SD5))
		player.removePerk(SD2)
		player.addPerk(SD3)
		perked=true
	ElseIf (Option == SD4Pos&&!player.hasPerk(SD4)&&!player.hasPerk(SD5))
		player.removePerk(SD3)
		player.addPerk(SD4)
		perked=true
	ElseIf (Option == SD5pos&&!player.hasPerk(SD5))
		player.removePerk(SD4)
		player.addPerk(SD5)
		perked=true
	EndIf
	
	If (Option == R1Pos&&!player.hasPerk(R1)&&!player.hasPerk(R2)&&!player.hasPerk(R3)&&!player.hasPerk(R4)&&!player.hasPerk(R5))
		player.addPerk(R1)
		perked=true
	ElseIf (Option == R2Pos&&!player.hasPerk(R2)&&!player.hasPerk(R3)&&!player.hasPerk(R4)&&!player.hasPerk(R5))
		player.removePerk(R1)
		player.addPerk(R2)
		perked=true
	ElseIf (Option == R3Pos&&!player.hasPerk(R3)&&!player.hasPerk(R4)&&!player.hasPerk(R5))
		player.removePerk(R2)
		player.addPerk(R3)
		perked=true
	ElseIf (Option == R4Pos&&!player.hasPerk(R4)&&!player.hasPerk(R5))
		player.removePerk(R3)
		player.addPerk(R4)
		perked=true
	ElseIf (Option == R5pos&&!player.hasPerk(R5))
		player.removePerk(R4)
		player.addPerk(R5)
		perked=true
	EndIf
	
	 If (Option == S1Pos&&!player.hasPerk(S1)&&!player.hasPerk(S2)&&!player.hasPerk(S3)&&!player.hasPerk(S4)&&!player.hasPerk(S5))
		 player.addPerk(S1)
		perked=true
	ElseIf (Option == S2Pos&&!player.hasPerk(S2)&&!player.hasPerk(S3)&&!player.hasPerk(S4)&&!player.hasPerk(S5))
		player.removePerk(S1)
		player.addPerk(S2)
		perked=true
	ElseIf (Option == S3Pos&&!player.hasPerk(S3)&&!player.hasPerk(S4)&&!player.hasPerk(S5))
		player.removePerk(S2)
		player.addPerk(S3)
		perked=true
	ElseIf (Option == S4Pos&&!player.hasPerk(S4)&&!player.hasPerk(S5))
		player.removePerk(S3)
		player.addPerk(S4)
		perked=true
	ElseIf (Option == S5pos&&!player.hasPerk(S5))
		player.removePerk(S4)
		player.addPerk(S5)
		perked=true
	ElseIf (Option == PGPos&&!player.hasPerk(PG))
		player.addPerk(PG)
		perked=true
	ElseIf (Option == DEPos&&!player.hasPerk(DE))
		player.addPerk(DE)
		perked=True
	ElseIf (Option == COPos&&!player.hasPerk(CO))
		player.addPerk(CO)
		perked=true
	EndIf
	
	If (perked)
		perkPoints.setValue(-1+perkPoints.getValue())
		perkSound.play(player)
		forcepagereset()
	EndIf

ElseIf (thePage==3&&perkPoints.getValueInt()>0)
	Actor Player=Game.GetPlayer()
	bool perked=false
	If (Option == V1Pos&&!player.hasPerk(V1)&&!player.hasPerk(V2)&&!player.hasPerk(V3)&&!player.hasPerk(V4)&&!player.hasPerk(V5))
		player.addPerk(V1)
		perked=true
	ElseIf (Option == V2Pos&&!player.hasPerk(V2)&&!player.hasPerk(V3)&&!player.hasPerk(V4)&&!player.hasPerk(V5))
		player.removePerk(V1)
		player.addPerk(V2)
		perked=true
	ElseIf (Option == V3Pos&&!player.hasPerk(V3)&&!player.hasPerk(V4)&&!player.hasPerk(V5))
		player.removePerk(V2)
		player.addPerk(V3)
		perked=true
	ElseIf (Option == V4Pos&&!player.hasPerk(V4)&&!player.hasPerk(V5))
		player.removePerk(V3)
		player.addPerk(V4)
		perked=true
	ElseIf (Option == V5pos&&!player.hasPerk(V5))
		player.removePerk(V4)
		player.addPerk(V5)
		perked=true
	ElseIf (Option == IS1Pos&&!player.hasPerk(IS1)&&!player.hasPerk(IS2)&&!player.hasPerk(IS3))
		player.addPerk(IS1)
		perked=true
	ElseIf (Option == IS2Pos&&!player.hasPerk(IS2)&&!player.hasPerk(IS3))
		player.removePerk(IS1)
		player.addPerk(IS2)
		perked=true
	ElseIf (Option == IS3Pos&&!player.hasPerk(IS3))
		player.removePerk(IS2)
		player.addPerk(IS3)
		perked=true
	ElseIf (Option == SA1Pos&&!player.hasPerk(SA1)&&!player.hasPerk(SA2)&&!player.hasPerk(SA3))
		player.addPerk(SA1)
		perked=true
	ElseIf (Option == SA2Pos&&!player.hasPerk(SA2)&&!player.hasPerk(SA3))
		player.removePerk(SA1)
		player.addPerk(SA2)
		perked=true
	ElseIf (Option == SA3Pos&&!player.hasPerk(SA3))
		player.removePerk(SA2)
		player.addPerk(SA3)
		perked=true
	ElseIf (Option == N1Pos&&!player.hasPerk(N1)&&!player.hasPerk(N2))
		player.addPerk(N1)
		perked=true
	ElseIf (Option == N2Pos&&!player.hasPerk(N2))
		player.removePerk(N1)
		player.addPerk(N2)
		perked=true
	ElseIf (Option == SSpos&&!player.hasPerk(SS))
		player.addPerk(SS)
		perked=true
	ElseIf (Option == SFPos&&!player.hasPerk(SF))
		player.addPerk(SF)
		perked=true
	ElseIf (Option == CGPos&&!player.hasPerk(CG))
		player.addPerk(CG)
		perked=true
	ElseIf (Option == RDPos&&!player.hasPerk(RD))
		player.addPerk(RD)
		perked=true
	ElseIf (Option == CEPos&&!player.hasPerk(CE))
		player.addPerk(CE)
		perked=true
	EndIf

	If (perked)
		perkPoints.setValue(-1+perkPoints.getValue())
		perkSound.play(player)
		forcepagereset()
	EndIf


EndIf
EndEvent

event OnOptionSliderOpen(int option)
	if (option == dTimePos)
			SetSliderDialogStartValue(dTime)
			SetSliderDialogDefaultValue(1.0)
			SetSliderDialogRange(0.1, 10.0)
			SetSliderDialogInterval(0.1)
	ElseIf (Option == dMinPos)
		SetSliderDialogStartValue(dMin)
			SetSliderDialogDefaultValue(250.0)
			SetSliderDialogRange(10.0, 10000.0)
			SetSliderDialogInterval(10.0)
	ElseIf (Option == sMinPos)
		SetSliderDialogStartValue(sMin)
			SetSliderDialogDefaultValue(5.0)
			SetSliderDialogRange(1.0, 100)
			SetSliderDialogInterval(1.0)
	ElseIf (Option == NPCbonusPos)
		SetSliderDialogStartValue(NPCbonus)
			SetSliderDialogDefaultValue(1.0)
			SetSliderDialogRange(0.1, 10)
			SetSliderDialogInterval(0.1)
	ElseIf (Option == weightPos)
		SetSliderDialogStartValue(weight)
			SetSliderDialogDefaultValue(2.0)
			SetSliderDialogRange(0.0, 100)
			SetSliderDialogInterval(1.0)
		ElseIf (Option == bellyscaleminpos)
			SetSliderDialogStartValue(bellyscaleint)
			SetSliderDialogDefaultValue(1)
			SetSliderDialogRange(0.0, 10)
			SetSliderDialogInterval(0.1)
		ElseIf (Option == damagemodPos)
			SetSliderDialogStartValue(damagemodf)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.1, 20)
		SetSliderDialogInterval(0.1)			
	  EndIf
EndEvent

event OnOptionSliderAccept(int option, float value)
	If (Option == dTimePos)
		dTimeGlobal.setValue(value)
		dTime=dTimeGlobal.getValue()
		setSliderOptionValue(option, dTime, "{1}x")
	ElseIf (Option == dMinPos)
		dMinGlobal.setValue(value)
		dMin=dMinGlobal.getValueInt()
		setSliderOptionValue(option, dMin, "{0} seconds")
	ElseIf (Option == sMinPos)
		sMinGlobal.setValue(value)
		sMin=sMinGlobal.getValueInt()
		setSliderOptionValue(option, sMin, "{0} percent")
	 ElseIf (Option == bellyscaleminpos)
		_bellyscale.setValue(value)
		bellyscaleint=_bellyscale.getValue()
		setSliderOptionValue(option, bellyscaleint, "{1}x")
	ElseIf (Option == NPCbonusPos)
		NPCbonusGlobal.setValue(value)
		NPCbonus=NPCbonusGlobal.getValue()
		setSliderOptionValue(option, NPCbonus, "{1}x")
	ElseIf (Option == weightPos)
		weightGlobal.setValue(value)
		weight=weightGlobal.getValueInt()
		setSliderOptionValue(option, weight, "{0} percent")
	ElseIf (Option == damagemodPos)
		damagemod.setValue(value)
		damagemodf=damagemod.getValue()
		setSliderOptionValue(option, damagemodf, "{1}x")
	EndIf
EndEvent

event OnOptionMenuOpen(int option)
	   if (option == NPCpredPos)
			 SetMenuDialogOptions(NPCpredList)
			 SetMenuDialogStartIndex(NPCpred)
			 SetMenuDialogDefaultIndex(1)
	ElseIf (Option == fatePos)
		SetMenuDialogOptions(fateList)
		SetMenuDialogStartIndex(fate)
		SetMenuDialogDefaultIndex(1)
	ElseIf (Option == skillPos)
		SetMenuDialogOptions(notList)
		SetMenuDialogStartIndex(skill)
		SetMenuDialogDefaultIndex(4)
	  EndIf
EndEvent

event OnOptionMenuAccept(int option, int index)
	if (option == NPCpredPos)
		NPCpredGlobal.setValue(index)
		NPCpred=NPCpredGlobal.getValueInt()
		setMenuOptionValue(option, NPCpredList[NPCpred])
	ElseIf (option == fatePos)
		fateGlobal.setValue(index)
		fate=fateGlobal.getValueInt()
		setMenuOptionValue(option, fateList[fate])
	ElseIf (option == skillPos)
		skillGlobal.setValue(index)
		skill=skillGlobal.getValueInt()
		setMenuOptionValue(option, notList[skill])
	EndIf
EndEvent

event OnOptionDefault(int option)
If (thePage==1)
	If (Option == NPCpredPos)
		NPCpredGlobal.setValue(1)
		NPCpred=NPCpredGlobal.getValueInt()
		setMenuOptionValue(option, NPCpredList[NPCpred])
	ElseIf (Option == fatePos)
		fateGlobal.setValue(1)
		fate=fateGlobal.getValueInt()
		setMenuOptionValue(option, fateList[fate])
	ElseIf (Option == skillPos)
		skillGlobal.setValue(4)
		skill=skillGlobal.getValueInt()
		setMenuOptionValue(option, notList[skill])
	ElseIf (Option == essentialPos)
		essentialGlobal.setValue(0)
		essential=essentialGlobal.getValueInt() as Bool
		setToggleOptionValue(essentialPos, essential)
	EndIf
ElseIf (thePage==2)
	If (Option == dTimePos)
		dTimeGlobal.setValue(1)
		dTime=dTimeGlobal.getValue()
		setSliderOptionValue(option, dTime, "{1}x")
	ElseIf (Option == dMinPos)
		dMinGlobal.setValue(250)
		dMin=dMinGlobal.getValueInt()
		setSliderOptionValue(option, dMin, "{0} seconds")
	ElseIf (Option == sMinPos)
		sMinGlobal.setValue(5)
		sMin=sMinGlobal.getValueInt()
		setSliderOptionValue(option, sMin, "{0} percent")
	ElseIf (Option == NPCbonusPos)
		NPCbonusGlobal.setValue(1)
		NPCbonus=NPCbonusGlobal.getValue()
		setSliderOptionValue(option, NPCbonus, "{1}x")
	ElseIf (Option == weightPos)
		weightGlobal.setValue(2)
		weight=weightGlobal.getValueInt()
		setSliderOptionValue(option, weight, "{0} percent")
	ElseIf (Option == damagemodPos)
		damagemod.setValue(1)
		damagemodf=damagemod.getValue()
		setSliderOptionValue(option,damagemodf, "{1}x")
	EndIf
EndIf
EndEvent

event OnOptionHighlight(int option)
If (thePage==1)
	If (Option == NPCpredPos)
		SetInfoText("Choose whether only the player, all female NPCs, or only the player and female followers can swallow")
	ElseIf (Option == fatePos)
		SetInfoText("If absorption is chosen, the prey's items will be added to the predator's inventory")
	ElseIf (Option == skillPos)
		SetInfoText("If a character had a skill higher than yours, digesting them will add one point to that skill")
	ElseIf (Option == essentialPos)
		SetInfoText("This can easily break quests; use at your own risk!")
	ElseIf (Option == newPlayerPos)
		SetInfoText("Continue playing as the character who digested you, inheriting her skills and other stats.\nPerks are cleared and converted to perk points. Currently this only works for female characters.")
	ElseIf (Option == raceMenuPos)
		SetInfoText("Disable minor character customization window after character switch. Can prevent crashes.")
	ElseIf (Option == DebugJB)
		SetInfoText("This will enable or disable debugging. The messages will be posted on your Papyrus logging, AND on your console in real time. If you have any questions or have errors, please grab a copy of your papyrus log, and find SCHAKEN at HTTPS://SCHAKEN-MODSCHAT.COM")
	EndIf
ElseIf (thePage==2)
	If (Option == dTimePos)
		SetInfoText("Digestion damage will be adjusted inversely for balance reasons")
	ElseIf (Option == dMinPos)
		SetInfoText("Dead characters will take this long to digest. This occurs 50x as quickly in combat, or when Rapid Digestion is cast.")
	ElseIf (Option == sMinPos)
		SetInfoText("All predators have at least this chance of swallowing anyone")
	ElseIf (Option == NPCbonusPos)
		SetInfoText("NPCs' swallow chances are multiplied by this value. This applies to followers as well.")
	ElseIf (Option == weightPos)
		SetInfoText("When someone digests a character, her weight slider will increase by this amount.")
	ElseIf (Option == damagemodPos)
		SetInfoText("The stomach acid damage is multiplied by this value.")
	EndIf
ElseIf (thePage==3)
	If (Option == V1Pos)
		SetInfoText("Swallow bonus improves by 20%")
	ElseIf (Option == V2Pos)
		SetInfoText("Swallow bonus improves by 40% (Minimum skill 20)")
	ElseIf (Option == V3Pos)
		SetInfoText("Swallow bonus improves by 60% (Minimum skill 40)")
	ElseIf (Option == V4Pos)
		SetInfoText("Swallow bonus improves by 80% (Minimum skill 60)")
	ElseIf (Option == V5Pos)
		SetInfoText("Swallow bonus is doubled (Minimum skill 80)")
	ElseIf (Option == IS1Pos)
		SetInfoText("Hold prey in your stomach 50% longer (Minimum skill 25)")
	ElseIf (Option == IS2Pos)
		SetInfoText("Hold prey in your stomach 100% longer (Minimum skill 50)")
	ElseIf (Option == IS3Pos)
		SetInfoText("Hold prey in your stomach 150% longer (Minimum skill 75)")
	ElseIf (Option == SA1Pos)
		SetInfoText("Your stomach deals 50% more damage per second (Minimum skill 30)")
	ElseIf (Option == SA2Pos)
		SetInfoText("Your stomach deals 100% more damage per second (Minimum skill 60)")
	ElseIf (Option == SA3Pos)
		SetInfoText("Your stomach deals 150% more damage per second (Minimum skill 90)")
	ElseIf (Option == N1Pos)
		SetInfoText("Recover twice as much health and stamina while digesting prey (Minimum skill 35)")
	ElseIf (Option == N2Pos)
		SetInfoText("Recover magicka while digesting prey (Minimum skill 45)")
	ElseIf (Option == CEpos)
		SetInfoText("Gain twice the permanent health/magicka/stamina bonuses by digesting prey (Minimum skill 60)")
	ElseIf (Option == SSPos)
		SetInfoText("Swallowing someone does not break stealth (Minimum skill 30)")
	ElseIf (Option == CGpos)
		SetInfoText("You Constrict prey while swallowing them, preventing any retaliation(Minimum skill 90)")
	ElseIf (Option == RDpos)
		SetInfoText("Your stomach binds the bones of digested prey, raising the dead(Minimum skill 90)")
	ElseIf (Option == SFpos)
		SetInfoText("Trap the souls of digested prey in your stomach (Minimum skill 100)")
	EndIf
ElseIf (thePage==4)
	If (Option == SD1Pos)
		SetInfoText("Struggling Damage improves by 20%")
	ElseIf (Option == SD2Pos)
		SetInfoText("Struggling Damage improves by 40% (Minimum skill 20)")
	ElseIf (Option == SD3Pos)
		SetInfoText("Struggling Damage improves by 60% (Minimum skill 40)")
	ElseIf (Option == SD4Pos)
		SetInfoText("Struggling Damage improves by 80% (Minimum skill 60)")
	ElseIf (Option == Sd5Pos)
		SetInfoText("Struggling Damage is doubled (Minimum skill 80)")
		
	ElseIf (Option == R1Pos)
		SetInfoText("Acid Resistance improves by 10%")
	ElseIf (Option == R2Pos)
		SetInfoText("Acid Resistance improves by 20% (Minimum skill 20)")
	ElseIf (Option == R3Pos)
		SetInfoText("Acid Resistance improves by 30% (Minimum skill 40)")
	ElseIf (Option == R4Pos)
		SetInfoText("Acid Resistance improves by 40% (Minimum skill 60)")
	ElseIf (Option == R5Pos)
		SetInfoText("Acid Resistance improves by 50% (Minimum skill 80)")
		
	ElseIf (Option == S1Pos)
		SetInfoText("Swallow Resistance improves by 10%")
	ElseIf (Option == S2Pos)
		SetInfoText("Swallow Resistance improves by 20% (Minimum skill 20)")
	ElseIf (Option == S3Pos)
		SetInfoText("Swallow Resistance improves by 30% (Minimum skill 40)")
	ElseIf (Option == S4Pos)
		SetInfoText("Swallow Resistance improves by 40% (Minimum skill 60)")
	ElseIf (Option == S5Pos)
		SetInfoText("Swallow Resistance improves by 50% (Minimum skill 80)")
		
	ElseIf (Option == PGPos)
		SetInfoText("Deal Massive Damage to pred when escaping (Minimum skill 50)")
	ElseIf (Option == DEPos)
		SetInfoText("Recover Health While in friendly Stomachs(Minimum skill 25)")
	ElseIf (Option == CEPos)
		SetInfoText("Being in a friendly stomach adds the well rested effect(Minimum skill 25)")
	EndIf
	
ElseIf (thePage==5)
If (Option == playercentricpos)
   SetInfoText("The player needs to be involved in every swallow attempt either as prey or predator")
ElseIf (Option == unwillingaudiopos)
   SetInfoText("When humanoid prey is swallowed unwilling struggling audio is played")
ElseIf (Option == ScatMoanspos)
   SetInfoText("Humanoids will make gender specific sounds during scat")
ElseIf (Option == Morphonlypos)
   SetInfoText("Humanoids will always try to use morphs instead of the normal belly. Regardless if the morphvore keyword is present or not")
ElseIf (Option == strippos)
   SetInfoText("The player is stripped of gear when swallowed")
ElseIf (Option == noescapepos)
   SetInfoText("Swallowed prey cannot escape their predators stomach unless the struggle mechanic is used")
EndIf
EndIf
EndEvent