#SingleInstance force
#Persistent
RMBTimerGoing = 0
RTimerGoing = 0
ShiftTimerGoing = 0
RCoolDown := -1
ShiftCoolDown := -1
RMBCoolDown := -1
Hero = "Unassigned"

^0::
;battle.net password
FileRead, BNetPass, BNetPassword.config
Send %BNetPass%
Return

^9::
;battle.net alt password
FileRead, BNetPass, BNetPasswordAlt.config
Send %BNetPass%
Return

^G::
Hero := "Genji"
SoundPlay, %A_WorkingDir%\Audio\Genji.wav
ShiftCoolDown := 8250
RCoolDown := 9750
RMBCoolDown := -1
Return

^M::
Hero := "McCree"
SoundPlay, %A_WorkingDir%\Audio\McCree.wav
ShiftCoolDown := 8250
RCoolDown := 10250
RMBCoolDown := -1
Return

^P::
Hero := "Pharah"
SoundPlay, %A_WorkingDir%\Audio\Pharah.wav
ShiftCoolDown := 10000
RCoolDown := 12000
RMBCoolDown := -1
Return

^R::
Hero := "Reaper"
SoundPlay, %A_WorkingDir%\Audio\Reaper.wav
;This needs to be updated so that it only triggers if the teleport is confirmed, and only after selecting confirm
ShiftCoolDown := 12000
RCoolDown := 13000
RMBCoolDown := -1
Return

^S::
Hero := "Soldier"
SoundPlay, %A_WorkingDir%\Audio\Soldier.wav
ShiftCoolDown := -1
RCoolDown := 20000
RMBCoolDown := 8000
Return

^!S::
Hero := "Sombra"
SoundPlay, %A_WorkingDir%\Audio\Sombra.wav
ShiftCoolDown := 12000
RCoolDown := 7000
RMBCoolDown := 13000
Return

^T::
Hero := "Tracer"
SoundPlay, %A_WorkingDir%\Audio\Tracer.wav
;These are tricky for tracer, she can get up to 3 warps
ShiftCoolDown = 3000
RCoolDown := 13250
RMBCoolDown = 3000
Return

;Bastion is not applicable as it does not have any cooldowns

^H::
Hero := "Hanzo"
SoundPlay, %A_WorkingDir%\Audio\Hanzo.wav
;Hanzo is also tricky, since you have to wait for him to fire the arrow before the timer starts
ShiftCoolDown = 20000
RCoolDown := 10000
Return
RMBCoolDown = 3000

^J::
Hero := "Junkrat"
SoundPlay, %A_WorkingDir%\Audio\Junkrat.wav
ShiftCoolDown := 8000
RCoolDown := 13000
RMBCoolDown := -1
Return

^!M::
Hero := "Mei"
SoundPlay, %A_WorkingDir%\Audio\Mei.wav
ShiftCoolDown := 16000
RCoolDown := 10500
RMBCoolDown := -1
Return

;I have no idea how Torbjorn's armor works, I never play him.

^W::
Hero := "Widowmaker"
SoundPlay, %A_WorkingDir%\Audio\Widowmaker.wav
;Grappling hook must hit in order to actually count. There's no way for me to detect that.
ShiftCoolDown := 13000
RCoolDown := 16000
RMBCoolDown := -1
Return

^D::
Hero := "D.Va"
SoundPlay, %A_WorkingDir%\Audio\D.Va.wav
ShiftCoolDown := 7000
RCoolDown := -1
RMBCoolDown := -1
Return

^!R::
Hero := "Reinhardt"
SoundPlay, %A_WorkingDir%\Audio\Reinhardt.wav
RCoolDown := 6500
;Also tricky. The duration of the charge is impossible to predict
ShiftCoolDown := 11000
RMBCoolDown := -1
Return

^!+R::
Hero := "Roadhog"
SoundPlay, %A_WorkingDir%\Audio\Roadhog.wav
;This one's a little tricky as well. The duration of the chain depends on the distance of the target and whether it hits or not.
ShiftCoolDown := 7500
RCoolDown := 9500
RMBCoolDown := -1
Return

^!W::
Hero := "Winston"
SoundPlay, %A_WorkingDir%\Audio\Winston.wav
ShiftCoolDown := 6000
RCoolDown := 19000
RMBCoolDown := -1
Return

^Z::
Hero := "Zarya"
SoundPlay, %A_WorkingDir%\Audio\Zarya.wav
ShiftCoolDown := 12000
RCoolDown := 10000
RMBCoolDown := -1
Return

^A::
Hero := "Ana"
SoundPlay, %A_WorkingDir%\Audio\Ana.wav
ShiftCoolDown := 12500
RCoolDown := 10500
RMBCoolDown := -1
Return

^L::
Hero := "Lucio"
SoundPlay, %A_WorkingDir%\Audio\Lucio.wav
ShiftCoolDown := -1
RCoolDown := 15000
RMBCoolDown := 4000
Return

^!+M::
Hero := "Mercy"
SoundPlay, %A_WorkingDir%\Audio\Mercy.wav
ShiftCoolDown := 2000
RCoolDown := -1
RMBCoolDown := -1
Return

;TODO: Symmetra
;Symmetra is tricky due to the cooldown for placing turrets constantly charging

;Zenyatta does not have cooldowns

#0::
Hero = "Unassigned"
SoundPlay, %A_WorkingDir%\Audio\Unassigned.wav
RCoolDown := -1
ShiftCoolDown := -1
RMBCoolDown := -1
Return





;Shift::
XButton1::
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
