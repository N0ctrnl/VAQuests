#mob: Joshua
#zone: east freeport
#paladin epic sub-quest

sub EVENT_ITEM {
	#Bucket of Water
	if ($itemcount{29008} == 1) {
		quest::emote("Joshua dips his emaciated hand into the bucket and brings the water to his mouth. As he does, you hear a soft thump from outside and notice that through the window his sister has collapsed. A glimmer enfolds her body, and you notice the water in Joshua's hand gleam a pure, bright light for a moment. 'Thank you, sir. I hope my sister returns soon. I feel better for some reason.'");
		quest::summonitem(29009); #Bucket of Pure Water
	}
}