;/ Decompiled by Champollion V1.0.1
Source   : aaaVomitScript.psc
Modified : 2014-11-12 02:39:26
Compiled : 2014-11-12 02:39:28
User     : Kent
Computer : KENT-PC
/;
scriptName aaaVomitScript extends ObjectReference

;-- Properties --------------------------------------
container property VomitPile auto
spell property DontSwallowMe auto
Bool property Scent = false auto
globalvariable property PreyHP auto
globalvariable property Shititems auto
explosion property theExplosion auto
idle property ResetIdle auto
spell property ScentSpell auto
devourmentregistryscript property manager auto
spell property NotThere auto
globalvariable property pukeEnable auto
effectshader property NoPlayerShader auto
Bool property digested auto
spell property PlayerIsPreySpell auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnInit()

    actor victim = manager.getVomitPrey()
    manager.unregisterVomit()
    if !digested
        victim.moveTo(self as ObjectReference, 0.000000, 0.000000, 0.000000, true)
        victim.setPosition(self.GetPositionX(), self.getPositionY(), self.getPositionZ() + 42 as Float)
        victim.setScale(1 as Float)
        victim.removeSpell(NotThere)
        victim.setAlpha(100 as Float, false)
        victim.setGhost(false)
        if victim != game.GetPlayer()
            victim.enable(0 as Bool)
            victim.stopCombat()
        else
            victim.setPlayerControls(true)
            victim.enableAI(true)
            game.setCameraTarget(victim)
            game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
            DontSwallowMe.Cast(game.GetPlayer() as ObjectReference, game.GetPlayer() as ObjectReference)
        endIf
        victim.playIdle(ResetIdle)
        ObjectReference boom = self.placeAtMe(theExplosion as form, 1, false, false)
        if Scent
            ScentSpell.Cast(victim as ObjectReference, none)
        endIf
    else
        ObjectReference thePile = self.placeAtMe(VomitPile as form, 1, false, false)
        if(shititems.getvalue() == 1)
        thePile.placeatme(victim.getwornform(0x00000001))
        thePile.placeatme(victim.getwornform(0x00000004))
        thePile.placeatme(victim.getwornform(0x00000008))
        thePile.placeatme(victim.getwornform(0x00000010))
        thePile.placeatme(victim.getwornform(0x00000080))
        thePile.placeatme(victim.getwornform(0x00000200))             
        victim.removeitem(victim.getwornform(0x00000001))
        victim.removeitem(victim.getwornform(0x00000004))
        victim.removeitem(victim.getwornform(0x00000008))
        victim.removeitem(victim.getwornform(0x00000010))
        victim.removeitem(victim.getwornform(0x00000080))
        victim.removeitem(victim.getwornform(0x00000200))
        endif
        thePile.setAngle(0 as Float, 0 as Float, 0 as Float)
        victim.removeAllItems(thePile, false, true)
    endIf
    self.disable(false)
    self.delete()
endFunction

; Skipped compiler generated GotoState
