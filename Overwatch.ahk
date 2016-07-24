#SingleInstance force
#Persistent
RMBTimerGoing = 0
RTimerGoing = 0
ShiftTimerGoing = 0
Hero = "Unassigned"


#1::
;battle.net password
SendRaw UpdateScriptWithYourPWIfYouWouldLike
Return

#2::
Hero := "Lucio"
SoundPlay, %A_WorkingDir%\Audio\Lucio.wav
RCoolDown := 15000
ShiftCoolDown := -1
RMBCoolDown := 4000
Return

#3::
Hero := "Tracer"
SoundPlay, %A_WorkingDir%\Audio\Tracer.wav
RCoolDown := 13250
;These are tricky for tracer, she can get up to 3
ShiftCoolDown = 3000
RMBCoolDown = 3000
Return

#4::
Hero := "Roadhog"
SoundPlay, %A_WorkingDir%\Audio\Roadhog.wav
RCoolDown := 9000
;This one's a little tricky as well. The duration of the chain depends on the distance of the target and whether it hits or not.
ShiftCoolDown := 7500
RMBCoolDown := -1
Return

#5::
Hero := "Reinhardt"
SoundPlay, %A_WorkingDir%\Audio\Reinhardt.wav
RCoolDown := 6500
;Also tricky. The duration of the charge is hard to predict
ShiftCoolDown := 11000
RMBCoolDown := -1
Return

#6::
Hero := "Pharah"
SoundPlay, %A_WorkingDir%\Audio\Pharah.wav
RCoolDown := 12000
ShiftCoolDown := 10000
RMBCoolDown := -1
Return

#7::
Hero := "Reaper"
SoundPlay, %A_WorkingDir%\Audio\Reaper.wav
;This needs to be updated so that it only triggers if the teleport is confirmed, and only after selecting confirm
RCoolDown := 13000
ShiftCoolDown := 12000
RMBCoolDown := -1
Return

#8::
Hero := "Junkrat"
SoundPlay, %A_WorkingDir%\Audio\Junkrat.wav
RCoolDown := 13000
ShiftCoolDown := 8000
RMBCoolDown := -1
Return

#9::
Hero := "Soldier"
SoundPlay, %A_WorkingDir%\Audio\Soldier.wav
RCoolDown := 20000
ShiftCoolDown := -1
RMBCoolDown := 8000
Return

#0::
;Goal of this is to retain normal RMB functionality should you choose to go Mercy or want to right-click on a menu item
Hero = "Unassigned"
RCoolDown := -1
ShiftCoolDown := -1
RMBCoolDown := -1
Return

;Shift::
XButton1::
While GetKeyState("XButton1", "P")
{
	Send, {XButton1 Down}
	KeyWait XButton1
}
Send {XButton1 Up}
if (ShiftCoolDown <> -1 and ShiftTimerGoing == 0) { ;then don't do it
	ShiftTimerGoing = 1
	SetTimer, ShiftSound, %ShiftCoolDown%
}
Return

;r::
XButton2::
if (RCoolDown <> -1 and RTimerGoing == 0) {
	RTimerGoing = 1
	SetTimer, RSound, %RCoolDown%
}
Return

;RMB
RButton::
While GetKeyState("RButton", "P")
{
	Send, {RButton Down}
	KeyWait RButton
}
Send {RButton Up}

if (RMBCoolDown <> -1 and RMBTimerGoing == 0) {
	RMBTimerGoing = 1
	SetTimer, RMBSound, %RMBCoolDown%
}
Return


RSound:
SetTimer, RSound, Off
RTimerGoing = 0
SoundPlay, %A_WorkingDir%\Audio\R.wav
Return


ShiftSound:
SetTimer, ShiftSound, Off
ShiftTimerGoing = 0
SoundPlay, %A_WorkingDir%\Audio\Shift.wav
Return

RMBSound:
SetTimer, RMBSound, Off
RMBTimerGoing = 0
SoundPlay, %A_WorkingDir%\Audio\RMB.wav
Return
