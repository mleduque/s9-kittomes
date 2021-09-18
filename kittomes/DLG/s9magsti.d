// Kit Tomes for Baldur's Gate
//Dialogue: Magstine Trannyth (F Human druid)
//Author : Smeagolheart

BEGIN ~S9MAGSTI~

IF WEIGHT #1 ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY ~Hail traveller.  My name is Magstine Trannyth, druid of Silvanus.  Come hear our tale!~
	IF ~~ THEN EXTERN ~S9VICGOL~ 0
		//review
END

IF ~~ THEN BEGIN 1
	SAY ~An evil force is threatening these woods.  Would you consider helping us discover what is happening here?~
	++ ~Tell us what is going on.~ + 3
	++ ~Beat it tree hugger.~ + 2
	++ ~No, we can't help you now.~ + 4
END

IF ~~ THEN BEGIN 2
	SAY ~Vic, let's teach these intruders a lesson in manners!  Attack!~
	IF ~~ THEN DO ~Enemy()
	ActionOverride("S9VICGOL",Enemy())
	Attack(NearestEnemyOf(Myself))
	~ EXIT
END

IF ~~ THEN BEGIN 3
SAY ~Vicgold and I have heard about an infestation of spiders in these woods.  We have been searching for the source of this evil for some time now.~
	IF ~~ THEN EXTERN ~S9VICGOL~ 1
END

IF ~~ THEN BEGIN 4
SAY ~If you change your mind come talk to us again.  Until next time, may Silvanus protect you.~
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 5
SAY ~Spiders are a part of the natural order and play a integral role in maintaining balance.  Someone or something has caused the spiders in these woods to behave aggressively.  It has become a very dangerous situation.~
	IF ~~ THEN EXTERN ~S9VICGOL~ 2
END

IF ~~ THEN BEGIN 6
SAY ~We want you to find out what is disturbing the spiders in these woods.  Return here when you have discovered the source of this evil that is upsetting the balance.~
	++ ~We will investigate this matter.~ + 7
	++ ~We won't help you.~ + 4
END

IF ~~ THEN BEGIN 7
	SAY ~Go in peace, return with news of what has aggravated the spiders and what is provoking them.~
	IF ~~ THEN DO ~SetGlobal("S9SpiderQuest","GLOBAL",1)~
	UNSOLVED_JOURNAL %Discover the Cause of the Spiders Aggression.

Magstine Trannyth and Vicgold Otterbight have sent us on a mission to discover the source of the spider's aggression in Cloakwood Forest.  When we discover the reason the spiders in Cloakwood Forest are multiplying and attacking everyone, we are to report back to Magstine near Cloakwood Lodge.% EXIT
END

IF ~Global("S9SpiderQuest","GLOBAL",1)~ THEN BEGIN 8
SAY ~You return, did you find out what is provoking the spiders?~
	IF ~Global("S9CentDead","GLOBAL",1)~ THEN REPLY ~A spider queen named Centeol was directing the spiders.~+ 11
	++ ~We haven't found out anything yet.~ + 18
END

IF ~True()~ THEN BEGIN 9
	SAY ~A grave evil is threatening these woods.  Would you be help Vicgold and I find out what is upsetting the spiders and what has upset the balance?~
	++ ~Tell us what is going on.~ + 3
	++ ~Beat it you dirty tree huggers.~ + 2
	++ ~No, we don't have time to help you at the moment.~ + 4
END

IF ~~ THEN BEGIN 11
SAY ~This is most unusal.  It is a tragic end that she ended up cursed and transformed.  She must have upset a very powerful sorceror!  I should not like to cross this Sorceror Jon's path in the future!  Still, with Centeol's defeat, balance can be restored.  It will surely take time but Vicgold and I are content that healing will begin here.~ 
	IF ~~ THEN DO 
	~GiveGoldForce(75) 
	AddexperienceParty(600)
	EraseJournalEntry(%Discover the Cause of the Spiders Aggression.

Magstine Trannyth and Vicgold Otterbight have sent us on a mission to discover the source of the spider's aggression in Cloakwood Forest.  When we discover the reason the spiders in Cloakwood Forest are multiplying and attacking everyone, we are to report back to Magstine near Cloakwood Lodge.%)~ 

	SOLVED_JOURNAL ~Discover the Cause of the Spiders Aggression. <DAYANDMONTH>

I have reported the reason for the spider attacks in Cloakwood forest to Magstine Trannyth and Vicgold Otterbight.  They offered me a choice of Magic Tomes as a reward.  If I'd like additional tomes, I can see Panver in the Elfsong tavern in Baldur's Gate.  I am glad this matter is concluded and healing can begin in the forest.~ GOTO 20
END

IF ~~ THEN BEGIN 18
SAY ~Keep looking friend.  I have faith that you will discover what is causing the spider's madness.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 20
SAY ~We can offer you a Magic Tome from among several tomes of Druidic knowledge.  These tomes can be used to guide a Ranger or Druid towards a certain career path.  I have a selection of Tomes for a druid, while Vic can offer some guides useful to a Ranger.  Choose a tome as a reward for your service to Sylvanus.~
	IF ~~ THEN REPLY ~We choose the Codex of the Avenger.~ DO ~
	GiveItemCreate("s9tome18",Player1,1,1,1)~ GOTO 25
		IF ~~ THEN REPLY ~We choose the Codex of the Shapeshifter.~ DO ~
	GiveItemCreate("s9tome17",Player1,1,1,1)~ GOTO 25
		IF ~~ THEN REPLY ~We choose the Codex of the Totemic Druid.~ DO ~
	GiveItemCreate("s9tome16",Player1,1,1,1)~ GOTO 25
	IF ~~ THEN REPLY ~We choose The Archer's Guide.~ DO ~
	GiveItemCreate("S9tome07",Player1,1,1,1)~ GOTO 25	
	IF ~~ THEN REPLY ~We choose The Stalker's Guide.~ DO ~
	GiveItemCreate("S9tome08",Player1,1,1,1)~ GOTO 25	
	IF ~~ THEN REPLY ~We choose The Beast Master's Guide.~ DO ~
	GiveItemCreate("S9tome09",Player1,1,1,1)~ GOTO 25
	IF ~~ THEN REPLY  ~We aren't interested in your books.~ GOTO 25
END

IF ~~ THEN BEGIN 25
SAY ~Thank you for helping to restore balance to nature.  Silvanus protect you in your travels.  The merchant who sold us our tomes, Panver the Loremaster, is in the Elfsong Tavern in Baldur's Gate and you should see him if you decide you require additional Magic Career Tomes.~
=~Come Vicgold let's go.~
	IF ~~ THEN EXTERN ~S9VICGOL~ 3 
END

IF WEIGHT #1 ~Dead("S9VICGOL")~ THEN BEGIN 28
SAY ~Vicgold is dead.  It is a great shame that he died before he could locate Mr. Jingles.  Excuse me, I must go try and find Mr. Jingles myself in memory of mighty Vicgold.  Goodbye.~
	IF ~~ THEN DO ~	
	EscapeAreaDestroy(90) ~ EXIT
END
