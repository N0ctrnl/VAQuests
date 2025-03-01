############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 17,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Tovan_Tenlah
# ID: 10154
# TYPE: Rogue Guild Master
# RACE: Half Elf
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Bundle of Hardwood Staves ID- 19931
# Crate of Pick Heads ID- MISSING
# Faceted Blue Gem ID-19919
# Dull Coalition Dirk ID-19920
# A Sealed Letter ID- 12270 (Not the Correct note but it will do)
# Bent Playing Card ID-13903 (Not the Correct card but it will do)
#
# *** QUESTS INVOLVED IN ***
#
#1 - Coalition Trader Card
#2 - Coalition Trader Next Task
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Rogue
#2 - Rogue
#
# *** NPC NOTES ***
#
# Minor Edit to the quest due to Non Created Orc Mob (Wasn't really needed anyways.)
#
############################################

######## EVENT_SAY AREA ####################
### Called when the NPC is spoken to by a PC

sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
   quest::say("I suppose you're one of Nestrals new employees, eh? Well if that's the case I can help get you outfitted with some [gear] necessary for people in this [line of work].");
   }

   if($text=~/gear/i)
   {
   quest::say("The first thing you need is a suit of sturdy traders clothing. Take this note to Verona Rankin and she'll help you with a suit tailored to your needs. Once you have been outfitted in your traders clothing return to me and I will inform you of your [next task].");
   # A Sealed Letter ID- 12270 (Not the Correct note but it will do)
   quest::summonitem("12270");
   }

    if($text=~/next task/i)
   {
   quest::say("Ready to get to work are you? Listen carefully. Outside Freeports South gate you will find one of our employees, Rigg Nostra, who is acting as an intermediary between the Coalition of Tradefolk and some recently acquired business associates. Give him this card so he knows I've sent you and he will give you further instructions. Do not mention any of our names in public. The Freeport Militia would likely impose high taxes on the Coalition if they found out about the goods being exchanged to us by our new associates.");
   # Bent Playing Card ID-13903 (Not the Correct card but it will do)
   quest::summonitem("13903");
   }

}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM {

   # Bundle of Hardwood Staves ID- 19931 -  # Crate of Pick Heads ID- MISSING
   if(plugin::check_handin(\%itemcount, 19931 => 1, 19929 => 1)) {
     quest::ding();
     quest::say("Sharpen this dagger and take it with this gem and a rattlesnake skin to Verona Rankin.");
     quest::exp("100");
     # Faceted Blue Gem ID-19919
     quest::summonitem("19919");
     # Dull Coalition Dirk ID-19920
     quest::summonitem("19920");
	} else {
		plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
		plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:freporte  ID:10154 -- Tovan_Tenlah