# Groflah_Steadirt - freportn - Soulfire Quest
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, adventurer! Certainly a person who looks as hardened as yourself deserves a fine blade to match your prowess. Here at Groflah's Forge, we supply you with only the finest quality weapons");
}
if($text=~/Ariska/i){
	quest::say("Zimel!! I do not know who you mean. Now go away. I am very busy. I will not talk here!!");
}
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 18818 => 1)){
	 quest::say("Where did you find this? This was the main price list of Zimel's Blades, but it should be all burnt up. I was at Zimel's right after the fire and I did not see it hanging where it should have been. The entire inside was gutted and . . . wait . . . the sequence of the dots!! Hmmm. I cannot talk with you here. Meet me at the Seafarer's by the docks at night. Give me the note when next we meet.");
	 quest::summonitem("18818");
}
  plugin::return_items(\%itemcount);
}
