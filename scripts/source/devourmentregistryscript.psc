Scriptname DevourmentRegistryScript extends Quest Conditional

Activator Property VomitActivator Auto

ActorBase Property Skeleton Auto

Actor Property VomitedPrey Auto

Armor Property FullnessDead Auto
Armor Property FullnessFPrey Auto
Armor Property FullnessMPrey Auto
Armor Property FullnessNonlethal Auto

Container Property Poop Auto

Explosion Property BoneExplosion Auto

Faction Property PlayerFaction Auto
Faction Property Follower Auto

FormList Property FullnessTypes Auto

GlobalVariable Property DTime Auto
GlobalVariable Property KillEssential Auto
GlobalVariable Property EatAltmer Auto
GlobalVariable Property EatArgonian Auto
GlobalVariable Property EatBosmer Auto
GlobalVariable Property EatBreton Auto
GlobalVariable Property EatDunmer Auto
GlobalVariable Property EatImperial Auto
GlobalVariable Property EatKhajiit Auto
GlobalVariable Property EatNord Auto
GlobalVariable Property EatOrsimer Auto
GlobalVariable Property EatRedguard Auto
GlobalVariable Property NewPlayerGlobal Auto
GlobalVariable Property PerkPoints Auto
GlobalVariable Property PrevPerkPoints Auto
GlobalVariable Property ScatGlobal Auto
GlobalVariable Property SkillGain Auto
GlobalVariable Property VictimsToPerk Auto
GlobalVariable Property WeightGlobal Auto
GlobalVariable Property TimeScale Auto
GlobalVariable Property DeadDigestionTime Auto
GlobalVariable Property ReadyToVomit Auto

Keyword Property Summoned Auto
Keyword Property Surrender Auto
Keyword Property NPC Auto

Message Property BonesMessage Auto
Message Property PerkMessage Auto
Message Property PlayerDigestMessage Auto
Message Property PoopMessage Auto
Message Property VSkillLevelUp Auto
Message Property UnclogMessage Auto
Message Property PukeMessage Auto

MiscObject Property Ipecac Auto

MusicType Property DeathMusic Auto

ObjectReference Property HerStomach Auto

Perk Property Acid30 Auto
Perk Property Acid60 Auto
Perk Property Acid90 Auto
Perk Property ConsumeEssence Auto
Perk Property IronStomach25 Auto
Perk Property IronStomach50 Auto
Perk Property IronStomach75 Auto
Perk Property Nourish Auto
Perk Property NourishMagic Auto
Perk Property SoulFood Auto

DevourmentNameScript Property NameQuest Auto

Race Property Alt Auto
Race Property AltV Auto
Race Property Arg Auto
Race Property ArgV Auto
Race Property Bos Auto
Race Property BosV Auto
Race Property Bre Auto
Race Property BreV Auto
Race Property Dun Auto
Race Property DunV Auto
Race Property Imp Auto
Race Property ImpV Auto
Race Property Kha Auto
Race Property KhaV Auto
Race Property Nor Auto
Race Property NorV Auto
Race Property Ors Auto
Race Property OrsV Auto
Race Property Red Auto
Race Property RedV Auto

ReferenceAlias Property DialogPreyAlias Auto
ReferenceAlias Property DialogPredAlias Auto

Shout Property VomitMeShout Auto

SoulGem Property Soul Auto

Sound Property BoneSound Auto
Sound Property BurpSound Auto
Sound Property ScatSound Auto
Sound Property StomachSound Auto
Sound Property VSkillLevelSound Auto
Sound Property VomitSound Auto

Spell Property NotThere Auto
Spell Property Alt1 Auto
Spell Property Alt2 Auto
Spell Property Alt4 Auto
Spell Property Alt8 Auto
Spell Property Alt16 Auto
Spell Property AltPower Auto
Spell Property Arg1 Auto
Spell Property Arg2 Auto
Spell Property Arg4 Auto
Spell Property Arg8 Auto
Spell Property Arg16 Auto
Spell Property ArgPower Auto
Spell Property Bos1 Auto
Spell Property Bos2 Auto
Spell Property Bos4 Auto
Spell Property Bos8 Auto
Spell Property Bos16 Auto
Spell Property BosPower Auto
Spell Property Bre1 Auto
Spell Property Bre2 Auto
Spell Property Bre4 Auto
Spell Property Bre8 Auto
Spell Property Bre16 Auto
Spell Property BrePower Auto
Spell Property Dun1 Auto
Spell Property Dun2 Auto
Spell Property Dun4 Auto
Spell Property Dun8 Auto
Spell Property Dun16 Auto
Spell Property DunPower Auto
Spell Property Imp1 Auto
Spell Property Imp2 Auto
Spell Property Imp4 Auto
Spell Property Imp8 Auto
Spell Property Imp16 Auto
Spell Property ImpPower Auto
Spell Property Kha1 Auto
Spell Property Kha2 Auto
Spell Property Kha4 Auto
Spell Property Kha8 Auto
Spell Property Kha16 Auto
Spell Property KhaPower Auto
Spell Property Nor1 Auto
Spell Property Nor2 Auto
Spell Property Nor4 Auto
Spell Property Nor8 Auto
Spell Property Nor16 Auto
Spell Property NorPower Auto
Spell Property Ors1 Auto
Spell Property Ors2 Auto
Spell Property Ors4 Auto
Spell Property Ors8 Auto
Spell Property Ors16 Auto
Spell Property OrsPower Auto
Spell Property Red1 Auto
Spell Property Red2 Auto
Spell Property Red4 Auto
Spell Property Red8 Auto
Spell Property Red16 Auto
Spell Property RedPower Auto
Spell Property SameRace32 Auto
Spell Property DigestionVisualSpellToo Auto
Spell Property StayAtPredLocation Auto
Spell Property ScalingCancelSpell Auto
Spell Property VomitSpell Auto
Spell Property VomitSpellDead Auto
Spell Property VomitSpellScent Auto
Spell Property DummySpell Auto

