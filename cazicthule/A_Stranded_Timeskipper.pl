sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, ${name}! I have been sent back through time to prepare you. If you would like to see [" . quest::saylink("what the future holds") . "] for this zone, just say so.");
  }
  elsif ($text=~/what the future holds/i) {
    if ($zoneid == 48){
      quest::doanim(42);
      quest::say("Off you go!");
      quest::MovePCInstance(48, 3, -70.72, 48.84, 3.75, 10.25)
    }
  }
}
