sub EVENT_SAY {
  if ($text=~/Hail/i){
    quest::say("Hello there. The spires are undergoing maintenance. If you need to know more about [" . quest::saylink("travel to faydark") . "], I can help you with this.");
  }
  elsif ($text=~/travel to Faydark/i){
    quest::movepc(54,-427.31,-2008.34,1.05);
  }
}
