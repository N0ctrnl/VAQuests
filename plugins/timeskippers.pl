#!/usr/bin/perl

sub timerskipper_say {
  my $text = shift;
  my $client = plugin::val('$client');
  my $name = $client->GetName();

  if ($text=~/hail/i) {
	quest::say("Greetings, ${name}! I have been sent back through time to prepare you. If you would like to see [" . quest::saylink("what the future holds") . "] for this zone, just say so.");
  }
  elsif ($text=~/what the future holds/i) {
    if ($zoneid == 81){
      quest::doanim(42);
	  quest::say("Off you go!");
	  quest::MovePCInstance(81, 2, 2965, 3275, 345, 0)
	}
  }
}
