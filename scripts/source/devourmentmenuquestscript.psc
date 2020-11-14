Scriptname DevourmentMenuQuestScript extends SKI_ConfigBase  

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

float dTime = 1.0
int dMin = 250
int sMin = 5
float bellyscaleint= 1.0
float NPCbonus = 1.0
int weight = 2
float damagemodf = 1.0

int flag=0

int thePage=0

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
    return 70
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
        Pages = new string[6]
          Pages[0] = "Stats"
    Pages[1] = "Basic"
    Pages[2] = "Tweaks"
    Pages[3] = "Predator Perks"
    Pages[4] = "Prey Perks"
    Pages[5] = "Toggles"
    endif
    if (a_version >= 54 && version.getValue()<54 )
        version.setValue(54)
       
            Game.getPlayer().addSpell(rapidDigestion)
        
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
        dTimePos=addSliderOption("Digestion time multiplier",dTime,"{1}x")
        dMinPos=addSliderOption("Body digestion time",dMin,"{0} seconds")
        sMinPos=addSliderOption("Minimum swallow chance",sMin,"{0} percent")
        bellyscaleminpos=addSliderOption("Belly Size",bellyscaleint,"{1} Size")
        NPCbonusPos=addSliderOption("NPC swallow chance multiplier",NPCbonus,"{1}x")
        weightPos=addSliderOption("Weight gain per NPC digested",weight,"{0} percent")
        damagemodpos=addSliderOption("Stomach acid damage multiplier",damagemodf,"{1}x")
        thePage=2
    elseif(page=="Predator Perks" )
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
        CGpos=addToggleOption("Constricting Grip",player.hasPerk(CG),flag)
        flag=0
        if(player.getAV("Variable05")<75)
            flag=OPTION_FLAG_DISABLED
        endif
        RDpos=addToggleOption("Stomach Bound Thralls",player.hasPerk(RD),flag)
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
    elseif(page=="Stats")
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
        float StruggleDamage=ManagerQuest.getstrugglingdamage(Player, Notplayer)
        int acidresistance=ManagerQuest.getAcidResistance(Player, Notplayer)
        float swallowresistance=(15+Player.getAV("Variable05")+Player.getAV("FavorPointsBonus"))
        if(player.hasperk(S1))
            swallowresistance *= 1.1
        ElseIf(player.hasperk(S2))
            swallowresistance *= 1.2
        ElseIf(player.hasperk(S3))
            swallowresistance *= 1.3
        ElseIf(player.hasperk(S4))
            swallowresistance *= 1.4
        ElseIf(player.hasperk(S5))
            swallowresistance *= 1.5
        endif
        
        setCursorFillMode(TOP_TO_BOTTOM)
        addHeaderOption("Devourment v0.70") 
        addHeaderOption("Statistics")
        addTextOption("Devourment skill: ",""+(Player.getAV("Variable05")+15) as Int)
        addTextOption("Devourment perk points: ",""+PerkPoints.getValue() as Int)
        addEmptyOption()
        addTextOption("Swallow bonus: ",""+swallowBonus as Int)
        addTextOption("Swallow resistance: ",swallowresistance as Int)
        addTextOption("Stomach damage/sec: ",""+Damage as Int)
        addTextOption("Struggling damage: ",""+StruggleDamage as Int)
        addTextOption("Digestion duration: ",""+maxTime as Int)
        addTextOption("Acid resistance: ",acidresistance+"%" as int)
        setCursorPosition(1)
        addHeaderOption("Total victims digested: "+numVictims)
        addTextOption("Women digested: ",""+_WomenEaten.getValueInt())
        addTextOption("Men digested: ",""+_MenEaten.getValueInt())
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
        addTextOption("Dragons digested: ",""+_DragonEaten.getValueInt())
        addTextOption("Horses digested: ",""+_HorseEaten.getValueInt())
        addTextOption("Trolls digested: ",""+_TrollEaten.getValueInt())
        addTextOption("Draugrs digested: ",""+_DraugrEaten.getValueInt())
        addTextOption("Falmer digested: ",""+_FalmerEaten.getValueInt())
        addTextOption("Foxes digested: ",""+_FoxEaten.getValueInt())
        addTextOption("Slaughterfish digested: ",""+_FishEaten.getValueInt())
        addTextOption("Bears digested: ",""+_BearEaten.getValueInt())
        addTextOption("Mudcrabs digested: ",""+_MudcrabEaten.getValueInt())
        addTextOption("Spiders digested: ",""+_SpiderEaten.getValueInt())
        addTextOption("Chickens digested: ",""+_ChickenEaten.getValueInt())
        addTextOption("Dogs digested: ",""+_DogEaten.getValueInt())
        addTextOption("Deers digested: ",""+_DeerEaten.getValueInt())
        addTextOption("Goats digested: ",""+_GoatEaten.getValueInt())
        addTextOption("Cows digested: ",""+_CowEaten.getValueInt())
        addTextOption("Chaurus digested: ",""+_ChaurusEaten.getValueInt())
        addTextOption("Giants digested: ",""+_GiantEaten.getValueInt())
        addTextOption("Dwarven Machines digested: ",""+_DwarvenMachineEaten.getValueInt())
        addTextOption("Hagravens digested: ",""+_HagravenEaten.getValueInt())
        addTextOption("Mammoths digested: ",""+_MammothEaten.getValueInt())
        addTextOption("Sabrecats digested: ",""+_SabrecatEaten.getValueInt())
        addTextOption("Werewolves digested: ",""+_WerewolfEaten.getValueInt())
        addTextOption("Wolves digested: ",""+_WolfEaten.getValueInt())
        addTextOption("Dragon Priests digested: ",""+_DragonPriestEaten.getValueInt())
        addTextOption("Dremora digested: ",""+_DremoraEaten.getValueInt())
        addTextOption("Hares digested: ",""+_HareEaten.getValueInt())
        addTextOption("Horkers digested: ",""+_HorkerEaten.getValueInt())
        addTextOption("Vampires digested: ",""+_VampireEaten.getValueInt())       
        addTextOption("Previous Dovahkiins digested: ",""+prevDov.getValueInt())
        if(prevDov.getValueInt()>0)
            addTextOption("Last Dovahkiin digested: ",NameQuest.lastName)
        endif

        thePage=4
    elseif(page=="Toggles")
        UnloadCustomContent()
    fempredpos=addToggleOption("Female predators",fempredbool)
    malepredpos=addToggleOption("Male predators",malepredbool)
    multipreypos=addToggleOption("Player multiprey",multipreybool )
    multipreynpcpos=addToggleOption("Npc multiprey",multipreynpcbool )
    animalpredpos=addToggleOption("Animal predators",animalpredbool )
    strugglepos=addToggleOption("Struggle Mechanic",strugglebool)
    shititemspos=addToggleOption("Prey's gear shown when disposed",shititemsbool)
    breastvorepos=addToggleOption("Breast Vore",breastvorebool)
    Cockvorepos=addToggleOption("Cock Vore",cockvorebool)
    noescapepos=addToggleOption("No escape once swallowed",noescapebool)
    strippos=addToggleOption("Player Strips in Stomach",stripbool)
    loadscreenpos=addToggleOption("Loading screens",loadscreenbool)
    playercentricpos=addToggleOption("Player Centric",playercentricbool)
    unwillingaudiopos=addToggleOption("Unwilling Struggling Sounds",unwillingaudiobool)
    ScatMoanspos=addToggleOption("Scat Sounds",ScatMoansbool)
    MorphOnlypos=addToggleOption("Only Morphs",MorphOnlybool)
    
    
    
    
    thePage=5
    elseif(page=="Prey perks")
      UnloadCustomContent()
        setCursorFillMode(TOP_TO_BOTTOM)
        addHeaderOption("Devourment skill: "+(player.getAV("Variable05")+15) as Int+"        Perk points: "+perkPoints.getValueInt())
        

        
        
        ;; Resilience perks
        R1pos=addToggleOption("Resilience I",player.hasPerk(R1)||player.hasPerk(R2)||player.hasPerk(R3)||player.hasPerk(R4)||player.hasPerk(R5))
        if((!player.hasPerk(R1)&&!player.hasPerk(R2)&&!player.hasPerk(R3)&&!player.hasPerk(R4)&&!player.hasPerk(R5)) || player.getAV("Variable05")<5)
            flag=OPTION_FLAG_DISABLED
        endif
        R2pos=addToggleOption("Resilience II",player.hasPerk(R2)||player.hasPerk(R3)||player.hasPerk(R4)||player.hasPerk(R5),flag)
        flag=0
        if((!player.hasPerk(R2)&&!player.hasPerk(R3)&&!player.hasPerk(R4)&&!player.hasPerk(R5)) || player.getAV("Variable05")<25)
            flag=OPTION_FLAG_DISABLED
        endif
        R3pos=addToggleOption("Resilience III",player.hasPerk(R3)||player.hasPerk(R4)||player.hasPerk(R5),flag)
        flag=0
        if((!player.hasPerk(R3)&&!player.hasPerk(R4)&&!player.hasPerk(R5)) || player.getAV("Variable05")<45)
            flag=OPTION_FLAG_DISABLED
        endif
        R4pos=addToggleOption("Resilience IV",player.hasPerk(R4)||player.hasPerk(R5),flag)
        flag=0
        if((!player.hasPerk(R4)&&!player.hasPerk(R5)) || player.getAV("Variable05")<65)
            flag=OPTION_FLAG_DISABLED
        endif
        R5pos=addToggleOption("Resilience V",player.hasPerk(R5),flag)
        flag=0
        setCursorPosition(1)
        ;; Slippery perks
        S1pos=addToggleOption("Slippery I",player.hasPerk(S1)||player.hasPerk(S2)||player.hasPerk(S3)||player.hasPerk(S4)||player.hasPerk(S5))
        if((!player.hasPerk(S1)&&!player.hasPerk(S2)&&!player.hasPerk(S3)&&!player.hasPerk(S4)&&!player.hasPerk(S5)) || player.getAV("Variable05")<5)
            flag=OPTION_FLAG_DISABLED
        endif
        S2pos=addToggleOption("Slippery II",player.hasPerk(S2)||player.hasPerk(S3)||player.hasPerk(S4)||player.hasPerk(S5),flag)
        flag=0
        if((!player.hasPerk(S2)&&!player.hasPerk(S3)&&!player.hasPerk(S4)&&!player.hasPerk(S5)) || player.getAV("Variable05")<25)
            flag=OPTION_FLAG_DISABLED
        endif
        S3pos=addToggleOption("Slippery III",player.hasPerk(S3)||player.hasPerk(S4)||player.hasPerk(S5),flag)
        flag=0
        if((!player.hasPerk(S3)&&!player.hasPerk(S4)&&!player.hasPerk(S5)) || player.getAV("Variable05")<45)
            flag=OPTION_FLAG_DISABLED
        endif
        S4pos=addToggleOption("Slippery IV",player.hasPerk(S4)||player.hasPerk(S5),flag)
        flag=0
        if((!player.hasPerk(S4)&&!player.hasPerk(S5)) || player.getAV("Variable05")<65)
            flag=OPTION_FLAG_DISABLED
        endif
        S5pos=addToggleOption("Slippery V",player.hasPerk(S5),flag)
        flag=0       
        if(player.getAV("Variable05")<80)
            flag=OPTION_FLAG_DISABLED
        endif
        
        
        
         PGpos=addToggleOption("Parting Gift",player.hasPerk(PG),flag)
        flag=0
        if(player.getAV("Variable05")<35)
            flag=OPTION_FLAG_DISABLED
        endif
         DEpos=addToggleOption("Delicious",player.hasPerk(DE),flag)
        flag=0
        if(player.getAV("Variable05")<10)
            flag=OPTION_FLAG_DISABLED
        endif        
        COpos=addToggleOption("Comfy",player.hasPerk(CO),flag)
        flag=0
        if(player.getAV("Variable05")<10)
            flag=OPTION_FLAG_DISABLED
        endif
        
        
        setCursorPosition(1)              
        if(player.getAV("Variable05")<10)
            flag=OPTION_FLAG_DISABLED
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

    endif
