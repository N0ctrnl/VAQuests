sub EVENT_SAY {
  if ($text=~/Hail/i){
    quest::say("Hello there. The spires are undergoing maintenance. If you would like to [" . quest::saylink("travel to Faydark") . "], I will be happy to send you on your way!");
  }
  elsif ($text=~/travel to Faydark/i){
    quest::movepc(54,-427.31,-2008.34,1.05);
  }
}
