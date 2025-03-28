sub EVENT_SAY {
  if($text=~/Hail/i){
    plugin::Whisper("Greetings, $name. I am Collector Dannel. I am searching for tokens commemorating the Vegarlson Asylum server. If you happen to find any, please bring then to me. I will reward you based on the quality of the token. Good luck!");
    plugin::Whisper("I also have a special inventory of large bags. If you find any bag tokens, bring me those as well!")
  }
}

sub EVENT_ITEM {
  $random_result = 0;
  my $random_result = int(rand(5000));

  # Common Reward - 0-4500
  ## Buff Crystals
  if(plugin::check_handin(\%itemcount, 150005 => 1)){
    if($random_result <= 4500){
      # Common Reward - 1-4500
      ## Buff Crystals
      quest::summonitem(150000,50);
      plugin::Whisper("Thank you! Here are some crystals you can use to fortify yourself for battle!");
    } elsif($random_result => 4501 && $random_result <= 4950){
      # Rare Reward - 4501-4950
      ## Illusions
      quest::summonitem(quest::ChooseRandom(40612,40613,40684,40685,40714,40746,40778,40779,43971,43972,54833,54913,40638));
      plugin::Whisper("This token is in fine shape. Use this item to mask your appearance.");
    } elsif($random_result => 4951 && $random_result <= 5000){
      # Legacy Items - 4700-5000
      ## Locket of Escape
      ## Circlet of Shadow
      ## Guise of the Deceiver
      ## Runed Fighter's Staff
      ## Holgresh Elder Beads
      quest::summonitem(quest::ChooseRandom(14727,14730,2469,6630,24890));
    }
  } elsif(plugin::check_handin(\%itemcount, 150021 => 1)){
    if($random_result <= 4200){
      # Common Reward - 1-4200
      ## 24-slot Packs
      quest::summonitem(quest::ChooseRandom(77404,81803));
      plugin::Whisper("Thank you so much! He's what I call a normal bag. I think you'll be impressed!");
    } elsif($random_result => 4201 && $random_result <= 4700){
      # Rare Reward - 4201-4700
      ## 32-slot Packs
      quest::summonitem(quest::ChooseRandom(77405,67633));
      plugin::Whisper("Thank you so much! He's what I call a medium bag. I think you'll be impressed!");
    } elsif($random_result => 4701 && $random_result <= 5000){
      # Ultra-Rare Reward - 4701-5000
      ## 40-slot Packs
      quest::summonitem(quest::ChooseRandom(139831,101686));
      plugin::Whisper("Thank you so much! He's what I call a large bag. I think you'll be impressed!");
    }
  }
  plugin::return_items(\%itemcount);
}