Spell Property ScriptedSwallow Auto
Spell Property ScriptedEndo Auto

Topic Property Scream Auto

WordOfPower Property VomitWord Auto

; ----PUBLIC API FUNCTIONS BELOW THIS POINT----

; Note on flags: Positive numbers indicate lethal vore, negative mean nonlethal. Currently only oral vore (1 and -1) are implemented.

Function RegisterEventHandler(DevourmentEventHandler yourMod) ; You MUST register your handler before it can receive events. For best results, do this in your script's OnInit block after a ten-second wait
EndFunction

Bool Function IsHandlerRegistered(DevourmentEventHandler yourMod) ; Returns true if a handler is registered successfully
	return false
EndFunction

Function ForceSwallow(Actor pred, Actor prey, int flags) ; Forces an actor to swallow another IF they are both valid types. 
EndFunction

Function ForceEscape(Actor prey, bool oralEscape) ; Allows the prey to escape immediately. The boolean parameter does nothing... yet.
EndFunction

Function ForceRegurgitate(Actor pred, bool oralEscape) ; See above, except this causes all prey eaten by the specified predator to escape.
EndFunction

Bool Function ForceDialog(Actor pred, Actor prey) ; Forces dialog IF the Actors are valid (ie, pred has eaten prey)
	return false
EndFunction

Function AccelerateDigestion(Actor pred, int ticks) ; Simulate a certain number of ticks (tenths of a second) for all prey eaten by the specified Actor
EndFunction

Int Function getNumEaten(Actor pred, int flags) ; Returns the number of Actors eaten by the specified Actor. The int parameter does nothing at the moment.
	return 0
EndFunction

Actor Function whoAte(Actor prey) ; Returns the Actor who ate the specified Actor, or None if they weren't eaten
	return None
EndFunction

Actor[] Function whoSheAte(Actor pred, int flags) ; Returns an array of all Actors eaten by the specified Actor
	return None
EndFunction

Bool Function hasLivePrey(Actor pred) ; Returns true if the Actor has eaten anyone and not digested them yet
	return false
EndFunction

Actor[] Function getPredArray() ; Returns the master registry of predators. This is *NOT* thread-safe. Use ForceSwallow, ForceEscape, etc. to add or remove.
	return None
EndFunction

Actor[] Function getPreyArray() ; See above.
	return None
EndFunction

int[] Function getTypeFlagArray() ; See above.
	return None
EndFunction

float[] Function getDigestionTimeArray() ; See above.
	return None
EndFunction

Actor[] Function getDeadPredArray() ; See above.
	return None
EndFunction

Actor[] Function getDeadPreyArray() ; See above.
	return None
EndFunction

Function disableEscape(Actor prey) ; Prevents the specified prey from escaping until they are digested or forced out by a spell or script command
EndFunction

float Function getDeadDigestionCompletion(Actor prey) ; Returns a value from 0-1 representing how close the specified dead Actor is to being completely digested
	return 0
EndFunction

int Function getDeadDigestionTicks(Actor prey) ; Returns the number of ticks for which the specified dead Actor will be digested
	return 0
EndFunction

Function setDeadDigestionTicks(Actor pred, int ticks) ; Forces all dead prey currently being digested by the specified Actor to be digested for the given number of ticks rather than their current value.
EndFunction

Function addPredatorRace(Race predRace, Idle swallowAnim, Armor belly) ; Adds the given race as a possible predator as long as it is not of ActorTypeNPC. It will use the specified Idle when swallowing and will equip the specified Armor as its "belly."
EndFunction

bool Function isModPredatorRace(Race predRace) ; Checks if the given race has been registered as a possible predator
	return false
EndFunction

Idle Function getModPredatorIdle(Race predRace) ; Returns the Idle registered for the given predator race
	return None
EndFunction

Armor Function getModPredatorBelly(Race predRace) ; Returns the Armor registered for the given predator race's belly
	return None
EndFunction

bool Function switchLethal(Actor prey) ; Switches the given Actor from lethal to nonlethal digestion, or vice-versa. Returns true if successful.
	return false
EndFunction

bool Function sendDialogEvent(float customID) ; Sends a dialog event with the specified ID. This will be caught by all registered DevourmentEventHandlers. Choosing non-integer values for your event IDs is best, since it minimizes possible overlap with other mods. 
	return false
EndFunction