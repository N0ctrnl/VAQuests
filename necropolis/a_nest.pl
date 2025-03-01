sub EVENT_SPAWN {
  quest::set_proximity(0,20,0,20,0,20);
}
sub EVENT_ENTER {
  quest::spawn2(123432,0,0,$x,$y,$z,$h);
  quest::spawn2(123432,0,0,$x-2,$y,$z,$h);
  quest::spawn2(123432,0,0,$x+2,$y,$z,$h);
  quest::spawn2(123432,0,0,$x,$y-2,$z,$h);
  quest::spawn2(123432,0,0,$x,$y+2,$z,$h);
  quest::spawn2(123432,0,0,$x+1,$y+1,$z,$h);
  quest::depop_withtimer();
}
