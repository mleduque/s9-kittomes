// Kit Tomes for Baldur's Gate
//Dialogue: Durin the fighter expert
//Author : Smeagolheart

BEGIN ~S9DURIN~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY ~Hey you <RACE>, care to help a couple of fighting men in need of assistance?~
	IF ~~ THEN REPLY ~What happened?~ GOTO 1
	IF ~~ THEN REPLY ~No, not right now.~ GOTO s91_4
END

IF ~~ THEN BEGIN 1
SAY ~It happened like this. Me and me adventurin' companion, Zankas, heard tell of a magical treasure hoard over along the coast that is ripe for the taking.  So we went over there.  Unfortunately, it was guarded by fierce blue skinned creatures.~
	IF ~~ THEN EXTERN  ~S9ZANKAS~ 1
END

IF ~~ THEN BEGIN 2
SAY ~The blasted Sirens started shooting at me with their twice blasted bows.  I charged at them with me axe raised- but then everything went blank.  I... lost control of meself.  The last thing I remember is how lovely those blue skinned women looked.~
	IF ~~ THEN EXTERN  ~S9ZANKAS~ 2
END

IF ~~ THEN BEGIN 3
SAY ~While under the Siren's foul spell, I attacked my friend Zankas and inflicted a couple of serious wounds on him.  He did eventually get me away from those evil temptresses though, saving me life.~
= ~Anyway, after I regained control over me mind, I was back here in Beregost. ~
	++ ~So what do you want me to do?~ + s91_7
	++ ~I don't think I can help you...~ + s91_4
END

IF ~~ THEN BEGIN s91_3
SAY ~I can offer ye gold and teach ye how to be an expert in a few different areas of fighting.  Does berskerin', battling wizards or learning the skills of a kensai pique yer intererst?~
	++ ~I'd like to learn how to go berserk in battle.~ + s91_5
	++ ~I'd really like to slay wizards, I hate those guys.~ + s91_5
	++ ~I'd like to master my weapon and become a kensai.~ + s91_5
	++ ~I'll help, but I'm not interested in learning new fighting skills.~ + s91_8
	++ ~No, I won't help you.~ + s91_4
END

IF ~~ THEN BEGIN s91_4
SAY ~Blast!  Ok well, it's yer choice, if you change your mind I'll be here.~
	IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
END

IF ~~ THEN BEGIN s91_5
SAY ~Great!  Then I can teach ye a thing or two, if ye help us out.  Will ye help?~
	++ ~I will help you.~ + s91_8
	++ ~I won't help you...~ + s91_4
END

IF ~~ THEN BEGIN s91_7
SAY ~Because I kept slashing at him, Zankas knocked away me prized axe, which happened to be precious to me.  It has been in me family for generations and has been known to split a skull or two and it has great sentimental value.  If ye can get back me axe, I'd be grateful.  We dare not attempt going back there and facing those Sirens again after what happened.~
	++ ~I will help you.~ + s91_8
	++ ~What's in it for me?~ + s91_3
	++ ~I won't help you...~ + s91_4
END

IF ~~ THEN BEGIN s91_8
SAY ~Return with me family axe and I will reward ye.  No doubt one of them foul creatures is using it to shave her back or clip the nails of her crooked smelly claws.  Bah, I don't want to think about me axe being used for that, it's too upsetting.  Just get it back as ye please.~
	IF ~~ THEN DO ~SetGlobal("S9FQCheck","GLOBAL",1)~
	UNSOLVED_JOURNAL %Return Durin's Family Axe.

	I have agreed to retrieve Durin's Family axe from an area along the coast near a shipwreck where he lost it while battling Sirens.  It will surely be a dangerous undertaking.%  EXIT
END

IF ~Global("S9FQCheck","GLOBAL",1)~ THEN BEGIN returneth
SAY ~So ye've come back.  Did ye find me axe?~
	IF ~PartyHasItem("S9DAXE01")~ THEN REPLY ~Yes, I have it here.~ GOTO s91_11
	IF ~~ THEN REPLY ~No, I don't have it yet.~ GOTO s91_9
	IF ~~ THEN REPLY ~What did you want me to do again?~ GOTO s91_10
END

IF ~~ THEN BEGIN s91_9
SAY ~Blast!  Well, come see me when ye do have it.~
	IF ~~ EXIT
END

IF ~~ THEN BEGIN s91_10
SAY ~Go retrieve me family  axe from nearabouts the shipwreck along the coast.~
	IF ~~ EXIT
END

IF ~~ THEN BEGIN s91_11
SAY ~Wonderful, ye did it!~
	 IF ~~ THEN DO ~
	 	GiveGoldForce(100)
		AddexperienceParty(600) 
		TakePartyItem("S9DAXE01")
		DestroyItem("S9DAXE01")
		EraseJournalEntry(%Return Durin's Family Axe.

	I have agreed to retrieve Durin's Family axe from an area along the coast near a shipwreck where he lost it while battling Sirens.  It will surely be a dangerous undertaking.%)~
		SOLVED_JOURNAL ~Return Durin's Family Axe. <DAYANDMONTH>

	I have returned Durin's Family axe, he was very pleased.  All is well that ends well.~ + 20
END
	  
IF ~~ THEN BEGIN 20
SAY ~So what kind of reward would ye be interested in?  We can offer ye your choice among a set of magic tomes that are invaluable instruction manuals to those who fight.~
	IF ~~ THEN REPLY ~Book of the Barbarian.~ DO ~
	GiveItemCreate("s9tome31",Player1,1,1,1)~ GOTO 25
		IF ~~ THEN REPLY ~Book of the Berserker.~ DO ~
	GiveItemCreate("s9tome01",Player1,1,1,1)~ GOTO 25
		IF ~~ THEN REPLY ~Book of the Wizard Slayer.~ DO ~
	GiveItemCreate("s9tome02",Player1,1,1,1)~ GOTO 25
	IF ~~ THEN REPLY ~Book of the Kensai.~ DO ~
	GiveItemCreate("S9tome03",Player1,1,1,1)~ GOTO 25	
	IF ~~ THEN REPLY  ~We aren't interested in your books.~ GOTO 25
END

IF ~~ THEN BEGIN 25
SAY ~Thank ye for helping an old dwarf out.  By the by, the merchant who sold us them tomes, Panver the Loremaster, is in the Elfsong Tavern in Baldur's Gate.  Bye and thanks to ye again.  Come Zankas lets go, we can rest easy tonight.  Tomorrow will be a better day!~
	 IF ~~ THEN DO ~
		ActionOverride("S9ZANKAS",EscapeAreaDestroy(90))
		EscapeAreaDestroy(90) 
	  ~ EXIT
END