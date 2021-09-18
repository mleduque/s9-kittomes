// Kit Tomes for Baldur's Gate
//Dialogue: Oti
//Author : Smeagolheart

BEGIN ~S9OTI~

IF ~~ THEN BEGIN 0 // from:
  SAY ~I'm Lord Oti the Glansman, Lord of Castle Halwater. This is Marthana Shipsail, the most beautiful bard to have ever graced the Sword Coast, and my appointed agent.  She will fill you in on the details of what needs to be done.~
  IF ~~ THEN EXTERN ~S9MARTHA~ 1
END

IF ~~ THEN BEGIN 1 // from:
  SAY ~It's true!  The heel has the town convinced I'm the one who has done something wrong!  He has stolen the deed and my inheritance!~
  IF ~~ THEN EXTERN ~S9MARTHA~ 5
END

IF WEIGHT #2
~True()
~ THEN BEGIN 18
  SAY ~Speak to Marthana, she is my representative.~
  IF ~~ THEN EXIT
END

IF WEIGHT #1 ~Dead("S9MARTHA")~ THEN BEGIN 28 // from:
  SAY ~Now that Marthana is dead, I can't wait here for more knives in the dark.  Goodbye.~
  IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END

IF ~~ THEN BEGIN 8 // from:
  SAY ~You will be handsomely rewarded once you retrieve the deed, 4500 gold should be a reasonable fee for a simple job such as this.  Additionally, I offer you a magic trinket from a selection of items that were found among my mother's things.~
	IF ~~ THEN REPLY ~We will retrieve the document and return it to you.~ EXTERN ~S9MARTHA~ 7
	IF ~~ THEN REPLY ~We won't do this.~ EXTERN ~S9MARTHA~ 4
END