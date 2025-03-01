#a_prisoner in freportw For Soulfire quest
sub EVENT_SAY {
if ($text =~/Hail/i) {  quest::say ("Aaaarghhh!!.. Buggl n gump.. Figgle and fump..");  }
if ($text =~/Zimel/i) {  quest::emote ("stares deeply into your eyes.. Very eerie!!");  }
              }

sub EVENT_ITEM
 {
  if  (plugin::check_handin(\%itemcount, 12196 => 1, 13498 => 1, 16581 => 1))
     {
    quest::say("Bog n Goo.. Blanket too!!");
    quest::emote("hands you something and says, 'Hide, hide, safe, cee.. lerk has the clue.. Must travel.. Travel.. Travel.. Tunaria's corridor..'");
    quest::summonitem(12143);  #H. K.  102
     }
   plugin::return_items(\%itemcount);
  }