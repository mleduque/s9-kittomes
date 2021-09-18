// Kit Tomes for Baldur's Gate
//Dialogue: Butler Travenhurst  (Noble)
//Author : Smeagolheart

BEGIN ~S9BUTLER~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Welcome
SAY ~How did you get in here. Lord Oti didn't send you did he?  That guttersnake thinks Castle Halwater belongs to him!~
	IF ~Global("S9OtiQuest","GLOBAL",1)~ THEN REPLY ~Yes, Lord Oti sent us.~ + 3
	IF ~Global("S9OtiQuest","GLOBAL",1)~ THEN REPLY ~Hand over the deed now or prepare to die!~ + 2
	++ ~No, I don't know what you are talking about. Sorry to disturb you.~ + 4
	++ ~Do you know anything about the iron crisis?~ + 6	
	++ ~Who is this Lord Oti?~ + 4
END

IF ~~ THEN BEGIN 2
SAY ~Big words from a commoner!  Have you the will to follow through with your threat?  You would not locate the deed, it is hidden and you will never find it and the guard would not look kindly upon the murder of a nobleman.  Begone!  Come back if you discover your manners and know how to talk to your betters.~ 
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 3
SAY ~So, the villan has sent you here in his place? The lowly coward!  Is it not disgrace enough that he has been banned from stepping foot into town?  Now he is employing your kind to do his dirty work.~
=~I will graciously listen to your pathetic pleas out of respect for Lord Oti's recently deceased mother.  See here - I don't know how the scoundrel Lord Oti had a copy of the deed to Castle Halwater.  My father had purchased the deed from Lord Oti's mother nigh twenty years ago, before she came into her vast fortune.  His copy was obviously a cheap forgery.~ 
	IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 4
SAY ~Yes, yes.  Go on now before you waste anymore of my time.  I have important documents to work on.~
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 5
SAY ~In short no. I will NEVER give up the ownership rights to Castle Halwater.  This document proclaims that it is mine by right.~ 
	IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 6
SAY ~Thou art a pribbling earth-vexing gudgeon. You are a wayward elf-skinned skainsmate.  Stop wasting my time foot-licker, I have important matters to attend to.  Shoo.~
	IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 9
	SAY ~What do you want commoner?  Be quick, my patience for dealing with your kind grows thin.~
	IF ~Global("S9OtiQuest","GLOBAL",1)~  THEN REPLY ~We wish to purchase the ownership rights to Castle Halwater for Lord Oti.~ 
		~SetGlobal("S9BuyDeed","GLOBAL",1)~ + 15
	IF ~Global("S9OtiQuest","GLOBAL",1)~  THEN REPLY  ~What is the situation with the Castle Halwater Deed and Lord Oti?~ + 10
	++ ~Have you seen Elminster or Drizzt around here?~ + 6
	++ ~Can you help with the iron crisis?~ + 6
	++ ~Nevermind.~ + 4
END

IF ~~ THEN BEGIN 10
SAY ~Lord Oti has NO claim to Castle Halwater, it belongs to the Travenhurst family.~
	IF ~Global("S9OtiQuest","GLOBAL",1)~  THEN REPLY ~We wish to purchase the ownership rights to Castle Halwater for Lord Oti.~ 
		~SetGlobal("S9BuyDeed","GLOBAL",1)~ + 15
	IF ~Global("S9OtiQuest","GLOBAL",1)~ THEN REPLY ~Hand over the deed now or prepare to die!~ + 2
	++ ~Is there anything we can do to convince you to give us the deed to Castle Halwater?~ + 5
	++ ~Can you explain again the situation with the deed?~ + 3
	++ ~Sorry to disturb you, we will come back later.~ + 4
END

IF ~Global("S9BuyDeed","GLOBAL",1)~ THEN BEGIN 15
SAY ~You wish to purchase the deed eh?  Three thousand gold.  No less!  Lord Oti must realize that is an incredible bargain for the rights to Castle Halwater.  The only reason I have not claimed the castle for myself is that I detest travelling all the way to Featherdale.~
	IF ~PartyGoldGT(3000)~ THEN REPLY ~Here is the money for the deed.~ GOTO 20
	++ ~We can't afford that.~ + 18
	++ ~We will talk to Lord Oti and return.~ + 18
END

IF ~~ THEN BEGIN 18
SAY ~Fine, fine, go do whatever it is that commoners do.  Return when you have the modest sum I am asking for the deed to Castle Halwater.  If you never return, that is fine as well.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 20
SAY ~So be it.  Here is the deed, now get thee gone and give it to Lord Oti.  Now onto other matters, goodbye.~
	IF ~~ DO ~TakePartyGold(3000)
	GiveItemCreate("s9deed",Player1,1,1,1)
	SetGlobal("S9BuyDeed","GLOBAL",2)
	AddexperienceParty(100)
	EscapeAreaDestroy(90)
	~ EXIT
END

IF ~Global("S9BuyDeed","GLOBAL",2)~ THEN BEGIN 25
SAY ~You bought the deed, we have nothing further to discuss.  Go.~
	IF ~~ EXIT
END

//******************************************************
// NOBL10 / Gerard Travenhurst
//******************************************************
EXTEND_BOTTOM NOBL10 0
	IF ~~ THEN REPLY ~Have you seen Butler Travenhurst around here?~ + S95
END

EXTEND_BOTTOM NOBL10 4
	IF ~~ THEN REPLY ~Have you seen Butler Travenhurst around here?~ + S95
END

EXTEND_BOTTOM NOBL10 5
	IF ~~ THEN REPLY ~Have you seen Butler Travenhurst around here?~ + S95
END

EXTEND_BOTTOM NOBL10 7
	IF ~~ THEN REPLY ~Have you seen Butler Travenhurst around here?~ + S95
END

APPEND NOBL10
	IF ~~ THEN BEGIN S95
		SAY ~Could you not see him in the main room?~
		IF ~Global("S9BuyDeed","GLOBAL",2)~ THEN REPLY ~No, he's not over there.~ + S97
		IF ~~ THEN REPLY ~I'll go look then.~ EXIT
	END

	IF ~~ THEN BEGIN S97
		SAY ~Oh that's right, my nephew went back home to Featherdale with his brother Oti.  He said something about a grand aventure freeing a wrongly imprisoned royal prisoner.  I lent him some money to help the cause.  Butler told me I could expect to double my money when the prisoner is able to claim the treasure he had buried before he was incarcerated.  I helped my nephew out of love, but doubling my investment also sounds good as well!  Now leave my house.  I must get back to work on council matters.~
		IF ~~ EXIT
	END
END


