// Kit Tomes for Baldur's Gate
//Dialogue: kevian the cleric
//Author : Smeagolheart

BEGIN ~S9KEVIAN~

IF ~~ THEN BEGIN 0 // from:
  SAY ~I am Lord Kevian Chandler, Priest of Lathander.  Pleased to meet you, traveller.~
  IF ~~ THEN EXTERN ~S9WALORI~ 1
END

IF ~~ THEN BEGIN 1 // from:
  SAY ~It is a somewhat delicate matter.~
  IF ~~ THEN EXTERN ~S9WALORI~ 5
END

IF ~~ THEN BEGIN 2 // from:
  SAY ~We have concerns about this excavation.  Who knows what they will find?  As a Priest of the Morninglord, I am troubled this work has the chance of arousing evil or disturbing the dead.  There are some things that must remain undisturbed.~
  IF ~~ THEN EXTERN ~S9WALORI~ 6
END

IF ~~ THEN BEGIN 3 // from:
  SAY ~Let me see that.  I recognize these markings.  It resembles an aspect of Talos the Storm Lord.  It is truly an artifact of evil.  It must be destroyed.~
  IF ~~ THEN EXTERN ~S9WALORI~ 15
END

IF WEIGHT #2
~True()
~ THEN BEGIN 18
  SAY ~ Speak to Sir Walorin, we have an urgent matter we wish to discuss.~
  IF ~~ THEN EXIT
END

IF WEIGHT #1 ~Dead("S9WALORI")~ THEN BEGIN 28 // from:
  SAY ~Sir Walorin is dead.  I must go and report this crime to the authorities.~
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END