# items: 6378
sub EVENT_SAY {
  if($text=~/hail/i && $faction <= 5) {
    quest::say("Uggg. You needz [" . quest::saylink("I need keyz",0,"keyz") . "]? Rrrrrrr.");
  }
  if($text=~/key/i && $faction <= 5) {
    quest::say("Uggggg. Take dis keyz.");
    quest::summonitem(6378); # Item: Bone Crafted Key
  }
}

#END of FILE Zone:paineel  ID:2308 -- Guard_Menbuknar