elseif(thePage==5)
    if(option==fempredpos)
        if(fempredbool==true)
            fempred.setValue(0)
        else
            fempred.setValue(1)
        endif
        fempredbool=fempred.getValueInt() as Bool
        setToggleOptionValue(fempredpos,fempredbool)   
  
    elseif(option==malepredpos)
        if(malepredbool==true)
            malepred.setValue(0)
        else
            malepred.setValue(1)
        endif
        malepredbool=malepred.getValueInt() as Bool
        setToggleOptionValue(malepredpos,malepredbool)
    elseif(option==multipreypos)
        if(multipreybool==true)
            multiprey.setValue(0)
        else
            multiprey.setValue(1)
        endif
        multipreybool=multiprey.getValueInt() as Bool
        setToggleOptionValue(multipreypos,multipreybool)
    elseif(option==multipreynpcpos)
        if(multipreynpcbool==true)
            multipreynpc.setValue(0)
        else
            multipreynpc.setValue(1)
        endif
        multipreynpcbool=multipreynpc.getValueInt() as Bool
        setToggleOptionValue(multipreynpcpos,multipreynpcbool)
    elseif(option==animalpredpos)
        if(animalpredbool==true)
            animalpred.setValue(0)
        else
            animalpred.setValue(1)
        endif
        animalpredbool=animalpred.getValueInt() as Bool
        setToggleOptionValue(animalpredpos,animalpredbool)
    elseif(option==StrugglePos)
        if(Strugglebool==true)
            Struggle.setValue(0)
        else
            Struggle.setValue(1)
        endif
        Strugglebool=Struggle.getValueInt() as Bool
        setToggleOptionValue(StrugglePos, Strugglebool)
    elseif(option==ShititemsPos)
        if(Shititemsbool==true)
            Shititems.setValue(0)
        else
            Shititems.setValue(1)
        endif
        Shititemsbool=Shititems.getValueInt() as Bool
        setToggleOptionValue(ShititemsPos, Shititemsbool)
    elseif(option==breastvorePos)
        if(breastvorebool==true)
            breastvore.setValue(0)
        else
            breastvore.setValue(1)
        endif
        breastvorebool=breastvore.getValueInt() as Bool
        setToggleOptionValue(breastvorePos, breastvorebool)
    elseif(option==cockvorePos)
        if(cockvorebool==true)
            cockvore.setValue(0)
        else
            cockvore.setValue(1)
        endif
        cockvorebool=cockvore.getValueInt() as Bool
        setToggleOptionValue(cockvorePos, cockvorebool)
    elseif(option==morphanimPos)
        if(morphanimbool==true)
            morphanim.setValue(0)
        else
            morphanim.setValue(1)
        endif
        morphanimbool= morphanim.getValueInt() as Bool
        setToggleOptionValue(morphanimPos, morphanimbool)
    elseif(option==NoescapePos)
        if(Noescapebool==true)
            Noescape.setValue(0)
        else
            Noescape.setValue(1)
        endif
        Noescapebool=Noescape.getValueInt() as Bool
        setToggleOptionValue(NoescapePos, Noescapebool)
    elseif(option==stripPos)
        if(stripbool==true)
            strip.setValue(0)
        else
            strip.setValue(1)
        endif
        stripbool=strip.getValueInt() as Bool
        setToggleOptionValue(stripPos, stripbool)
    elseif(option==loadscreenPos)
        if(loadscreenbool==true)
            loadscreen.setValue(0)
        else
            loadscreen.setValue(1)
        endif
        loadscreenbool=loadscreen.getValueInt() as Bool
        setToggleOptionValue(loadscreenPos, loadscreenbool)
    elseif(option==playercentricPos)
        if(playercentricbool==true)
            playercentric.setValue(0)
        else
            playercentric.setValue(1)
        endif
        playercentricbool=playercentric.getValueInt() as Bool
        setToggleOptionValue(playercentricPos, playercentricbool)
    elseif(option==unwillingaudioPos)
        if(unwillingaudiobool==true)
            unwillingaudio.setValue(0)
        else
            unwillingaudio.setValue(1)
        endif
        unwillingaudiobool=unwillingaudio.getValueInt() as Bool
        setToggleOptionValue(unwillingaudioPos, unwillingaudiobool)
    elseif(option==ScatMoansPos)
        if(ScatMoansbool==true)
            ScatMoans.setValue(0)
        else
            ScatMoans.setValue(1)
        endif
        ScatMoansbool=ScatMoans.getValueInt() as Bool
        setToggleOptionValue(ScatMoansPos, ScatMoansbool)
    elseif(option==morphonlyPos)
        if(morphonlybool==true)
            morphonly.setValue(0)
        else
            morphonly.setValue(1)
        endif
        morphonlybool=morphonly.getValueInt() as Bool
        setToggleOptionValue(morphonlyPos, morphonlybool)
    
   
    endif
