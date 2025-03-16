sub EVENT_SAY {
  if($text=~/Hail/i){
      plugin::Whisper("Greetings, $name. I am Collector Dannel. I am searching for tokens commemorating the first year of the Vegarlson Asylum server. If you happen to find any, please bring then to me. I will reward you based on the quality of the token. Good luck!");
  }
}

sub EVENT_ITEM {
  $random_result = 0;
  my $random_result = int(rand(5000));
    
  # Buff Crystal - 0-4500
  if(plugin::check_handin(\%itemcount, 150003 => 1) || plugin::check_handin(\%itemcount, 150004 => 1) || plugin::check_handin(\%itemcount, 150005 => 1) && $random_result<4500){
    quest::summonitem(150000,10);
  }
  # Illusions - 3001-4700
  elsif(plugin::check_handin(\%itemcount, 150003 => 1) || plugin::check_handin(\%itemcount, 150004 => 1) || plugin::check_handin(\%itemcount, 150005 => 1) && $random_result>4500 && $random_result<4951){
    quest::summonitem(quest::ChooseRandom(40612,40613,40684,40685,40714,40746,40778,40779,43971,43972,54833,54913,40638));
    plugin::Whisper("This token is in fine shape. Use this item to mask your appearance.");
}
# Legacy Items - 4700-5000
# Locket of Escape,
# Circlet of Shadow
# Guise of the Deceiver
# Runed Fighter's Staff
# Holgresh Elder Beads
  elsif(plugin::check_handin(\%itemcount, 150003 => 1) || plugin::check_handin(\%itemcount, 150004 => 1) || plugin::check_handin(\%itemcount, 150005 => 1) && $random_result>4950 && $random_result<5001){
    quest::summonitem(quest::ChooseRandom(14727,14730,2469,6630,24890));
    plugin::Whisper("This token is in fantastic condition! Here's something from my private stock!");
  }
  plugin::return_items(\%itemcount);
}
