# Rogue Epic NPC -- #War_Priestess_T`zan

sub EVENT_SAY {
  quest::emote("ignores you.");
}

sub EVENT_ITEM {

  if(plugin::check_handin(\%itemcount, 28057 => 1)) {

    quest::say("The General will take care of you!");

    quest::ding();

    quest::exp(500);

    quest::spawn2(20205,0,0,2316,797,275,387);
 }

  plugin::return_items(\%itemcount);

}



#END of FILE  Quest by: Solid11  Zone:kithicor  ID:20064 -- #War_Priestess_T`zan



