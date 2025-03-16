############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 29,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Lich_Lucan_D`Lere
# ID: 9147
# TYPE: Shadowknight
# RACE: Skeleton
# LEVEL: 53
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
#
# *** QUESTS INVOLVED IN ***
#
#1 - Testimony of Truth
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Paladin
#
# *** NPC NOTES ***
#
# Undead version of Sir_Lucan_D-Lere.
#
############################################

sub EVENT_SPAWN {
	quest::shout("PREPARE YOURSELF FOR ETERNAL DAMNATION, MORTAL!!  DEATH INCARNATE SHALL FEED THIS DAY!!");
}

sub EVENT_DEATH {
	quest::say("... I shall see you in ... hell");
	quest::emote("turns into a puddle of goo.");
}


#END of FILE Zone:freportw  ID:9018 -- Sir_Lucan_D`Lere
