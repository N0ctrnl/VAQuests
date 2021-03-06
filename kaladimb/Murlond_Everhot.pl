sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, friend! I am Murlond, crafter of the strongest steel and [" . quest::saylink("What are brellium weapons?",0,"brellium weapons") . "]!");
  }
  if ($text=~/brellium weapons/i) {
    quest::say("Brellium is an ore that is mined here in Kaladim! It can only be worked in the unique Stormguard forge! If ye're lookin' ta craft a brellium battle axe or battle hammer, ye'll need a mold for the head of the weapon, an oak shaft for the handle, some earthen temper, and either a sheet of brellium fer the battle hammer or a folded sheet of brellium fer the battle axe. If ye are in favor with the clerics of Underfoot, perhaps ye can convince one of them to assist ye in the crafting of [" . quest::saylink("What imbued weapons?",0,"imbued weapons") . "].");
  }
  if ($text=~/imbued weapons/i) {
    quest::say("Imbued battle axes of Brell, and imbued battle hammers of Brell are crafted in the same fashion as yer standard brellium weapon, only ye must forge a ruby that has been imbued by a cleric into the weapon at the time of its creation.");
  }
}
#END of FILE Zone:kaladimb  ID:67046 -- Murlond_Everhot
