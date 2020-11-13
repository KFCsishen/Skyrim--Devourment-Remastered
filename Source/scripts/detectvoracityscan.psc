Scriptname DetectVoracityScan extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
;if(!akTarget.HasMagicEffect(blockEffect))
	; BlockSpell.cast(player)
	Actor player=akTarget
	int numVictims=player.getAV("FavorsPerDayTimer") as Int
	float swallowBonus=15+Player.getAV("Variable05")+Player.getAV("FavorActive")+Player.getLevel()
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
	MainMenu.show(numVictims,swallowBonus,15+Player.getAV("Variable05")+Player.getAV("FavorPointsBonus")+Player.getLevel(),Damage,MaxTime,Player.getAV("FavorsPerDay"))
	Utility.Wait(0.5)
;endif
EndEvent

Perk Property V5 Auto
Perk Property V4 Auto
Perk Property V3 Auto
Perk Property V2 Auto
Perk Property V1 Auto

Perk Property IS3 Auto
Perk Property IS2 Auto
Perk Property IS1 Auto

Perk Property SA3 Auto
Perk Property SA2 Auto
Perk Property SA1 Auto

Message Property MainMenu Auto
SPELL Property BlockSpell  Auto  

MagicEffect Property BlockEffect Auto

DevourmentRegistryScript Property ManagerQuest Auto
Actor Property NotPlayer Auto