elseif(thePage==4&&perkPoints.getValueInt()>0)
    Actor Player=Game.GetPlayer()
    bool perked=false
    if(option==SD1Pos&&!player.hasPerk(SD1)&&!player.hasPerk(SD2)&&!player.hasPerk(SD3)&&!player.hasPerk(SD4)&&!player.hasPerk(SD5))
        player.addPerk(SD1)
        perked=true
    elseif(option==SD2Pos&&!player.hasPerk(SD2)&&!player.hasPerk(SD3)&&!player.hasPerk(SD4)&&!player.hasPerk(SD5))
        player.removePerk(SD1)
        player.addPerk(SD2)
        perked=true
    elseif(option==SD3Pos&&!player.hasPerk(SD3)&&!player.hasPerk(SD4)&&!player.hasPerk(SD5))
        player.removePerk(SD2)
        player.addPerk(SD3)
        perked=true
    elseif(option==SD4Pos&&!player.hasPerk(SD4)&&!player.hasPerk(SD5))
        player.removePerk(SD3)
        player.addPerk(SD4)
        perked=true
    elseif(option==SD5pos&&!player.hasPerk(SD5))
        player.removePerk(SD4)
        player.addPerk(SD5)
        perked=true
    endif
    
    if(option==R1Pos&&!player.hasPerk(R1)&&!player.hasPerk(R2)&&!player.hasPerk(R3)&&!player.hasPerk(R4)&&!player.hasPerk(R5))
        player.addPerk(R1)
        perked=true
    elseif(option==R2Pos&&!player.hasPerk(R2)&&!player.hasPerk(R3)&&!player.hasPerk(R4)&&!player.hasPerk(R5))
        player.removePerk(R1)
        player.addPerk(R2)
        perked=true
    elseif(option==R3Pos&&!player.hasPerk(R3)&&!player.hasPerk(R4)&&!player.hasPerk(R5))
        player.removePerk(R2)
        player.addPerk(R3)
        perked=true
    elseif(option==R4Pos&&!player.hasPerk(R4)&&!player.hasPerk(R5))
        player.removePerk(R3)
        player.addPerk(R4)
        perked=true
    elseif(option==R5pos&&!player.hasPerk(R5))
        player.removePerk(R4)
        player.addPerk(R5)
        perked=true
    endif
    
     if(option==S1Pos&&!player.hasPerk(S1)&&!player.hasPerk(S2)&&!player.hasPerk(S3)&&!player.hasPerk(S4)&&!player.hasPerk(S5))
         player.addPerk(S1)
        perked=true
    elseif(option==S2Pos&&!player.hasPerk(S2)&&!player.hasPerk(S3)&&!player.hasPerk(S4)&&!player.hasPerk(S5))
        player.removePerk(S1)
        player.addPerk(S2)
        perked=true
    elseif(option==S3Pos&&!player.hasPerk(S3)&&!player.hasPerk(S4)&&!player.hasPerk(S5))
        player.removePerk(S2)
        player.addPerk(S3)
        perked=true
    elseif(option==S4Pos&&!player.hasPerk(S4)&&!player.hasPerk(S5))
        player.removePerk(S3)
        player.addPerk(S4)
        perked=true
    elseif(option==S5pos&&!player.hasPerk(S5))
        player.removePerk(S4)
        player.addPerk(S5)
        perked=true
    elseif(option==PGPos&&!player.hasPerk(PG))
        player.addPerk(PG)
        perked=true
    elseif(option==DEPos&&!player.hasPerk(DE))
        player.addPerk(DE)
        perked=True
    elseif(option==COPos&&!player.hasPerk(CO))
        player.addPerk(CO)
        perked=true
    endif
    
    if(perked)
        perkPoints.setValue(-1+perkPoints.getValue())
        perkSound.play(player)
        forcepagereset()
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
    elseif(option==SFPos&&!player.hasPerk(SF))
        player.addPerk(SF)
        perked=true
    elseif(option==CGPos&&!player.hasPerk(CG))
        player.addPerk(CG)
        perked=true
    elseif(option==RDPos&&!player.hasPerk(RD))
        player.addPerk(RD)
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
            SetSliderDialogRange(0.1, 10.0)
            SetSliderDialogInterval(0.1)
    elseif (option==dMinPos)
        SetSliderDialogStartValue(dMin)
            SetSliderDialogDefaultValue(250.0)
            SetSliderDialogRange(10.0, 10000.0)
            SetSliderDialogInterval(10.0)
    elseif (option==sMinPos)
        SetSliderDialogStartValue(sMin)
            SetSliderDialogDefaultValue(5.0)
            SetSliderDialogRange(1.0, 100)
            SetSliderDialogInterval(1.0)
    elseif (option==NPCbonusPos)
        SetSliderDialogStartValue(NPCbonus)
            SetSliderDialogDefaultValue(1.0)
            SetSliderDialogRange(0.1, 10)
            SetSliderDialogInterval(0.1)
    elseif (option==weightPos)
        SetSliderDialogStartValue(weight)
            SetSliderDialogDefaultValue(2.0)
            SetSliderDialogRange(0.0, 100)
            SetSliderDialogInterval(1.0)
        elseif (option==bellyscaleminpos)
            SetSliderDialogStartValue(bellyscaleint)
            SetSliderDialogDefaultValue(1)
            SetSliderDialogRange(0.0, 10)
            SetSliderDialogInterval(0.1)
        elseif (option==damagemodPos)
            SetSliderDialogStartValue(damagemodf)
        SetSliderDialogDefaultValue(1.0)
        SetSliderDialogRange(0.1, 20)
        SetSliderDialogInterval(0.1)
        
            
      endif
