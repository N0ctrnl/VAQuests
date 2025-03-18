sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, ${name}! If you wish, I can send you to a much different and more difficult version of this zone. Just [" . quest::saylink("say the word") . !"]");
  }
  elsif ($text=~/say the word/i) {
    # The Hole 238.5
    if ($zoneid == 39){
      quest::doanim(42);
      quest::say("Off you go!");
      quest::MovePCInstance(39, 4, -1050, 640, -77, 238.5)
    }
    # The Feerrott
    if ($zoneid == 47){
      quest::doanim(42);
      quest::say("Off you go!");
      quest::MovePCInstance(47, , , , , )
    }
    # Cazic-Thule
    if ($zoneid == 48){
      quest::doanim(42);
      quest::say("Off you go!");
      quest::MovePCInstance(48, 3, -70.72, 48.84, 3.75, 10.25)
    }
    # Temple of Droga
    elsif ($zoneid == 81){
      quest::doanim(42);
      quest::say("Off you go!");
      quest::MovePCInstance(81, 2, 376, 1412, 4, 300)
    }
    # Nurga
    if ($zoneid == 107){
      quest::doanim(42);
      quest::say("Off you go!");
      quest::MovePCInstance(107, , , , , )
    }
    # Necropolis
    if ($zoneid == 123){
      quest::doanim(42);
      quest::say("Off you go!");
      quest::MovePCInstance(123, , , , , )
    }
    # Siren's Grotto
    if ($zoneid == 125){
      quest::doanim(42);
      quest::say("Off you go!");
      quest::MovePCInstance(125, , , , , )
    }
    # Sleeper's Tomb
    if ($zoneid == 128){
      quest::doanim(42);
      quest::say("Off you go!");
      quest::MovePCInstance(128, , , , , )
    }
  }
}
