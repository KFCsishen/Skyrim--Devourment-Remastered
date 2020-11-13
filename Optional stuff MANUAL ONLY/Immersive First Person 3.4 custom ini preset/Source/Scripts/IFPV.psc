ScriptName IFPV Hidden

;/
Things you can do here:

1. Check which version of IFPV if any is installed.
2. Check if camera is currently overwritten in IFPV.
3. Check if a profile by name is active from configuration.
4. Get current configuration values.
5. Overwrite configuration values (but not values from profiles).
   You should also return value back when you are done!
6. Attach camera on something or someone else while IFPV is active.
   Especially useful if you attach it on an invisible marker or moving
   object to create cinematic shots.
7. Check camera attached target form ID.
8. Enable and listen for papyrus SKSE mod events.

All papyrus actions taken get cleared on save reload! You must do them again every time.

How to do it:

1. Check which version of IFPV if any is installed.
	float version = IFPV.GetVersion()
	if(version <= 0)
		Debug.Notification("IFPV is not installed!")
	else
		Debug.Notification("IFPV version " + version + " is installed.")
	endif

2. Check if camera is currently overwritten in IFPV.
	bool isIfpv = IFPV.IsInIFPV()
	if(isIfpv)
		Debug.Notification("IFPV camera is active and overwrites game camera.")
	else
		Debug.Notification("IFPV camera is not active or does not currently overwrite game camera.")
	endif

3. Check if a profile by name is active from configuration.
	bool isProfileActive = IFPV.IsProfileActive("MyProfile")
	if(isProfileActive)
		Debug.Notification("My profile is active.")
	else
		Debug.Notification("My profile is not active.")
	endif

4. Get current configuration values.
	bool isHeadtrackingFromIfpv = IFPV.GetBoolValue("bHeadtrack")
	if(isHeadtrackingFromIfpv)
		Debug.Notification("IFPV has activated head tracking.")
	else
		Debug.Notification("IFPV has not activated head tracking.")
	endif

5. Overwrite configuration values (but not values from profiles).
   You should also return value back when you are done!
	bool result = IFPV.SetBoolValue("bHeadtrack", true)
	if(result)
		Debug.Notification("Attempted to activate head tracking unless any of user's profiles overwrites.")
		; If it didn't immediately activate it still may activate when user profile overwrite ends.
		; Example scenario:
		; 1. User is currently aiming a bow and their bow aiming profile is overwriting head tracking with false.
		; 2. We set bHeadtrack to true in a script. But it doesn't take affect because the profile is overwriting.
		; 3. User has finished bow aiming and their head tracking overwrite ends.
		; 4. Our head tracking value is now taking affect.

		; Later lets remove our modification:
		result = IFPV.ReturnValue("bHeadtrack")
		if(result)
			Debug.Notification("Removed our head tracking modification.")
		else
			Debug.Notification("Error in my script - Failed to remove modification because the value wasn't found.")
		endif
	else
		Debug.Notification("Error in my script - Failed to set value because the value didn't exist or wasn't a boolean.")
	endif

6. Attach camera on something or someone else while IFPV is active.
   Especially useful if you attach it on an invisible marker or moving
   object to create cinematic shots.
	IFPV.SetIntValue("iObjectRefFormId", 0x1B131) ; attach camera on ulfric
	IFPV.SetStringValue("sCameraNode", "NPC R Finger12 [RF12]") ; but lets attach it on his right index finger instead (XP32 skeleton)
	IFPV.SetFloatValue("fPositionOffsetHorizontal", 0) ; remove any positional offsets
	IFPV.SetFloatValue("fPositionOffsetVertical", 0) ; remove any positional offsets
	IFPV.SetFloatValue("fPositionOffsetDepth", 0) ; remove any positional offsets
	IFPV.SetBoolValue("bActivated", true) ; make sure IFPV is enabled so we can see it

	; Later lets remove these so user can get back to playing.
	IFPV.ReturnValue("iObjectRefFormId")
	...

7. Check camera attached target form ID.
	Int targetId = IFPV.GetCameraTargetFormId()
	if(targetId == 0x14)
		Debug.Notification("Camera is attached to player.")
	else
		Debug.Notification("Camera is attached to something else.")
	endif

