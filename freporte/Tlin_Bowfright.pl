#Tlin despawn after 5min
# After hailing the NPC timer 1 is set to run for 3 minutes (180 seconds)
sub EVENT_SPAWN
{
quest::settimer(1,300);
}
sub EVENT_TIMER
{
if($timer == 1){
quest::depop();
}
}