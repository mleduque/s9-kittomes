// Kit Tomes for Baldur's Gate
//Dialogue: Panver
//Author : Smeagolheart

BEGIN ~s9PANVER~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN s9Store1
SAY ~Today is your lucky day. Panver the Loremaster, that's me, is selling his prized possessions.  My untold hardships are an opportunity for you!  Have you not dreamt of learning the skills of a "Sword Saint" yet shudder to think about the sweat, tears, time and training normally required to learn those skills?  With one of these mysterious Magical Career Tomes, you can skip all the hard work!  For a minimal fee, these tomes can teach you new skills using MAGIC.  Get your Magical Career Tomes here!~
	++ ~Yes, show us what you have~ GOTO s91_2
	++ ~Are your tomes dangerous?~ + s91_4
	++ ~Do you have anything for Thieves, Bards, or other professions?~ + s91_5
	++ ~What untold hardships are you talking about?~ + s91_6
	++ ~Will you be getting more any more tomes soon?~ + s91_8
	++ ~No thanks, I'm not interested right now.~ GOTO s91_3	
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN ReturnDialogue
SAY ~Ah, you have returned for this once in a lifetime opportunity.  I knew you had good taste.~
	IF ~~ + 3
END

IF ~True()~ THEN BEGIN 3
SAY ~Would you like to see my Magical Career Tomes?~
	++ ~Yes, show me your wares.~ + s91_2
	++ ~Are your tomes dangerous?~ + s91_4
	++ ~Do you have anything for Thieves, Bards, or perhaps other professions?~ + s91_5
	++ ~What untold hardships are you talking about?~ + s91_6
	++ ~No thanks, I'm not still not interested...~ + s91_3	
END

IF ~~ THEN BEGIN 4
SAY ~Look <SIRMAAM>, would you like to see my Magical Career Tomes or not?~
	++ ~Yes, show me your wares.~ + s91_2
	++ ~Are your tomes dangerous?~ + s91_4
	++ ~Do you have anything for Thieves, Bards, or perhaps other professions?~ + s91_5
	++ ~What untold hardships are you talking about?~ + s91_6	
	++ ~No, I'm not interested...~ + s91_3
END
	
IF ~~ THEN BEGIN s91_2
SAY ~Excellent, have a look.~
	IF ~~ THEN DO ~StartStore("s9panver",Player1)~ EXIT
END

IF ~~ THEN BEGIN s91_3
SAY ~If you change your mind, I'll be here!  Tomes here!  Get one of Panver's Magical Career Tomes here!~
	IF ~~ EXIT
END

IF ~~ THEN BEGIN s91_4
SAY ~Look <SIRMAAM>, it's like this: there are other adventurers around these parts willing to risk their necks plunging into the unknown.~
= ~The mere rumor of a dropped gold piece, a legendary scrap of paper, or the promise of a reward is guaranteed to always brings a stampede of adventurers running.  I don't make money by sitting here explaining myself to you, I don't have time for those games.  Save your games, good customer, because no warranty is implied or offered.~
	IF ~~ + 4
END

IF ~~ THEN BEGIN s91_5
SAY ~Yes, I do have a few other editions. These editions have been known to be even more unpredictable than the standard books.  It's highly likely these tomes may not work exactly as intended.  I have been told results depend on the reader of the tome and his or her prior experience in his profession.~
= ~With that being said, would you like to see these special tomes?  Remember, there are no refunds.~
	++ ~Yes, show me your special tomes.~ + s91_7
	++ ~Only show me your standard tomes.~ + s91_2
	++ ~No, I'm not interested...~ + s91_3
END

IF ~~ THEN BEGIN s91_6
SAY ~A tragic misunderstanding with a game of chance but I'd really prefer not get into the details.  I do require a large sum of money quickly so I have been forced to auction off these treasured artifacts.~
	IF ~~ + 3
END

IF ~~ THEN BEGIN s91_7
SAY ~Ok here are my special tomes then.~
	IF ~~ THEN DO ~StartStore("s9panves",Player1)~ EXIT
END

IF ~~ THEN BEGIN s91_8
SAY ~No.  What you see is what I have.  If I am out of stock, I am very sorry but there is nothing I can do.  Magic tomes don't grow on trees you know.  Only the paper necessary to write them does!~
	IF ~~ + 3
END


