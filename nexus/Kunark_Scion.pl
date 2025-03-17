sub EVENT_SAY {
if ($text=~/Hail/i){
  quest::say("Hello there. The spires are undergoing maintenance. If you would like to [" . quest::saylink("travel to Dreadlands") . "], I will be happy to send you on your way!");}
if ($text=~/travel to dreadlands/i){
  quest::movepc(86,9660.55,3019.32,1049.85);
}
}
