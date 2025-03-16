sub LoadMageloPath(){ 
	$magelo_path = ""; 
}

sub LeaderBoardsUpdate{
	$connect = plugin::LoadMysql();
	my $client = plugin::val('$client');
	my $name = plugin::val('$name');
	my $race = plugin::val('$race');
	my $class = plugin::val('$class');
	my $status = plugin::val('$status');
	my $ulevel = plugin::val('$ulevel');
	my $hp1 = $client->GetMaxHP();
    my $hp2 = $client->GetSpellHPBonuses();
    my $hp = ($hp1 - $hp2);
	my $mana = $client->GetMaxMana();
	my $character_ac = $client->GetAC();
	my $aapts = $client->GetAAPoints();
	$query = "
		REPLACE INTO `cust_ext_leaderboards`
		(id, name, class, race, hp, mana, ac, status, aa, level)
		VALUES
		(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
	";
	$query_handle = $connect->prepare($query);
	$query_handle->execute(
		$client->CharacterID(), 
		$name, 
		$class, 
		$race, 
		$hp, 
		$mana, 
		$character_ac, 
		$status, 
		$aapts, 
		$ulevel
	);
	quest::debug("$DBI::errstr") if $DBI::errstr;
}


sub DefineClassArrays{
	%character_class_list = (
		0 => ["Warrior", "WAR", "HP"],
		1 => ["Cleric", "CLR", "MANA"],
		2 => ["Paladin", "PAL", "HP"],
		3 => ["Ranger", "RNG", "HP"],
		4 => ["Shadowknight", "SHD", "HP"],
		5 => ["Druid", "DRU", "MANA"],
		6 => ["Monk", "MNK", "HP"],
		7 => ["Bard", "BRD", "HP"],
		8 => ["Rogue", "ROG", "HP"],
		9 => ["Shaman", "SHM", "MANA"],
		10 => ["Necromancer", "NEC", "MANA"],
		11 => ["Wizard", "WIZ", "MANA"],
		12 => ["Magician", "MAG", "MANA"],
		13 => ["Enchanter", "ENC", "MANA"],
		14 => ["Beastlord", "BST", "HP"],
		15 => ["Berserker", "ZER", "HP"],
	);
	%character_race_list	= (
		1 => ["Human", "HUM"],
		2 => ["Barbarian", "BAR"],
		3 => ["Erudite", "ERU"],
		4 => ["Wood Elf", "ELF"],
		5 => ["High Elf", "HIE"],
		6 => ["Dark Elf", "DEF"],
		7 => ["Half Elf", "HFL"],
		8 => ["Dwarf", "DWF"],
		9 => ["Troll", "TRL"],
		10 => ["Ogre", "OGR"],
		11 => ["Halfling", "WIZ"],
		12 => ["Gnome", "MAG"],
		13 => ["Iksar", "IKS"],
		14 => ["Vah Shir", "VAH"],
		15 => ["Froglok", "FRG"],
		16 => ["Drakkin", "DRK"],
		17 => ["Unknown", "UNK"],
	);
}

sub ShowTopLeaderboards{
	my $character_classInsert = $_[0];
	my $OrderBy = $_[2];
	my $QueryLimit = 10;
	
	$connect = plugin::LoadMysql();
	LoadMageloPath();

	$query = "SELECT
		`name`,
		class,
		race,
		hp,
		mana,
		ac,
		`status`,
		aa,
		`level`
		FROM
		cust_ext_leaderboards
		WHERE class = ? AND STATUS < 100 ORDER BY $OrderBy DESC LIMIT 0, $QueryLimit";
	$query_handle = $connect->prepare($query);

	$query_handle->execute($character_classInsert);
	quest::debug("$DBI::errstr") if $DBI::errstr;

	my $Result = "";

	#::: Define classes for references
	DefineClassArrays();
	
	while (@row = $query_handle->fetchrow_array()){
		my $character_name = $row[0];
		my $character_class = $row[1];
		my $character_race = $row[2];
		my $character_level = $row[8];
		my $character_hp = plugin::commify($row[3]);
		my $character_mana = plugin::commify($row[4]);
		my $character_ac = plugin::commify($row[5]);
		$count++;

		$n = 0;
		while($character_class_list{$n}[0]){
			if($character_class eq $character_class_list{$n}[0]){
				$character_class = $character_class_list{$n}[1];
			}
			$n++;
		}
		
		$n = 1;
		while($character_race_list{$n}[0]){
			if($character_race eq $character_race_list{$n}[0]){
				$character_race = $character_race_list{$n}[1];
			}
			$n++;
		}
	
		$Result .= "
			<tr>
				<td><c \"#FFFF66\">$count~</td>
				<td><a href=\"". $magelo_path . "character.php?char=$character_name\">".$character_name."</a></td>
				<td><c \"#FFFF66\">" . $character_class . "~</td>
				<td><c \"#DF7401\">" . $character_race . "~ </td>
				<td><c \"#00FF00\">" . $character_level . "~ </td>
				<td><c \"#FF0000\">" . $character_hp . "~ </td>
				<td><c \"#3366FF\">" . $character_mana . "~ </td>
				<td><c \"#80FF00\">" . $character_ac . "~ </td>
			</tr>";
	} 
	
	$count = 0;
	plugin::DiaWind(
		"{linebreak}
		<br>
		Leaderboards by {g}". $OrderBy . " ~ 
		<br>
		{linebreak}
		<br>
		<table>
		<tr>
			<th></th>
			<th>Name</th>
			<th>Class</th>
			<th>Race</th>
			<th>Level</th>
			<th>HP</th>
			<th>Mana</th>
			<th>AC</th>
		</tr>
		" . $Result . "
		</table>
		noquotes
	");
}

sub ShowTopLeaderboardsByStat{
	my $QueryLimit = 10;
	my $OrderBy = $_[1];
	
	$connect = plugin::LoadMysql();
	LoadMageloPath();

	# PREPARE THE QUERY
	$query = "SELECT
		`name`,
		class,
		race,
		hp,
		mana,
		ac,
		`status`,
		aa,
		`level`
		FROM
		cust_ext_leaderboards
	WHERE STATUS < 100 ORDER BY $OrderBy DESC LIMIT 0, $QueryLimit";
	$query_handle = $connect->prepare($query);

	# EXECUTE THE QUERY
	$query_handle->execute();
	my $Result = "";
	
	#::: Define classes for references
	DefineClassArrays();
	
	while (@row = $query_handle->fetchrow_array()){
		my $character_name = $row[0];
		my $character_class = $row[1];
		my $character_race = $row[2];
		my $character_level = $row[8];
		my $character_hp = plugin::commify($row[3]);
		my $character_mana = plugin::commify($row[4]);
		my $character_ac = plugin::commify($row[5]);
		$count++;
		
		$n = 0;
		while($character_class_list{$n}[0]){
			if($character_class eq $character_class_list{$n}[0]){
				$character_class = $character_class_list{$n}[1];
			}
			$n++;
		}
		
		$n = 1;
		while($character_race_list{$n}[0]){
			if($character_race eq $character_race_list{$n}[0]){
				$character_race = $character_race_list{$n}[1];
			}
			$n++;
		}
	
		$Result .= "
		<tr>
			<td><c \"#FFFF66\">$count~</td>
			<td><a href=\"" . $magelo_path . "character.php?char=$character_name\">" . $character_name . "</a></td>
			<td><c \"#FFFF66\">" . $character_class . "~ </td>
			<td><c \"#DF7401\">" . $character_race . "~ </td>
			<td><c \"#00FF00\">" . $character_level . "~ </td>
			<td><c \"#FF0000\">" . $character_hp . "~ </td>
			<td><c \"#3366FF\">" . $character_mana . "~ </td>
			<td><c \"#80FF00\">" . $character_ac . "~ </td>
		</tr>";
	} 
	
	$count = 0;
	plugin::DiaWind(
		"
		{linebreak}
		<br>
		Leaderboards by {g}". $OrderBy . " ~ 
		<br>
		{linebreak}
		<br>
			<table>
			<tr>
				<th></th>
				<th>Name</th>
				<th>Class</th>
				<th>Race</th>
				<th>Level</th>
				<th>HP</th>
				<th>Mana</th>
				<th>AC</th>
			</tr>
				" . $Result . "
			</table>
			noquotes
	");
}

sub LeaderBoardsMenu{
	my $text = $_[0];
	
	my $client = plugin::val('$client');
	my $highest_hp = quest::saylink("doleaderboards Highest HP", 1, "Top HP");
	my $highest_mana = quest::saylink("doleaderboards Highest Mana", 1, "Top Mana");
	my $highest_ac = quest::saylink("doleaderboards Highest AC", 1, "Top AC");
	
	#::: Define classes for references
	DefineClassArrays();
	
	$text_result = "";
	if ($text =~/Player Leaderboards/i){
		$client->Message(315, 'Player Leaderboards');
		$client->Message(315, '-----------------------------------------------------');
		$client->Message(315, " --- " . $highest_hp . " - " . $highest_mana . " - " . $highest_ac);
		$client->Message(315, '-----------------------------------------------------');
		$n = 0;
		for($i = 0; $i <= 15; $i++){
			$text_result .= quest::saylink("doleaderboards " . $character_class_list{$i}[0], 1, $character_class_list{$i}[1]); 
			if($i != 15 && $n != 3){ 
				$text_result .= " --- "; 
			}
			if($n == 3){
				$client->Message(315, " ---" . $text_result); 
				$n = 0; 
				$text_result = "";
			}
			$n++;
		}		
	}
	#::: Parse Text
	if($text=~/doleaderboards/i){
		if ($text =~ /Highest HP/i){ plugin::ShowTopLeaderboardsByStat(15, "HP"); }
		if ($text =~ /Highest Mana/i){ plugin::ShowTopLeaderboardsByStat(15, "MANA"); }
		if ($text =~ /Highest AC/i){ plugin::ShowTopLeaderboardsByStat(15, "AC"); }
		if ($text =~ /Warrior/i){ plugin::ShowTopLeaderboards("Warrior", 15, "HP"); }
		if ($text =~ /Cleric/i){ plugin::ShowTopLeaderboards("Cleric", 15, "MANA"); }
		if ($text =~ /Paladin/i){ plugin::ShowTopLeaderboards("Paladin", 15, "HP"); }
		if ($text =~ /Ranger/i){ plugin::ShowTopLeaderboards("Ranger", 15, "HP"); }
		if ($text =~ /Shadowknight/i){ plugin::ShowTopLeaderboards("Shadowknight", 15, "HP"); }
		if ($text =~ /Druid/i){ plugin::ShowTopLeaderboards("Druid", 15, "MANA"); }
		if ($text =~ /Monk/i){ plugin::ShowTopLeaderboards("Monk", 15, "HP"); }
		if ($text =~ /Bard/i){ plugin::ShowTopLeaderboards("Bard", 15, "HP"); }
		if ($text =~ /Rogue/i){ plugin::ShowTopLeaderboards("Rogue", 15, "HP"); }
		if ($text =~ /Shaman/i){ plugin::ShowTopLeaderboards("Shaman", 15, "MANA"); }
		if ($text =~ /Necromancer/i){ plugin::ShowTopLeaderboards("Necromancer", 15, "MANA"); }
		if ($text =~ /Wizard/i){ plugin::ShowTopLeaderboards("Wizard", 15, "MANA"); }
		if ($text =~ /Magician/i){ plugin::ShowTopLeaderboards("Magician", 15, "MANA");}
		if ($text =~ /Enchanter/i){ plugin::ShowTopLeaderboards("Enchanter", 15, "MANA"); }
		if ($text =~ /Beastlord/i){ plugin::ShowTopLeaderboards("Beastlord", 15, "HP"); }
		if ($text =~ /Berserker/i){ plugin::ShowTopLeaderboards("Berserker", 15, "HP");}
	}
}