8. Enable and listen for papyrus SKSE mod events.
	IFPV.SetBoolValue("bSendModEvents", true)
	RegisterForModEvent("IFPV_EnteringView", "MyEvents")
	RegisterForModEvent("IFPV_EnteringProfile", "MyEvents")
	RegisterForModEvent("IFPV_LeavingView", "MyEvents")
	RegisterForModEvent("IFPV_LeavingProfile", "MyEvents")
	Event MyEvents(String eventName, String strArg, Float numArg, Form sender)
		if(eventName == "IFPV_EnteringView")
			Debug.Notification("IFPV camera overwrite was just activated.")
		elseif(eventName == "IFPV_EnteringProfile")
			Debug.Notification("IFPV profile " + strArg + " was just activated.")
		...
		endif
	EndEvent
/;

; Get current version of SKSE plugin running. This will return 0 if not installed.
Float Function GetVersion() Global Native

; Check if IFPV camera is currently activated and overwrites game's default camera.
Bool Function IsInIFPV() Global Native

; Check if a profile with given name is currently active. It's possible for a profile
; to be active while IFPV is not active.
Bool Function IsProfileActive(String name) Global Native

; Get current value by name. This is the same name as used in configuration files. Error value
; is returned if value was not found, had incorrect value type (not bool) or didn't have any value
; assigned at all. If the value is from game and user does not have any profiles that checks this
; value in a condition then it will always fail.
Bool Function GetBoolValue(String name, Bool error = false) Global Native

; Get current value by name. This is the same name as used in configuration files. Error value
; is returned if value was not found, had incorrect value type (not int) or didn't have any value
; assigned at all. If the value is from game and user does not have any profiles that checks this
; value in a condition then it will always fail.
Int Function GetIntValue(String name, Int error = 0) Global Native

; Get current value by name. This is the same name as used in configuration files. Error value
; is returned if value was not found, had incorrect value type (not float) or didn't have any value
; assigned at all. If the value is from game and user does not have any profiles that checks this
; value in a condition then it will always fail.
Float Function GetFloatValue(String name, Float error = 0.0) Global Native

; Get current value by name. This is the same name as used in configuration files. Error value
; is returned if value was not found, had incorrect value type (not string) or didn't have any value
; assigned at all. If the value is from game and user does not have any profiles that checks this
; value in a condition then it will always fail.
String Function GetStringValue(String name, String error = "") Global Native

; Set current value by name. False is returned if the value was not found or had incorrect type.
; True is returned if value was set, or if value can't be modified at all, or if we set value but
; there was another profile overriding our value. Profile values always overwrite papyrus values and
; papyrus values overwrite default values.
Bool Function SetBoolValue(String name, Bool value) Global Native

; Set current value by name. False is returned if the value was not found or had incorrect type.
; True is returned if value was set, or if value can't be modified at all, or if we set value but
; there was another profile overriding our value. Profile values always overwrite papyrus values and
; papyrus values overwrite default values.
Bool Function SetIntValue(String name, Int value) Global Native

; Set current value by name. False is returned if the value was not found or had incorrect type.
; True is returned if value was set, or if value can't be modified at all, or if we set value but
; there was another profile overriding our value. Profile values always overwrite papyrus values and
; papyrus values overwrite default values.
Bool Function SetFloatValue(String name, Float value) Global Native

; Set current value by name. False is returned if the value was not found or had incorrect type.
; True is returned if value was set, or if value can't be modified at all, or if we set value but
; there was another profile overriding our value. Profile values always overwrite papyrus values and
; papyrus values overwrite default values.
Bool Function SetStringValue(String name, String value) Global Native

; Return (clear) any modifications you have made with papyrus. For example if you set bActivated
; to true but you never remove this then player will not be able to exit IFPV unless another profile
; of theirs overwrites the value to false.
Bool Function ReturnValue(String name) Global Native

; Get the form ID of current camera target. This is almost always 0x14 (player), unless the player
; attaches camera to another object or actor. You can also change this target yourself by setting
; the iObjectRefFormId value. For example SetIntValue("iObjectRefFormId", 0x1B131) will set camera
; on Ulfric, this only works if he is loaded and IFPV is active. This function is basically a copy
; of GetIntValue("iObjectRefFormId", 0x14).
Int Function GetCameraTargetFormId() Global Native
