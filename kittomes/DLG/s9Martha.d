// Kit Tomes for Baldur's Gate
//Dialogue: Marthana Shipsail (bard) (f) (1/2 e)
//Author : Smeagolheart

BEGIN ~S9MARTHA~

IF WEIGHT #1 ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY ~Psst.  Oi.  You there...  Are you interested in adventure?  And don't look at us like that!  We had nothing to do with any attacks on caravans around here.  That is the work of some dreadful bandits that passed by here earlier.  But nevermind about that, we need help restoring a nobleman's lost honor, and can reward those who help us handsomely.~
	IF ~~ THEN EXTERN ~S9OTI~ 0
END

IF ~~ THEN BEGIN 1
SAY ~Yes.  We have a sad tale to tell.  Would you be help us recover good Lord Oti's name and lost fortune?~
	++ ~Tell us more.~ + 3
	++ ~No I don't think so.~ + 4
	++ ~To arms, have at you!~ + 2
END

IF ~~ THEN BEGIN 2
SAY ~But we didn't do anything!  I told you, we are just passing through searching for help recovering Oti's inheritance.  Are you sure you want to attack two simple innocent travellers such as us?~
	++ ~I've reconsidered, tell us what troubles you.~ + 3
	++ ~No, we don't have time for you now.~ + 4
	++ ~Dieeeeeeeeeee!~ + FIGHT 
END

IF ~~ THEN BEGIN FIGHT
SAY ~Aiieeeeeeeee save me!  Lord Oti...  Lord Oti?~
	IF ~~ THEN DO ~Enemy()
	ActionOverride("S9OTI",EscapeAreaDestroy(90))~ EXIT
END	

IF ~~ THEN BEGIN 3
SAY ~It's like this:  when Lord Oti's mother died she left him a vast inheritance.  Chief among the items Lord Oti inherited from his mother's estate was a document proclaiming ownership rights to Castle Halwater in Featherdale.  Oti took this letter to show his "friend", Butler Travenhurst.  Butler stole the letter then had Lord Oti promptly thrown out of town.  Somehow he has convinced the town militia that Lord Oti must not be allowed to return.~
	IF ~~ THEN EXTERN ~S9OTI~ 1
END

IF ~~ THEN BEGIN 4
SAY ~Aye, ok then.  If you change your mind come talk to me again.  We'll be here waiting.~
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 5
SAY ~Lord Oti has engaged my services to discover how best to delicately retrieve the Castle Halwater Deed.  This is where you come in, if you are interested.~	
	++ ~What exactly are you asking?~ + 6
	++ ~No, we don't have time for you now.~ + 4
END

IF ~~ THEN BEGIN 6
SAY ~Retrieve the deed to Castle Halwater letter from Butler Travenhurst and Lord Oti shall see that you are handsomely rewarded.  Butler is likely holed up in Travenhurst Manor inside the town limits.  If murdering a noble had crossed your mind I would urge you to reconsider.  I would not recommend attacking him because he may have hidden the document.  Lord Oti is interested in retrieving his inheritance, not in bloody vengeance.~
	IF ~~ THEN EXTERN ~S9OTI~ 8
END

IF ~~ THEN BEGIN 7
SAY ~Lord Oti and I will be here waiting anxiously for your return.~
	IF ~~ THEN DO ~SetGlobal("S9OtiQuest","GLOBAL",1)~  
	UNSOLVED_JOURNAL %Retrieve the Castle Halwater Deed.

I have met a most interesting couple: Lord Oti the Glansman, Lord of Castle Halwater and the bard Marthana Shipsail.  I have agreed to help them recover the Castle Halwater Deed from Butler Travenhurst in Travenhurst Manor within the town limits of Beregost.  Once I have the document, I am to return and present it to Marthana just outside the town limits.% EXIT
END

IF ~Global("S9OtiQuest","GLOBAL",1)~ THEN BEGIN 8
SAY ~Have you had any luck retrieving Lord Oti's document?~
	IF ~PartyHasItem("S9DEED")~ THEN REPLY ~Yes, here is is.~ + 14
	++ ~We don't have the Castle Halwater Deed yet.~ + 18
END