endEvent

event OnOptionSliderAccept(int option, float value)
    if(option==dTimePos)
        dTimeGlobal.setValue(value)
        dTime=dTimeGlobal.getValue()
        setSliderOptionValue(option, dTime, "{1}x")
    elseif(option==dMinPos)
        dMinGlobal.setValue(value)
        dMin=dMinGlobal.getValueInt()
        setSliderOptionValue(option, dMin, "{0} seconds")
    elseif(option==sMinPos)
        sMinGlobal.setValue(value)
        sMin=sMinGlobal.getValueInt()
        setSliderOptionValue(option, sMin, "{0} percent")
     elseif(option==bellyscaleminpos)
        _bellyscale.setValue(value)
        bellyscaleint=_bellyscale.getValue()
        setSliderOptionValue(option, bellyscaleint, "{1}x")
    elseif(option==NPCbonusPos)
        NPCbonusGlobal.setValue(value)
        NPCbonus=NPCbonusGlobal.getValue()
        setSliderOptionValue(option, NPCbonus, "{1}x")
    elseif(option==weightPos)
        weightGlobal.setValue(value)
        weight=weightGlobal.getValueInt()
        setSliderOptionValue(option, weight, "{0} percent")
    elseif(option==damagemodPos)
        damagemod.setValue(value)
        damagemodf=damagemod.getValue()
        setSliderOptionValue(option, damagemodf, "{1}x")
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
    elseif(option==damagemodPos)
        damagemod.setValue(1)
        damagemodf=damagemod.getValue()
        setSliderOptionValue(option,damagemodf, "{1}x")
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
    elseif(option==damagemodPos)
        SetInfoText("The stomach acid damage is multiplied by this value.")
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
    elseif(option==CGpos)
        SetInfoText("You Constrict prey while swallowing them, preventing any retaliation(Minimum skill 90)")
    elseif(option==RDpos)
        SetInfoText("Your stomach binds the bones of digested prey, raising the dead(Minimum skill 90)")
    elseif(option==SFpos)
        SetInfoText("Trap the souls of digested prey in your stomach (Minimum skill 100)")
    endif
