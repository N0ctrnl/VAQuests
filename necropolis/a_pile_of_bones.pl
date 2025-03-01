sub EVENT_SPAWN {
  quest::set_proximity(0,20,0,20,0,20);
}
sub EVENT_ENTER {
	#sub EVENT_COMBAT {
	quest::depop_withtimer();
        quest::spawn2(123397,0,0,$x,$y,$z,$h);
}
