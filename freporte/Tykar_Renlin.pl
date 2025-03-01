#Multiple item turn in And a reward issued
sub EVENT_SAY {
if ($text =~/Hail/i) {  quest::say ("Do you have any spare coppers for a thirsty soul?");  }
if ($text =~/Zimel/i) {  quest::say ("What?! You know my friend Zimel?! I would like to speak of him, but my mouth is so parched. Maybe a fine grog would loosen my lips. I am uncertain which flavor shall do the trick.");  }
              }

sub EVENT_ITEM
 {
  if  (plugin::check_handin(\%itemcount, 13829 => 4))
     {
    quest::emote("scurries to quickly drink one of the champagne bottles.");
    quest::say("Ahh!! That was good. Now where were we?. Oh yes. My friend Zimel is a fellow beggar. He was locked up in the arena. They were going to let him go when the Freeport Militia came for him. Ha!! He is crazy as a troll now. I took this blanket from his cell before I was released. I no longer need it and my guilt has reached its peak. I do not want crazy old Zimel to freeze. Perhaps you can return it to him.");
    quest::summonitem(12196);  #Bunker Cell #1
     }
  plugin::return_items(\%itemcount);
 }
sub EVENT_SPAWN
{
quest::settimer(1,300);
}
sub EVENT_TIMER
{
if($timer == 1){
quest::depop();
}
}