elseif(thePage==4)
    if(option==SD1Pos)
        SetInfoText("Struggling Damage improves by 20%")
    elseif(option==SD2Pos)
        SetInfoText("Struggling Damage improves by 40% (Minimum skill 20)")
    elseif(option==SD3Pos)
        SetInfoText("Struggling Damage improves by 60% (Minimum skill 40)")
    elseif(option==SD4Pos)
        SetInfoText("Struggling Damage improves by 80% (Minimum skill 60)")
    elseif(option==Sd5Pos)
        SetInfoText("Struggling Damage is doubled (Minimum skill 80)")
        
    elseif(option==R1Pos)
        SetInfoText("Acid Resistance improves by 10%")
    elseif(option==R2Pos)
        SetInfoText("Acid Resistance improves by 20% (Minimum skill 20)")
    elseif(option==R3Pos)
        SetInfoText("Acid Resistance improves by 30% (Minimum skill 40)")
    elseif(option==R4Pos)
        SetInfoText("Acid Resistance improves by 40% (Minimum skill 60)")
    elseif(option==R5Pos)
        SetInfoText("Acid Resistance improves by 50% (Minimum skill 80)")
        
    elseif(option==S1Pos)
        SetInfoText("Swallow Resistance improves by 10%")
    elseif(option==S2Pos)
        SetInfoText("Swallow Resistance improves by 20% (Minimum skill 20)")
    elseif(option==S3Pos)
        SetInfoText("Swallow Resistance improves by 30% (Minimum skill 40)")
    elseif(option==S4Pos)
        SetInfoText("Swallow Resistance improves by 40% (Minimum skill 60)")
    elseif(option==S5Pos)
        SetInfoText("Swallow Resistance improves by 50% (Minimum skill 80)")
        
    elseif(option==PGPos)
        SetInfoText("Deal Massive Damage to pred when escaping (Minimum skill 50)")
    elseif(option==DEPos)
        SetInfoText("Recover Health While in friendly Stomachs(Minimum skill 25)")
    elseif(option==CEPos)
        SetInfoText("Being in a friendly stomach adds the well rested effect(Minimum skill 25)")
    endif
    
elseif(thePage==5)
if(option==playercentricpos)
   SetInfoText("The player needs to be involved in every swallow attempt either as prey or predator")
elseif(option==unwillingaudiopos)
   SetInfoText("When humanoid prey is swallowed unwilling struggling audio is played")
elseif(option==ScatMoanspos)
   SetInfoText("Humanoids will make gender specific sounds during scat")
elseif(option==Morphonlypos)
   SetInfoText("Humanoids will always try to use morphs instead of the normal belly. Regardless if the morphvore keyword is present or not")
elseif(option==strippos)
   SetInfoText("The player is stripped of gear when swallowed")
elseif(option==noescapepos)
   SetInfoText("Swallowed prey cannot escape their predators stomach unless the struggle mechanic is used")
endif
endif
endEvent
GlobalVariable Property version  Auto  

GlobalVariable Property NewPlayerGlobal  Auto  