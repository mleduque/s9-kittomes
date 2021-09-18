// Kit Tomes for Baldur's Gate
//Dialogue: Zankas
//Author : Smeagolheart

BEGIN ~S9ZANKAS~

IF WEIGHT #2
~True()~ THEN BEGIN 18
SAY ~Hello <RACE>.  Talk to Durin, he speaks for our party.~
 IF ~~ THEN DO ~~ EXIT
END

IF WEIGHT #1 ~Dead("S9DURIN")~ THEN BEGIN 28 
  SAY ~My friend's dead, I'm not sticking around here any longer.~
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 1 // from:
  SAY ~They were Sirens - blood-thirsty creatures that prey upon the living.~
  IF ~~ THEN EXTERN  ~S9DURIN~ 2
END

IF ~~ THEN BEGIN 2 // from:
  SAY ~I went into a rage when I saw my friend fall under the Siren's spell. I grabbed him to drag him away from those evil creatures before they could devour him or gods know what else they would have done.~
  IF ~~ THEN EXTERN  ~S9DURIN~ 3
END