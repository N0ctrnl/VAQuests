# Kalatrina_Plossen - freportn - Soulfire Quest

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail!  Welcome to the Hall of Truth.  We. the Knights of Truth. are all the hope this city has of loosening the grip of Lucan D'lere and his militia.  I seek a young knight to [serve the will of the Truthbringer].");
}
if($text=~/serve the will of the truthbringer/i){
quest::say("Stand tall then, knight! We have need of your services. We have sent a man to infiltrate the militia. We fear he may soon be found out. Take him this note of warning. Say the words, 'Truth is good,' and you shall find him. Be careful, young knight. The militia does not take prisoners.");
quest::summonitem("18817"); }
if($text=~/what Zimel's Blades/i){
	quest::say("You need to speak to Rashinda about that.");
}
if($text=~/condemned/i){
	quest::say("Why would Lucan visit a condemned building? He must be searching for something. When I last visited the local forge, I heard rumors of Lucan searching for a sword named Soulfire. If this is true, you must find it first! No more power should go his way. Seek this sword out!");
}
}
sub EVENT_ITEM { 
 if(plugin::check_handin(\%itemcount, 18818 => 1)){
#	quest::faction("322","1");
#	quest::faction("304","-1");
#	quest::faction("10103","1");
	quest::summonitem("18818");
	quest::say("Zimel's Blades?! Hmmmmm. It doesn't ring a bell and the remainder of the writing is too hard to make out. It kind of looks like a list of prices. You know, down at the Office of the People they might be able to tell us if this place exists. Go speak with Rashinda. She knows all about Freeport. If [Zimel's Blades] existed, you must report back to me what happened to it.");
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:freportn  ID:8074 -- Kalatrina_Plossen 

