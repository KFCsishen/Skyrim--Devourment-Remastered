Scriptname DiminuationScript extends ActiveMagicEffect  

Event OnEffectStar Actor akTarget, Actor akCaster)
	akTarget.setScale(akTarget.getScale()*0.75)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.setScale(akTarget.getScale()/0.75)
EndEvent