#Spawns Vulak if no boss mobs are up. 
my $check = 0;

sub EVENT_SPAWN {  
$check = 0;
quest::settimer("vulak",60);
quest::depopall(124021);
quest::depopall(124080);
quest::depopall(124157);
quest::spawn2(124021,0,0,-796,564,129,204);
quest::spawn2(124021,0,0,-800,510,129,132);
quest::spawn2(124021,0,0,-796,463,129,66);
quest::spawn2(124080,0,0,-680,509,129,380);
quest::spawn2(124080,0,0,-687,562,129,320);
quest::spawn2(124080,0,0,-680,461,129,448);
}

sub EVENT_TIMER {
my $variance = int(rand(720));
my $spawntime = 4320 + $variance;
$check = 0;
  if($timer eq "vulak") {
    $check_boss = $entity_list->GetMobByNpcTypeID(124077);#Lady_Mirenilla
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(124076);#Lady_Nevederia
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(124008);#Lord_Feshlak
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(124010);#Aaryonar
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(124074);#Lord_Kreizenn
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(124017);#Lord_Vyemm
    if ($check_boss) {
      $check = 1
    }
    if ($check == 1) {
    } 
    if ($check == 0 && $entity_list->IsMobSpawnedByNpcTypeID(124155)) {
    }
    elsif ($check == 0 && !defined $qglobals{vulak}) {
      quest::spawn2(124155,0,0,-739.4,517.2,121,510);
      quest::depop_withtimer();
      quest::setglobal("vulak",1,2,"M$spawntime");
    }
  }
 $qglobals{vulak} = undef;
}      

#EOF
