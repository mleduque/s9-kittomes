// Kit Tomes for Baldur's Gate
//Dialogue: minsc interjections
//Author : Smeagolheart
// Ajantis
/*
INTERJECT S9VICGOL 0 s9Ajantis1
	== MINSCJ IF ~IsValidForPartyDialog("ajantis")~ THEN
	~These people seem nice, but, this guy seems a little bit mad.  Who ever heard of a Ranger's being friendly with a ferret?~
	END S9MAGSTI 1
//Imoen
INTERJECT S9OTI 1 S9Imoen0
  == IMOEN2J IF ~IsValidForPartyDialog("imoen")~ THEN
	~This is not fair. <CHARNAME>, we have to do something!~
END ~S9MARTHA~ 5

	
	*/


// Branwen
INTERJECT S9WALORI 0 S9Brawen0
  == BRANWJ IF ~IsValidForPartyDialog("branwen")~ THEN
	~A paladin! By Valkur's strapping strapping buttocks!~
END ~S9KEVIAN~ 0 

//MINSC
INTERJECT S9VICGOL 0 S9Minscint0
	== MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN
	~These people seem nice, but, this guy seems a little bit mad.  Who ever heard of a Ranger's being friendly with a ferret?~
	END S9MAGSTI 1

INTERJECT S9VICGOL 2 S9Minscint1
  == MINSCJ IF ~IsValidForPartyDialog("Minsc")~ THEN
	~Psst <CHARNAME>...  I told you he was mad!~
END S9MAGSTI 6

//JAHEIRA	
INTERJECT S9MAGSTI 0 S9Jahint0
	== %JAHEIRA_JOINED% IF ~IsValidForPartyDialog("Jaheira")~ THEN
	~I suggest we at least listen to what she has to say, <CHARNAME>.~
	END S9VICGOL 0

//FALDORN	
INTERJECT S9VICGOL 1 S9Faldor0
	== FALDOJ IF ~IsValidForPartyDialog("faldorn")~ THEN
	~<CHARNAME>, I don't have a problem when people get what they deserve when they disturb the natural order.  I do suppose it might be worthwhile to investigate this issue to discover if someone has been interfering with nature.~
	END S9MAGSTI 5

//GARRICK	
INTERJECT S9MARTHA 0 S9Garrij0
  == GARRIJ IF ~IsValidForPartyDialog("garrick")~ THEN
	~Restoring a nobleman's honor would be a wonderful opportunity for adventure.  This could be a glorious tale for the ages!~
	END ~S9OTI~ 0

//SHARTEEL
INTERJECT S9DURIN 1 S9Sharted0
  == SHARTJ IF ~IsValidForPartyDialog("sharteel")~ THEN
	~Weaklings! They already admitted it in the first few words they blurted out: MEN need ASSISTANCE.  We should ignore these fools.~
	END ~ZANKAS~ 1

// Coran
INTERJECT S9OTI 0 S9Coran0
  == CORANJ IF ~IsValidForPartyDialog("coran")~ THEN
	~A wise man once told me something that changed my life forever, <CHARNAME>.  He explained that you can't live without a little adventure.  I just wanted to share that.~
END ~S9MARTHA~ 1

INTERJECT S9ZANKAS 2 S9Coran1
  == CORANJ IF ~IsValidForPartyDialog("coran")~ THEN
	~Siren's are not foes to be underestimated.  It is a trap that they can take on the appearance of beautiful women.~
END ~S9DURIN~ 3

// Eldoth
INTERJECT S9MARTHA 3 S9eldoth0
  == ELDOTJ IF ~IsValidForPartyDialog("coran")~ THEN
	~There may be profit in this venture, <CHARNAME>.  I want to hear more about the vast inheritance that was just mentioned.~
END ~S9OTI~ 1

// Khalid
INTERJECT S9ZANKAS 1 S9khalid0
  == KHALIJ IF ~IsValidForPartyDialog("khalid")~ THEN
	~T-this s-sounds scary!  Normally danger doesn't b-bother me but s-sirens?  Come on now, what's are we going to fight a pack of werewolves?!~
END ~S9DURIN~ 2

// Kivan
INTERJECT S9MAGSTI 3 S9kivan0
	== KIVANJ IF ~IsValidForPartyDialog("kivan")~ THEN
	~Spiders.  Why does it have to be spiders?  I am more interested in bandits than spiders.  I suppose this is a noble cause though.~
END ~S9VICGOL~ 1
	
// Viconia 
INTERJECT S9KEVIAN 2 S9viconia0
  == %VICONIA_JOINED% IF ~IsValidForPartyDialog("viconia")~ THEN
	~Jal khaless zah waela.  These men should not be trusted.~
END ~S9WALORI~ 6

// Yeslick
INTERJECT S9WALORI 3 S9yeslick0
  == YESLIJ IF ~IsValidForPartyDialog("yeslick")~ THEN
	~I wonder what these people are going to tell us about.  It may be important.~
END ~S9KEVIAN~ 1

INTERJECT S9DURIN 2 S9yeslick1
  == YESLIJ IF ~IsValidForPartyDialog("yeslick")~ THEN
	~I was recently a prisoner myself. <CHARNAME>, this is a wrong that should be made right.~
END ~S9ZANKAS~ 2
