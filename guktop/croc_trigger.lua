local CrocUp = 0;

function event_spawn(e)
	croc_spawns();
end

function croc_spawns()
	local RandomCroc = eq.ChooseRandom(65068,65069,65094,65095,65134);
	local RandomNumber = 0;
	RandomNumber = math.random(100);
	
	if(RandomNumber <=30) then
		eq.spawn2(RandomCroc,0,0,470,1661,-70,132);
		CrocUp = 1;
	elseif(RandomNumber > 30 and RandomNumber <= 55) then
		eq.spawn2(RandomCroc,0,0,470,1661,-70,132);
		eq.spawn2(RandomCroc,0,0,462,1653,-70,132);
		CrocUp = 2;
	elseif(RandomNumber > 55 and RandomNumber <= 80) then
		eq.spawn2(RandomCroc,0,0,470,1661,-70,132);
		eq.spawn2(RandomCroc,0,0,462,1653,-70,132);
		eq.spawn2(RandomCroc,0,0,459,1671,-70,132); -- need exact loc
		CrocUp = 3;
	elseif(RandomNumber > 80 and RandomNumber <= 100) then
		eq.spawn2(65139,0,0,462,1653,-70,132); -- an ancient croc
		CrocUp = 1;
--	elseif(RandomNumber > 95 and RandomNumber <= 98) then
--		eq.spawn2(RandomCroc,0,0,470,1661,-70,132);
--		eq.spawn2(RandomCroc,0,0,462,1653,-70,132);
--		eq.spawn2(RandomCroc,0,0,450,1661,-70,132);
--		eq.spawn2(RandomCroc,0,0,459,1671,-70,132); -- need exact loc
--		CrocUp = 4;
--	elseif(RandomNumber > 98) then
--		eq.spawn2(RandomCroc,0,0,470,1661,-70,132);
--		eq.spawn2(RandomCroc,0,0,462,1653,-70,132);
--		eq.spawn2(RandomCroc,0,0,450,1661,-70,132);
--		eq.spawn2(RandomCroc,0,0,459,1671,-70,132); -- need exact loc
--		eq.spawn2(RandomCroc,0,0,480,1667,-70,132); -- need exact loc
--		CrocUp = 5;
	end
end

function event_signal(e)
	CrocUp = CrocUp - 1;
	if(CrocUp == 0) then
		eq.set_timer("spawn timer",795000);
	end
end

function event_timer(e)
	if(e.timer == "spawn timer") then
		croc_spawns();
		eq.stop_timer("spawn timer");
	end
end
		
