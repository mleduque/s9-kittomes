// Kit Tomes for Baldur's Gate
//Dialogue: Jamdak
//Author : Smeagolheart

BEGIN ~S9JAMDAK~

IF WEIGHT #1 ~NumTimesTalkedTo(0)
Global("S9Meliquest","GLOBAL",0)~ THEN BEGIN 0
SAY ~Hello!  I am Jamdak.  I am a former apprentice to Thalantyr, a powerful mage who lives in the house closeby.  I am searching for adventurers to assist me in a rescue mission.~
	++ ~Tell us what happened.~ + 1
	++ ~How does one become a former apprentice?~ + 3
	++ ~Why should we help you?~ + 9
	++ ~Go away kid, ya bother me~ + 2	
	++ ~I don't have time to talk to you now.~ + 4
END

IF ~~ THEN BEGIN 1
	SAY ~My friend Melicamp, a fellow apprentice to Master Thalantyr, accidentally turned himself into a chicken when he tried to cast a polymorph spell.  Right after that, Master Thalantyr's cat chased Melicamp out the door in a crash of meowing and feathers.  I searched for him but I haven't been able to find him.  I've found plenty of normal chickens, but not one of them seemed to be my friend.  Melicamp hasn't been seen for a while now and I am very worried about him.  Master Thalantyr was extremely upset when he learned what had happened to Melicamp and fired me on the spot.  He thought I had something to do with the accident.  It was not my fault and I lost my apprenticeship!  Truly an injustice has occured here!~
	++ ~What would you need us to do?~ + 10
	++ ~I have to go, bye!~ + 4
END

IF ~~ THEN BEGIN 2
SAY ~Well no need to be rude!  Fine, I am leaving.~
	IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END

IF ~~ THEN BEGIN 3
SAY ~Excellent question <SIRMAAM>!~
=~There are a couple of ways one becomes a "former apprentice".  Some apprentices have their mentor tell them "you're fired", an apprentice can choose to quit, or after receiving enough guidance an apprentice can become an expert in his profession!~
	++ ~So are you now a professional mage?~ + 6
	++ ~I see, well goodbye then. I have to go.~ + 4
END

IF ~~ THEN BEGIN 4
SAY ~Ok goodbye.  If you decide you want to help me, come back here.  I will be right here.~
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 6
SAY ~No.  I was fired.~
	IF ~~  + 1
END

IF ~True()
	Global("S9Meliquest","GLOBAL",0)~ THEN BEGIN 7
	SAY ~Will you help me to locate my friend Melicamp, the missing apprenctice who accidentaly polymorphed into a chicken?~
	++ ~Tell us what you need us to do.~ + 10
	++ ~Why should we help you?~ + 9	
	++ ~Go away kid, ya bother me.~ + 2
	++ ~No, we don't have time to help you at the moment.~ + 4
END

IF WEIGHT #5 ~Global("S9Meliquest","GLOBAL",1)~ THEN BEGIN 8
SAY ~Have you been able to locate Melicamp?~
	IF ~PartyHasItem("MISC49")~ THEN REPLY ~Yes, we found him!~ DO 
		~SetGlobal("S9Meliquest","GLOBAL",2)~ + 19
	IF ~Global("HelpThalantyr","GLOBAL",1)~ THEN REPLY ~We've already found Melicamp and taken him to Thalantyr.~ GOTO 19
	++ ~No, we haven't been able to find him yet.~ + 18
END

IF ~~ THEN BEGIN 9
	SAY ~I borrowed a selection of Magic Tomes from Master Thalantyr before I was fired.  He didn't ask for them back, so I guess that they are mine.  I will let you have your pick from among my Magic Tomes if you help me regain my apprenticeship.~
	++ ~Tell us what happened.~ + 1
	++ ~Yes, we will assist you.~ + 10
	++ ~Go away kid, ya bother me.~ + 2
	++ ~No, we can't help you now.~ + 4
END

