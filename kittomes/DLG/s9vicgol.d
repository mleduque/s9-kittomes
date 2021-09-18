// Kit Tomes for Baldur's Gate
//Dialogue: Vicgold Otterbight (M human R)
//Author : Smeagolheart

BEGIN ~S9VICGOL~

IF ~~ THEN BEGIN 0
SAY ~I am Vicgold Otterbight.  I am a fierce, bold and decisive Ranger.  Please call me Vic!  Heed what Magstine tells you.  Say, have you seen any ferrets around here?~
	IF ~~ THEN EXTERN ~S9MAGSTI~ 1
END

IF ~~ THEN BEGIN 1 // from:
SAY ~We've discovered a large amount of dangerous creatures.  Beware! You will face great danger throughout Cloakwood forest!~
	IF ~~ THEN EXTERN ~S9MAGSTI~ 5
END

IF ~~ THEN BEGIN 2 // from:
SAY ~I even lost my animal companion, Mr. Jingles, he got bit by a spider and then he ran off as I fought the beast.  For many days and many nights we searched for him but we have not found him.  I still sometimes think about him!~
	IF ~~ THEN EXTERN ~S9MAGSTI~ 6
END

IF ~~ THEN BEGIN 3 // from:
SAY ~Right you are Magstine, we must continue our search!  If you nice people ever find a brown ferret wearing an adorable red jacket with his right ear pierced, let me know eh?  Make sure he answers to "Mr. Jingles" though ok?  Bye now!~
	 IF ~~ THEN DO ~
		ActionOverride("S9MAGSTI",EscapeAreaDestroy(90))
		EscapeAreaDestroy(90) 
	  ~ EXIT
END

IF WEIGHT #2
~True()~ THEN BEGIN 18
SAY ~ Have you seen any ferrets around here?  Unless you have, you should be talking to Magstine.~
	IF ~~ THEN EXIT
END

IF WEIGHT #1 ~Dead("S9MAGSTI")~ THEN BEGIN 28 // from:
SAY ~Now that Magstine is dead, I will go alone and search for Mr. Jingles.  Goodbye.~
	IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END