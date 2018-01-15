##Event_Burning_Control.pl
#Trial of Flame
#Kilelen

sub EVENT_SIGNAL {
	if ($signal == 1) {
		#Signal to start the AEs a'roastin, the spawns a'spawnin
		#First AE after 30 seconds
		quest::settimer("flame_dd", 30);
		quest::settimer("flame_wave1", 90);
	}
	
	elsif ($signal == 2) {
		#It's over, one way or another.
		quest::stoptimer("flame_dd");
		quest::stoptimer("flame_dot");
		quest::stoptimer("flame_wave1");
		quest::stoptimer("flame_wave2");
		quest::stoptimer("flame_wave3");
		quest::stoptimer("flame_wave4");
		quest::stoptimer("flame_boss");
		quest::settimer("flame_reset", 300);
		quest::signalwith(201420, 1, 5);
		quest::signalwith(201447, 1, 5);
		quest::signalwith(201446, 1, 5);
#		quest::signalwith(201434, 0, 5);
	}
}

sub EVENT_TIMER {
	if ($timer eq "flame_dd") {
		quest::stoptimer("flame_dd");
		#AE Fiery Death
		$npc->CastSpell(951, 201417);
		#Timer for next AE
		quest::settimer("flame_dot", 30);
	}
	
	elsif ($timer eq "flame_dot") {
		quest::stoptimer("flame_dot");
		#AE Wave of Heat, DoT version
		$npc->CastSpell(1131, 201417);
		#Timer for next AE
		quest::settimer("flame_dd", 30);
	}
	
	elsif ($timer eq "flame_wave1") {
		quest::stoptimer("flame_wave1");
		SpawnFlameMobs();
		quest::settimer("flame_wave2", 90);
	}
	
	elsif ($timer eq "flame_wave2") {
		quest::stoptimer("flame_wave2");
		SpawnFlameMobs();
		quest::settimer("flame_wave3", 90);
	}
	
	elsif ($timer eq "flame_wave3") {
		quest::stoptimer("flame_wave3");
		SpawnFlameMobs();
		quest::settimer("flame_wave4", 90);
	}
	
	elsif ($timer eq "flame_wave4") {
		quest::stoptimer("flame_wave4");
		SpawnFlameMobs();
		quest::settimer("flame_boss", 90);
	}
	
	elsif ($timer eq "flame_boss") {
		quest::stoptimer("flame_boss");
		#Punisher of Flame, the boss.
		quest::spawn2(201446,0,0,880,-805,55,0);
	}
	elsif ($timer eq "flame_reset") {
		quest::stoptimer("flame_reset");
		if ($ent->CalculateDistance($npc->GetX(),$npc->GetY(),$npc->GetZ()) <= 100) {
                	$ent->MovePC(207,456,825,7,253.2);
		}
		quest::settimer("flame_reset2", 30);
	}
	elsif ($timer eq "flame_reset2") {
		quest::stoptimer("flame_reset2");
		if ($ent->CalculateDistance($npc->GetX(),$npc->GetY(),$npc->GetZ()) <= 100) {
                	$ent->MovePC(207,456,825,7,253.2);
		}
		quest::signalwith(201434, 0, 5);
		HandleCorpses();
		quest::depop();
	}
}

sub SpawnFlameMobs {
	#For our loop
	my $count = 1;
	
	#Locations to spawn mobs at
	my @locX = qw(880 811 880 953);
	my @locY = qw(-800 -730 -653 -730);
	my @locZ = qw(60 60 60 60);
	my @locH = qw(0 190 128 64);
	
	#Loop and spawn, baby.
	for ($count = 0; $count <= 3; $count++) {
		my $test = rand(99);
		
		if ($test < 69) {
			#Fiery Agressor, common mob
			quest::spawn2(201420, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
		}
		
		else {
			#Burning nemesis, less common
			quest::spawn2(201447, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
		}
	}
}

sub HandleCorpses {

   if ($move_client_corpses) {
      #Move player corpses to graveyard
      @clist = $entity_list->GetCorpseList();
      foreach $ent (@clist) {
         if ($ent->IsPlayerCorpse()) {
            if ($ent->CalculateDistance(880, -729, 55) < 120) {
               $ent->GMMove(58, -47, 2);
            }
         }
      }
   }

   #Delete npc corpses left in trial area
   foreach $id (@mob_ids) {
      $corpse_id = $entity_list->GetCorpseByID($id);
      if (defined $corpse_id) {
         if ($corpse_id->CalculateDistance(880, -729, 55) < 120) {
            $corpse_id->Delete();
         }
      }
   }

   #Clear list
   @mob_ids = ();
}
