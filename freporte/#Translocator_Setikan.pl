sub EVENT_SAY {
	if($text=~/Hail/i) {
		quest::say("Hello there. There seem to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to travel to the [Ocean of Tears] in the meantime, I can transport you to my companion there.");
	}
	if($text=~/Ocean of Tears/i){
		quest::say("On your way");
		quest::movepc(69, -9000, 459, 14);
	}
}