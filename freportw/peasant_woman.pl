#mob: peasant_woman
#zone: west freeport
#paladin epic sub-quest

sub EVENT_SAY  { 
	if($text=~/Hail/i) {
		quest::emote("grunts as she tries to fill two buckets of water. Her frail arms strain at her work and pain fills her eyes with tears.");
	}
	if($text=~/water/i) {
		quest::say("Aye, water, m'lord. For my brother. He is very sick. He's needin' drink. Hes burnin' up. I am sick myself but still able to move, a little. I must get this water to him before he gets worse.");
	}
	if($text=~/take it/i) {
		quest::emote("looks at you. 'Surely you are a pure soul. If you would take this bucket of water to my brother, I would be forever grateful. I'm just so tired, I need to rest...' She slumps to the floor and begins to breathe shallowly, in short, harsh gasps.");
		quest::summonitem(29008); #Bucket of Water
	}
}