IF ~True()~ THEN BEGIN 9
SAY  ~Are you interested in adventure and restoring a nobleman's lost honor? We can reward those who help handsomely.~
	++ ~Tell us more.~ + 3
	++ ~No I don't think so.~ + 4
	++ ~To arms, have at you!~ + 2
END

IF ~~ THEN BEGIN 14
SAY ~Excellent!~ 
	 IF ~~ THEN DO ~
		AddexperienceParty(600) 
		TakePartyItem("s9deed")
		DestroyItem("s9deed")~ REPLY ~Where is Lord Oti?~ GOTO 15
END

IF ~~ THEN BEGIN 15
SAY ~Lord Oti has left to begin raising the funds necessary to claim Castle Halwater.  I expect him to be back any minute now, as he still has not paid me my fee for acting as his representative in this matter.  He also has yet to repay the money I lent him for expenses to get by while he was banned from town and unable to access his own funds.~
	IF ~~ THEN DO ~
	EraseJournalEntry(%Retrieve the Castle Halwater Deed.

I have met a most interesting couple: Lord Oti the Glansman, Lord of Castle Halwater and the bard Marthana Shipsail.  I have agreed to help them recover the Castle Halwater Deed from Butler Travenhurst in Travenhurst Manor within the town limits of Beregost.  Once I have the document, I am to return and present it to Marthana just outside the town limits.%)~ 
	SOLVED_JOURNAL ~Retrieve the Castle Halwater Deed. <DAYANDMONTH>

I have returned the Castle Halwater Deed to Lord Oti the Glansman.  Actually, I gave it to Marthana because Lord Oti was not there.  I feel confident that I made the right choices in this matter and expect Lord Oti to show up soon with the reward money he promised and with the money he owes Marthana.  If I want to know more I think I can go talk to Gerard Travenhurst in Travenhurst manor.  Marthana offered me my choice of Magic Tomes as a reward.  If I'd like additional tomes, I can see Panver in the Elfsong tavern in Baldur's Gate.~ + 20
END

IF ~~ THEN BEGIN 18
SAY ~We will remain here waiting anxiously for your return.~
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 20
SAY ~Lord Oti did entrust me with the magic trinkets he mentioned and has authorized me to give you one of several these tomes of Roguish knowledge that Lord Oti acquired amongst his mother's things.  These tomes can be used to guide a person towards a certain career path.  Choose a tome as a reward for your service to Lord Oti and for aiding to restore his good name.  I should warn you that I'm told that these particular tomes have been known to cause inconsistent results.  If for example, one were a Thief, one might find oneself less skilled than an equivalent sneaksman.  Still, powerful magic items such as these should not be scoffed at.  Individual results may vary and are permanent!~
	IF ~~ THEN REPLY ~We choose the Lexicon of the Swashbuckler.~ DO ~
	GiveItemCreate("s9tome12",Player1,1,1,1)~ GOTO 25
		IF ~~ THEN REPLY ~We choose the Lexicon of the Bounty Hunter.~ DO ~
	GiveItemCreate("s9tome11",Player1,1,1,1)~ GOTO 25
		IF ~~ THEN REPLY ~We choose the Lexicon of the Assasin.~ DO ~
	GiveItemCreate("s9tome10",Player1,1,1,1)~ GOTO 25
	IF ~~ THEN REPLY ~We choose the Text of the Blade.~ DO ~
	GiveItemCreate("S9tome13",Player1,1,1,1)~ GOTO 25	
	IF ~~ THEN REPLY ~We choose the Text of the Jester.~ DO ~
	GiveItemCreate("S9tome14",Player1,1,1,1)~ GOTO 25
	IF ~~ THEN REPLY  ~We aren't interested in your books, a good act is reward enough.~ GOTO 25
END

IF ~~ THEN BEGIN 25
SAY ~Well thank you again for your service.  If in the future you decide you require more Magic Career Tomes, I have heard of a merchant who sells these items.  Panver the Loremaster is his name, he can be found in the Elfsong Tavern in Baldur's Gate.  Thank you and farewell! I'm off to find Lord Oti.~
	IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END

IF WEIGHT #1 ~Dead("S9OTI")~ THEN BEGIN 28
SAY ~Alas, Lord Oti is dead.  So much for fortune and glory.  See you later, I'm out of here.~
	IF ~~ THEN DO ~	
	EscapeAreaDestroy(90) ~ EXIT
END