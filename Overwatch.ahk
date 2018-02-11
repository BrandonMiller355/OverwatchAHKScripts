#SingleInstance force
#Persistent
RMBTimerGoing = 0
RTimerGoing = 0
ShiftTimerGoing = 0
RCoolDown := -1
ShiftCoolDown := -1
RMBCoolDown := -1
Hero := "Unassigned"

^0::
;battle.net password
FileRead, BNetPass, BNetPassword.config
SendRaw %BNetPass%
Return

^9::
;battle.net alt password
FileRead, BNetPass, BNetPasswordAlt.config
SendRaw %BNetPass%
Return

^6::
;battle.net another alt username
FileRead, BNetUsername, BNetUsernameAlt2.config
SendRaw %BNetUsername%
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
RCoolDown := 8750
RMBCoolDown := -1
Return

^!R::
Hero := "Reinhardt"
SoundPlay, %A_WorkingDir%\Audio\Reinhardt.wav
RCoolDown := 6500
;Also tricky. The duration of the charge is impossible to predict
ShiftCoolDown := 12000
RMBCoolDown := -1
Return

^!+R::
Hero := "Roadhog"
SoundPlay, %A_WorkingDir%\Audio\Roadhog.wav
;This one's a little tricky as well. The duration of the chain depends on the distance of the target and whether it hits or not.
ShiftCoolDown := 9000
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
RCoolDown := 31000
RMBCoolDown := -1
Return

;TODO: Come up with a better letter or something
^!+N::
Hero := "Moira"
SoundPlay, %A_WorkingDir%\Audio\Mercy.wav
ShiftCoolDown := 6750
RCoolDown := 10000
RMBCoolDown := -1
Return

;TODO: Symmetra
;Symmetra is tricky due to the cooldown for placing turrets constantly charging

;Zenyatta does not have cooldowns

#0::
Hero := "Unassigned"
SoundPlay, %A_WorkingDir%\Audio\Unassigned.wav
RCoolDown := -1
ShiftCoolDown := -1
RMBCoolDown := -1
Return

#RButton::
Hero := "AllowRightClick"
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
if (Hero == "AllowRightClick") {
	Send, {RButton}
}

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


#-::
SendRaw What the fuck did you just fucking say about me, you little bitch?
Send {Enter}
Sleep, 1000
SendRaw I`'ll have you know I graduated top of my class in the Navy Seals, and I`'ve been involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills.
Send {Enter}
Sleep, 1000
SendRaw I am trained in gorilla warfare and I`'m the top sniper in the entire US armed forces.
Send {Enter}
Sleep, 1000
SendRaw You are nothing to me but just another target.
Send {Enter}
Sleep, 1000
SendRaw I will wipe you the fuck out with precision the likes of which has never been seen before on this Earth, mark my fucking words.
Send {Enter}
Sleep, 1000
SendRaw You think you can get away with saying that shit to me over the Internet?
Send {Enter}
Sleep, 1000
SendRaw Think again, fucker.
Send {Enter}
Sleep, 1000
SendRaw As we speak I am contacting my secret network of spies across the USA and your IP is being traced right now so you better prepare for the storm, maggot.
Send {Enter}
Sleep, 1000
SendRaw The storm that wipes out the pathetic little thing you call your life.
Send {Enter}
Sleep, 1000
SendRaw You`'re fucking dead, kid.
Send {Enter}
Sleep, 1000
SendRaw I can be anywhere, anytime, and I can kill you in over seven hundred ways, and that`'s just with my bare hands.
Send {Enter}
Sleep, 1000
SendRaw Not only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United States Marine Corps and I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit.
Send {Enter}
Sleep, 1000
SendRaw If only you could have known what unholy retribution your little `"clever`" comment was about to bring down upon you, maybe you would have held your fucking tongue.
Send {Enter}
Sleep, 1000
SendRaw But you couldn`'t, you didn`'t, and now you`'re paying the price, you goddamn idiot.
Send {Enter}
Sleep, 1000
SendRaw I will shit fury all over you and you will drown in it.
Send {Enter}
Sleep, 1000
SendRaw You`'re fucking dead, kiddo.
Send {Enter}
Return