sub EVENT_SAY {
  if ($text=~/Hail/i){
  quest::say("Hello there. The spires are undergoing maintenance. If you would like to [" . quest::saylink("travel to North Karana") . "], I will be happy to send you on your way!");  }
  elsif ($text=~/travel to North Karana/i){
    quest::movepc(13,1209,-3685,-5); # Zone: northkarana
  }
}
