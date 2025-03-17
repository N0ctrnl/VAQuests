sub EVENT_SAY {
  if ($text=~/Hail/i){
    quest::say("Hello there. The spires are undergoing maintenance. If you would like to [" . quest::saylink("travel to Toxxulia Forest") . "], I will be happy to send you on your way!");
  }
  # Old Tox - Ender
  if ($text=~/travel to Tox/i){
    quest::movepc(38,-872.35,-1514.85,-34.51);
  }
  # New Toxxulia - Ender
  #if ($text=~/travel to Toxxulia Forest/i){quest::movepc(414,-1657,-1501,69.54); }
}
