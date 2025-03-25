# VA Buff Crystal
# Written by N0ctrnl (2016)
# Updated 9/4/2023

#my @indoor_zones = (18,31,32,36,39,40,41,42,44,64,65,66,73,80,81,88,89,97,101,103,104,105,107,108,109,111,112,113,121,123,124,125,128,150,151,153,154,156,157,158,161,162,164,179,200,212,214,216,226,227,228,229,230,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278);
#my @no_levitate_zones = (39,71,109,112,124,125,158,159,160,163,164,179,223,227,231,239,242,251,273);

sub EVENT_SPELL_EFFECT_CLIENT {
  my @groupMembers;
  if($client->IsGrouped()){
    for($count = 0; $count < 6; $count++){
      my $cur = $client->GetGroup()->GetMember($count);
      if($cur){
        if($cur->IsClient()){
          push @groupMembers, $cur;
        }
      }
    }
  } else {
    push @groupMembers, $client;
  }
BuffMembers(\@groupMembers);
}

sub BuffMembers{
  my $members = shift;
  my %buffBot;
  my @indoor_zones = (18,31,32,36,39,40,41,42,44,64,65,66,73,80,81,88,89,97,101,103,104,105,107,108,109,111,112,113,121,123,124,125,128,150,151,153,154,156,157,158,161,162,164,179,200,212,214,216,226,227,228,229,230,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278);
  my @no_levitate_zones = (39,71,109,112,124,125,158,159,160,163,164,179,223,227,231,239,242,251,273);

  # Levels 1 to 35
  $buffBot{"tier1"}{Cleric}{HP} = 41846;                        #Valor / 32
  $buffBot{"tier1"}{Cleric}{SpellHaste} = 41863;                #Blessing of Faith / 35
  $buffBot{"tier1"}{Druid}{HPRegen} = 41841;            #Regeneration / 34
  if($zoneid ~~ @indoor_zones){
    $buffBot{"tier1"}{Druid}{RunSpeed} = 41865;         #Spirit of the Shrew / 10
  } else {
    $buffBot{"tier1"}{Druid}{RunSpeed} = 41866;         #Spirit of Wolf / 10
  }
  $buffBot{"tier1"}{Enchanter}{ManaRegen} = 41845;              #Clarity / 26
  $buffBot{"tier1"}{Enchanter}{MeleeHaste} = 41840;             #Augmentation / 28
  $buffBot{"tier1"}{Magician}{DamageShield} = 41848;    #Inferno Shield / 28
  if( not $zoneid ~~ @no_levitate_zones){
    $buffBot{"tier1"}{Magician}{Levitation} = 41849;    #Levitation
  }
  $buffBot{"tier1"}{Shaman}{HP} = 41843;                        #Talisman of Tnarg / 32

  # Levels 36 to 65
  $buffBot{"tier2"}{Cleric}{HP} = 41864;                        #Temperence / 40 (Was Heroism)
  $buffBot{"tier2"}{Cleric}{SpellHaste} = 41863;                #Blessing of Faith / 35
  $buffBot{"tier2"}{Druid}{HPRegen} = 41842;            #Chloroplast / 42
  if($zoneid ~~ @indoor_zones){
    $buffBot{"tier2"}{Druid}{RunSpeed} = 41865;         #Spirit of the Shrew / 10
  } else {
    $buffBot{"tier2"}{Druid}{RunSpeed} = 41866;         #Spirit of Wolf / 10
  }
  #  $buffBot{"tier2"}{Enchanter}{ManaRegen} = 49013;           #Clarity II / 52
  $buffBot{"tier2"}{Enchanter}{ManaRegen} = 41854;              #Boon of the Clear Mind / 42
  $buffBot{"tier2"}{Enchanter}{MeleeHaste} = 41855;     #Aanya's Quickening / 53
  $buffBot{"tier2"}{Enchanter}{MeleeHaste} = 41844;     #Swift Like the Wind / 47
  $buffBot{"tier2"}{Magician}{DamageShield} = 41847;    #Shield of Lava / 45
  $buffBot{"tier2"}{Magician}{Levitation} = 41849;      #Levitation
  #  $buffBot{"tier2"}{Shaman}{HP} = 1585;                      #Talisman of Kragg / 55
  $buffBot{"tier2"}{Shaman}{HP} = 41857;                        #Harnessing of Spirit / 46

  # Levels 60 to 65
  $buffBot{"tier3"}{Cleric}{HP} = 41850;                        #Aegolism / 60
  $buffBot{"tier3"}{Cleric}{SpellHaste} = 41862;                #Blessing of Reverence / 62
  $buffBot{"tier3"}{Druid}{HPRegen} = 41851;            #Regrowth
  if($zoneid ~~ @indoor_zones){
    $buffBot{"tier3"}{Druid}{RunSpeed} = 41865;         #Spirit of the Shrew / 10
    if( not $zoneid ~~ @no_levitate_zones){
      $buffBot{"tier3"}{Magician}{Levitation} = 41849;  #Levitation
    }
  } elsif (( not $zoneid ~~ @indoor_zones) && ( not $zoneid ~~ @no_levitate_zones)) {
    $buffBot{"tier3"}{Druid}{RunSpeed} = 41856;         #Spirit of Eagle
  }
  $buffBot{"tier3"}{Enchanter}{ManaRegen} = 41858;      #Koadic's Endless Intellect / 60
  $buffBot{"tier3"}{Enchanter}{MeleeHaste} = 41860;     #Speed of Vallon / 62
  $buffBot{"tier3"}{Magician}{DamageShield} = 41861;    #Shield of Bracken / 63
  $buffBot{"tier3"}{Shaman}{HP} = 41859;                        #Focus of Soul / 62

  # Levels 71 to 90
  $buffBot{"tier4"}{Cleric}{HP} = 41867;                        #Conviction / 67
  $buffBot{"tier4"}{Cleric}{SpellHaste} = 41868;                #Blessing of Devotion / 67
  $buffBot{"tier4"}{Druid}{HPRegen} = 41869;            #Oaken Vigor / 66
  $buffBot{"tier4"}{Druid}{RunSpeed} = 41866;           #Spirit of Wolf / 10
  $buffBot{"tier4"}{Enchanter}{ManaRegen} = 41870;              #Clairvoyance / 68
  $buffBot{"tier4"}{Enchanter}{MeleeHaste} = 41874;     #Speed of Salik / 67
  $buffBot{"tier4"}{Magician}{DamageShield} = 41873;    #Fireskin / 66
  $buffBot{"tier4"}{Shaman}{HP} = 41872;                        #Wunshi's Focusing / 68
  $buffBot{"tier4"}{Shaman}{MeleeDodge} = 41871;                #Spirit of Sense / 66
  $buffBot{"tier4"}{Shaman}{MeleeProc} = 41875;         #Spirit of the Panther / 69

  foreach my $member (@{$members}){

  # Example from old
  # quest::castspell(2886, $client->GetID());

  my $clientLevel = $member->GetLevel();
    if($clientLevel >= 1 && $clientLevel <= 35){
      quest::debug($clientLevel);
      my $tier = "tier1";
      $member->SpellFinished($buffBot{$tier}{Cleric}{HP}, $member, 100);
      #quest::castspell($buffBot{$tier}{Cleric}{HP}, $member);
      #      quest::castspell(312, $member);
      #   quest::castspell(2570, $client->GetID());

      $client->SpellFinished($buffBot{$tier}{Cleric}{SpellHaste}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Druid}{HPRegen}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Druid}{RunSpeed}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Enchanter}{MeleeHaste}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Enchanter}{ManaRegen}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Magician}{DamageShield}, $member, 0);
      if( not $zoneid ~~ @no_levitate_zones){
        $client->SpellFinished($buffBot{$tier}{Magician}{Levitation}, $member, 0);
      }
      $client->SpellFinished($buffBot{$tier}{Shaman}{HP}, $member, 0);
    } elsif($clientLevel >= 36 && $clientLevel <= 45) {
      my $tier = "tier2";
      $client->SpellFinished($buffBot{$tier}{Cleric}{HP}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Cleric}{SpellHaste}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Druid}{HPRegen}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Druid}{RunSpeed}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Enchanter}{ManaRegen}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Enchanter}{MeleeHaste}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Magician}{DamageShield}, $member, 0);
      if( not $zoneid ~~ @no_levitate_zones){
        $client->SpellFinished($buffBot{$tier}{Magician}{Levitation}, $member, 0);
      }
      $client->SpellFinished($buffBot{$tier}{Shaman}{HP}, $member, 0);
    } elsif($clientLevel >= 46 && $clientLevel <= 59) {
      my $tier = "tier3";
      $client->SpellFinished($buffBot{$tier}{Cleric}{HP}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Cleric}{SpellHaste}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Druid}{HPRegen}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Druid}{RunSpeed}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Enchanter}{ManaRegen}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Enchanter}{MeleeHaste}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Magician}{DamageShield}, $member, 0);
      if( not $zoneid ~~ @no_levitate_zones){
        $client->SpellFinished($buffBot{$tier}{Magician}{Levitation}, $member, 0);
      }
      $client->SpellFinished($buffBot{$tier}{Shaman}{HP}, $member, 0);
    } elsif($clientLevel >= 60 && $clientLevel <= 70) {
      my $tier = "tier4";
      $client->SpellFinished($buffBot{$tier}{Cleric}{HP}, $member, 0);
      #$client->ApplySpell($buffBot{$tier}{Cleric}{HP}, -2);
      #$client->SetSpellDuration(5257, 999);
      $client->SpellFinished($buffBot{$tier}{Cleric}{SpellHaste}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Druid}{HPRegen}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Druid}{RunSpeed}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Enchanter}{ManaRegen}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Enchanter}{MeleeHaste}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Magician}{DamageShield}, $member, 0);
      if( not $zoneid ~~ @no_levitate_zones){
        $client->SpellFinished($buffBot{$tier}{Magician}{Levitation}, $member, 0);
      }
      $client->SpellFinished($buffBot{$tier}{Shaman}{HP}, $member, 0);
    } elsif($clientLevel >= 71 && $clientLevel <= 90) {
      my $tier = "tier4";
      $client->SpellFinished($buffBot{$tier}{Cleric}{HP}, $member, 0);
      $client->SetSpellDuration(5257, 999);
      $client->SpellFinished($buffBot{$tier}{Cleric}{SpellHaste}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Druid}{HPRegen}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Druid}{RunSpeed}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Enchanter}{ManaRegen}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Enchanter}{MeleeHaste}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Magician}{DamageShield}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Shaman}{HP}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Shaman}{MeleeDodge}, $member, 0);
      $client->SpellFinished($buffBot{$tier}{Shaman}{MeleeProc}, $member, 0);
    }
  }
}