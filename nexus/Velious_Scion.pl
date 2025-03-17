sub EVENT_SAY { 
  if ($text=~/Hail/i){
    quest::say("Hello there. The spires are undergoing maintenance. If you would like to [" . quest::saylink("travel to The Great Divide") . "], I will be happy to send you on your way!");  }
  elsif ($text=~/the great divide/i){
    quest::movepc(118,-2683.82,-1892.07,-45.08);
  }
}