IF ~~ THEN BEGIN 10
	SAY ~I need you to find Melicamp, Master Thalantryr's other apprentice.  He can not have gotten very far from here if he is still alive.  Find him and return him to Master Thalantyr.  He will know what to do and may be able to reverse the effects of the polymorph spell that turned him into a chicken.  If you rescue Melicamp, Master Thalantyr may even reinstate my apprenticeship!~ 
	IF ~Global("S9Meliquest","GLOBAL",2)~ THEN REPLY ~We've already found Melicamp and taken him to Thalantyr.~ GOTO 19
	++ ~Yes, we will help.~ + 11
	++ ~No, we will not help you.~ + 4
END

IF ~~ THEN BEGIN 11
	SAY ~Great!  Please let me know the moment you find him!  I'll be waiting here.~  	
	IF ~~ THEN DO ~SetGlobal("S9Meliquest","GLOBAL",1)~
	UNSOLVED_JOURNAL %Help Reinstate Thalantyr's Apprentice Jamdak.

I have met Jamdak, a disgraced apprentice.   Jamdak used to work for Thalantyr, a mighty mage who near in High Hedge.  Jamdak was fired after another on of Thalantyr's apprentices, Melicamp, accidentally turned himself into a chicken.  Jamdak asked me to locate Melicamp and has offered me a reward from among a stash of magic tomes that he "borrowed" from Thalantryr if I can get him reinstated as Thalantyr's apprentice.% EXIT
END

IF ~~ THEN BEGIN 18
SAY ~Please keep searching for him.  He can't have gotten too far on his little chicken legs.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 19
SAY ~Wonderful!  I must go see Master Thalantyr at once!  Meet me in his abode.~  	
	IF ~~ THEN DO ~
	MoveToPointNoInterrupt([2026.2540])  
	DestroySelf()
	SetGlobal("S9Meliquest","GLOBAL",3)~ EXIT
END

IF WEIGHT #4 ~Global("S9Meliquest","GLOBAL",3)
!Dead("thalantyr")~ THEN BEGIN 100
	SAY ~Master Thalantyr!  It is I Jamdak!  In light of the Melicamp's reappearance, you can now see that his disappearance was not my fault, right?  His own foolishness led to him being transformed into a chicken.  Is there any way you would take me back under your wing as your apprentice?  It would mean everything to me.~ 
	IF ~~ THEN DO ~ ActionOverride("thalantyr",SetNumTimesTalkedTo(2))~	EXTERN ~THALAN~ S9JAMM
END

IF WEIGHT #4 ~Global("S9Meliquest","GLOBAL",3)
	Dead("thalantyr")~ THEN BEGIN 101
	SAY ~Now where has Master Thalantyr gone off to?  I'm going to go look for him.~
	IF ~~ THEN DO ~EscapeAreaDestroy(5)~ EXIT
END

IF ~~ THEN BEGIN 102
SAY ~I won't fail you!  Thank you so much sir.  And thank you, <CHARNAME>, for helping me to regain Master Thalantyr's trust!~
	IF ~~ THEN DO 
	~AddexperienceParty(300)
	SetGlobal("S9Meliquest","GLOBAL",4)
	EraseJournalEntry(%Help Reinstate Thalantyr's Apprentice Jamdak.

I have met Jamdak, a disgraced apprentice.   Jamdak used to work for Thalantyr, a mighty mage who near in High Hedge.  Jamdak was fired after another on of Thalantyr's apprentices, Melicamp, accidentally turned himself into a chicken.  Jamdak asked me to locate Melicamp and has offered me a reward from among a stash of magic tomes that he "borrowed" from Thalantryr if I can get him reinstated as Thalantyr's apprentice.%)~ 

	SOLVED_JOURNAL ~Help Reinstate Thalantyr's Apprentice Jamdak. <DAYANDMONTH>

I have assisted Jamdak the apprentice regain his position as Thalantyr's apprentice.  Thalantyr realized that Jamdak did not have a part in Melicamp's accident.~ GOTO 120
END

