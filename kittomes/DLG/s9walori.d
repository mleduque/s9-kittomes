// Kit Tomes for Baldur's Gate
//Dialogue: Sir Walorin the Paladin
//Author : Smeagolheart

BEGIN ~S9WALORI~

IF WEIGHT #1 ~NumTimesTalkedTo(0)
!Dead("S9KEVIAN")
!StateCheck("S9KEVIAN",STATE_SLEEPING)~ THEN BEGIN 0
SAY ~Greetings stranger, I am Sir Walorin Daleborn, Paladin of Helm.~
	IF ~~ THEN EXTERN ~S9KEVIAN~ 0
END

IF ~~ THEN BEGIN 1
	SAY ~We have a request, and we can offer a meaningful reward to a young Cleric or Paladin.  Would you care to hear our proposal?~
	++ ~Yes tell us more.~ + 3
	++ ~No, we don't have time to help you at the moment.~ + 4
	++ ~Get lost goody two shoes.~ + 2
END

IF ~~ THEN BEGIN 2
	SAY ~An uncouth barbarian such as yourself will follow naught but their own path.  We will look elsewhere for assistance.  Beware of invoking the wrath of the Vigilant One in your travels stranger.  Farewell.~
	IF ~~ THEN DO ~EscapeAreaDestroy(90)
	ActionOverride("S9KEVIAN",EscapeAreaDestroy(90))~ EXIT
END

IF ~~ THEN BEGIN 3
SAY ~The Vigilant One and the Morninglord and their followers have at times had a complicated relationship, however, there is a matter here that has brought us together for a shared purpose.~
	IF ~~ THEN EXTERN ~S9KEVIAN~ 1
END

IF ~~ THEN BEGIN 4
SAY ~As you wish, <LADYLORD>.  If you change your mind, Lord Chandler and myself will be here seeking adventurers with stout hearts.~
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 5
SAY ~Word has reached us that the ruins of an ancient village have been discovered far to the west along the coast.  The site is being excavated as part of an archaeological dig led by Charleston Nib.~
	IF ~~ THEN EXTERN ~S9KEVIAN~ 2
END

IF ~~ THEN BEGIN 6
SAY ~Investigate the archeological dig.  Report back here with news of the excavation and bring back any artifacts found within the ancient village.~
	++ ~We will do as you say.~ + 7
	++ ~No, we won't do this.~ + 4
END

IF ~~ THEN BEGIN 7
	SAY ~Very good, <LADYLORD>.  May Helm guide your path.~
	IF ~~ THEN DO ~SetGlobal("S9IdolQuest","GLOBAL",1)~
	UNSOLVED_JOURNAL %Investigate the Archeological Dig.

Sir Walorin and Lord Chandler have sent us to the the west to investigate an archeological dig led by Charleston Nib.  We are to observe the proceedings and bring back any artifacts discovered at the site.  After our investigation we are to report back to the pair near The Song of the Morning Temple adjacent to Beregost.% 	EXIT
END

IF ~!Global("S9IdolQuest","GLOBAL",0)~ THEN BEGIN 8
SAY ~How did it go?~
	IF ~Global("S9IdolQuest","GLOBAL",2)~ THEN REPLY  ~It was a slaughter!  The miners went insane.~ + 9
	IF ~Global("S9IdolQuest","GLOBAL",2)~ THEN REPLY  ~It went just fine, very uneventful.~ + 10
	IF ~PartyHasItem("MISC48")~ THEN REPLY ~The miners went insane and we retrieved the Kozah Idol.~ + 11
	IF ~Global("S9IdolQuest","GLOBAL",1)~ THEN REPLY ~We haven't made found anything yet.~ + 18
END

IF ~~ THEN BEGIN 9
SAY ~That is terrible.  We were right to harbour suspicons about this dig.  Were any artifacts found during the dig?  Perhaps a cursed item would explain why this tragedy happened.~
	IF ~PartyHasItem("MISC48")~ THEN REPLY ~We found the Kozah Idol.~ + 11
	++ ~We found nothing and could not discover the reason for the slaughter.~ + 13
	++ ~We found nothing, we will return to the site to search some more.~ EXIT
END

IF ~~ THEN BEGIN 10
SAY ~Word has reached us that it did not go fine.  Are you telling us the truth of the matter?~
	++ ~Actually it was a slaughter!  The miners went insane.~ + 9
	++ ~Yes, it went fine.  Nothing happened.~ + 12
END

IF ~~ THEN BEGIN 11
SAY ~Kozah! I do not recognize that name, but it rolls off the tongue in a foul manner.  Surely it is an aspect of an evil god or beast.~
	IF ~~ THEN EXTERN ~S9KEVIAN~ 3
END

