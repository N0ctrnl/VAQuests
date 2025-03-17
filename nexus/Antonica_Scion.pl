sub EVENT_SAY {
  if ($text=~/Hail/i){
    quest::say("Hello there. The spires are undergoing maintenance. If you need to know more about [" . quest::saylink("travel to North Karana") . "], I can help you with this.");
  }
  elsif ($text=~/travel to North Karana/i){
    quest::movepc(13,1209,-3685,-5); # Zone: northkarana
  }
}