IF ~~ THEN BEGIN 120
SAY ~I can offer you a Magic Tome from among several volumes of arcane knowledge useful for a wizard.  These tomes can be used to help a mage become more proficient in a specific field of magic.  Choose a tome as a reward for helping me to regain my position as Thalantyr's apprentice.~
	IF ~~ THEN REPLY ~We choose the Tome of the Abjurer.~ DO ~
	GiveItemCreate("s9tome22",Player1,1,1,1)~ GOTO 125
		IF ~~ THEN REPLY ~We choose the Tome of the Conjurer.~ DO ~
	GiveItemCreate("s9tome23",Player1,1,1,1)~ GOTO 125
		IF ~~ THEN REPLY ~We choose the Tome of the Diviner.~ DO ~
	GiveItemCreate("s9tome24",Player1,1,1,1)~ GOTO 125
	IF ~~ THEN REPLY ~We choose the Tome of the Enchanter.~ DO ~
	GiveItemCreate("S9tome25",Player1,1,1,1)~ GOTO 125	
	IF ~~ THEN REPLY ~We choose the Tome of the Illusionist.~ DO ~
	GiveItemCreate("S9tome26",Player1,1,1,1)~ GOTO 125
	IF ~~ THEN REPLY ~We choose the Tome of the Invoker.~ DO ~
	GiveItemCreate("s9tome27",Player1,1,1,1)~ GOTO 125
		IF ~~ THEN REPLY ~We choose the Tome of the Necromancer.~ DO ~
	GiveItemCreate("s9tome28",Player1,1,1,1)~ GOTO 125
		IF ~~ THEN REPLY ~We choose the Tome of the Transmuter.~ DO ~
	GiveItemCreate("s9tome29",Player1,1,1,1)~ GOTO 125
	IF ~~ THEN REPLY ~We choose the Tome of the Wildmage.~ DO ~
	GiveItemCreate("S9tome30",Player1,1,1,1)~ GOTO 125	
	IF ~~ THEN REPLY  ~We aren't interested in your books.~ GOTO 125
END

IF ~~ THEN BEGIN 125
SAY ~Thank you so much for your help!  I have heard of a scribe who sells additional magic tomes, Panver the Loremaster, out of the Elfsong Tavern in Baldur's Gate.  Go find him if you want additional magic tomes in the future.  Thank you again!~
	IF ~!Global("HelpThalantyr","GLOBAL",1)~ THEN GOTO 126
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 126
SAY ~<CHARNAME>, there is one more matter I would ask.  Please help however Melicamp you can.~
	IF ~PartyHasItem("MISC49")~ THEN DO ~
		TakePartyItem("MISC49")
		DestroyItem("MISC49")
		CreateCreature("MELICA",[286.398],0)
		ActionOverride("Melicamp",SetNumTimesTalkedTo(2))
		SetGlobal("FoundChicken","GLOBAL",2)
		SetGlobal("HelpThalantyr","GLOBAL",1)
		~ EXTERN ~THALAN~ S9JAMM2
	IF ~!PartyHasItem("MISC49")~ THEN REPLY ~I can't believe he slipped out of my pack!~ EXIT
END

IF 	~Global("S9Meliquest","GLOBAL",4)~ THEN BEGIN 130
SAY ~Thank you so much for your help!  Master Thalantyr has once again taken me into service as his apprentice.~
	IF ~~ THEN EXIT
END

APPEND ~THALAN~
	IF ~Global("FoundChicken","GLOBAL",2)
	Global("S9Meliquest","GLOBAL",3)~ THEN BEGIN S9JAMM
		SAY ~JAMDAK!  You have returned?  I don't often give out apologies but it seems I owe one to you for blaming Melicamp's disappearance on you.  Jamdak, consider yourself my apprentice again.  Don't expect me to give you a hug or anything.~
		IF ~~ THEN EXTERN ~S9JAMDAK~ 102
	END
	
	IF ~~ THEN BEGIN S9JAMM2
		SAY ~I will do what must be done to help the foolish boy.  <CHARNAME>, are you willing to help?  We will need a component that I do not have on hand, and it will be your job to get it.  I will require the head of an undead creature, a simple skeleton skull will do.  Bring it back here and I will try to bend a few magical rules.  I cannot fully explain what I am about to try, but it's something of a reversal on the reincarnation scheme.  The age of the enchantment that changed Melicamp may allow for a loophole in the laws of magic.  Of course it may just kill us both in the casting.  Such is life.  <CHARNAME>, off you go to some dungeon or another.  Return with the skull.  Go.~
		IF ~~ THEN EXIT
	END	
END


	
	