IF ~~ THEN BEGIN 12
SAY ~Well then our concerns were for nothing.  Come Lord Chandler, let us return to Baldur's Gate.  I must prepare a report of this matter.  Thank you for your service.  Remember to follow the true path in the future.~
	IF ~~ THEN DO ~EscapeAreaDestroy(90)
	ActionOverride("S9KEVIAN",EscapeAreaDestroy(90))~ EXIT
END

IF ~~ THEN BEGIN 13
SAY ~Hmm.  That is troubling.  Well, Lord Chandler and I will leave here immediately to investigate the incident.  Thank you for your service to Helm.  We offer you a reward that we had set aside for this matter.~ 
	IF ~~ THEN DO ~	AddexperienceParty(800)~ + 19
END

IF ~True()~ THEN BEGIN 14
	SAY ~Would you care to hear our proposal?  We offer an opportunity to serve both Helm and the Morninglord in a matter of great importance?~
	++ ~Yes tell us more.~ + 3
	++ ~No, not right now.~ + 4
	++ ~Get lost goody two shoes.~ + 2
END

IF ~~ THEN BEGIN 15
SAY ~<CHARNAME>, would you turn over the idol to us so that it may be destroyed?~
	IF ~~ THEN REPLY ~Yes, destroy the idol.~ DO ~TakePartyItem("MISC48")
	DestroyItem("MISC48") 	~ GOTO 16
	++ ~No it came to me, it belongs to me.~ + 17
END

IF ~~ THEN BEGIN 16
SAY ~Thank you for your service in this matter.  It is a tragedy what happened to the miners.   We will take this foul artifact and see that it is destroyed.~
	IF ~~ THEN DO ~GiveGoldForce(300)
	AddexperienceParty(800)~ + 19
END

IF ~~ THEN BEGIN 17
SAY ~We cannot allow this to pass, the artifact must be destroyed.~
	IF ~~ THEN DO ~Enemy()
	ActionOverride("S9KEVIAN",Enemy())
	Attack(NearestEnemyOf(Myself))
	~ EXIT
END


IF ~~ THEN BEGIN 18
SAY ~Go and observe the archeological dig.  Report back to us when you have information.  Bring back any artifacts that may be of interest to the followers of Helm or Lathander with you.~
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 19
SAY ~Choose your reward from among these powerful magic tomes.  Great knowledge is before your fingertips.  Which text would you have?~
	IF ~~ THEN REPLY ~A Priest's Guide to Helm.~ DO ~GiveItemCreate("s9tome20",Player1,1,1,1)~ GOTO 20
	IF ~~ THEN REPLY ~A Priest's Guide to Lathander.~ DO ~GiveItemCreate("s9tome21",Player1,1,1,1)~ GOTO 20
	IF ~~ THEN REPLY ~Manual of the Cavalier.~ DO ~GiveItemCreate("s9tome04",Player1,1,1,1)~ GOTO 20
	IF ~~ THEN REPLY ~Manual of the Inquisitor.~ DO ~GiveItemCreate("s9tome05",Player1,1,1,1)~ GOTO 20
	IF ~~ THEN REPLY ~Manual of the Undead Hunter.~ DO ~GiveItemCreate("s9tome06",Player1,1,1,1)~ GOTO 20
	IF ~~ THEN REPLY ~None of the tomes interest us.~ GOTO 20
END

IF ~~ THEN BEGIN 20
SAY ~As you would have it.  Come Lord Chandler, let us return to Baldur's Gate and prepare a report of the happenings.  Perhaps you would like to purchase more Magic Career Tomes at some point in the future?  The merchant who sold them to us, Panver the Loremaster, is in the Elfsong Tavern in Baldur's Gate.  Thank you again and may Helm watch over you.~
	IF ~~ THEN DO ~
	EscapeAreaDestroy(90)
	ActionOverride("S9KEVIAN",EscapeAreaDestroy(90))
	EraseJournalEntry(%Investigate the Archeological Dig.

Sir Walorin and Lord Chandler have sent us to the the west to investigate an archeological dig led by Charleston Nib.  We are to observe the proceedings and bring back any artifacts discovered at the site.  After our investigation we are to report back to the pair near The Song of the Morning Temple adjacent to Beregost.%)~
	SOLVED_JOURNAL ~Investigate the Archeological Dig. <DAYANDMONTH>

	I have investigated the doomed archeological dig and reported the results to Sir Walorin and Lord Kevian Chandler.  They have rewarded me for the service and have promised to prepare a report of the event to their superiors.   They offered me a magic tome, and mentioned I could get more if I wanted them from Panver the Loremaster in the Elfsong Tavern in Baldur's Gate.~ EXIT
END

IF WEIGHT #1 ~Dead("S9KEVIAN")~ THEN BEGIN 28
SAY ~Lord Chandler is dead.  I should go and tell the other priests of the Morninglord of his demise.~
	IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END



