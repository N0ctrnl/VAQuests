sub EVENT_SAY {
    if ($text=~/hail/i){
        plugin::Whisper("Hey there! Want to see about getting some [" . quest::saylink("flags") . "]?");
    }
    if ($text=~/flags/i){
        plugin::Whisper("Great! Just give me the name of one of the [" . quest::saylink("zones") . "]?");
    }
    # Nightmare
    if($text=~/nightmare/i){
        plugin::Whisper("[" . quest::saylink("Hedge") . "] or [" . quest::saylink("Construct") . "]?");
    }
    if($text=~/hedge/i){
        quest::setglobal("pop_pon_hedge_jezith", 1, 5, "F");
    }
    if($text=~/construct/i){
        quest::setglobal("pop_pon_construct",1,5,"F");
    }
    # Nightmare B
    if($text=~/nightmareb/i){
        plugin::Whisper("[" . quest::saylink("Poxbourne") . "] or [" . quest::saylink("Terris") . "]?");
    }
    if($text=~/terris/i){
        quest::setglobal("pop_ponb_terris",1,5,"F");
    }
    if($text=~/poxbourne/i){
        quest::setglobal("pop_ponb_poxbourne", 1, 5, "F");
    }
    # Innovation
    if($text=~/innovation/i){
        plugin::Whisper("[" . quest::saylink("Dragon") . "] or [" . quest::saylink("Behemoth") . "]?");
    }
    if($text=~/dragon/i){
        quest::setglobal("pop_poi_dragon", 1, 5, "F");
    }
    if($text=~/behemoth/i){
        quest::setglobal("pop_poi_behometh_preflag", 1, 5, "F");
        quest::setglobal("pop_poi_behometh_flag", 1, 5, "F");
    }
    # Disease
    if($text=~/disease/i){
        plugin::Whisper("[" . quest::saylink("Fuirstel") . "] or [" . quest::saylink("Grummus") . "]");
    }
    if($text=~/Fuirstel/i){
        quest::setglobal("pop_pod_alder_fuirstel", 1, 5, "F");
        quest::setglobal("pop_pod_elder_fuirstel", 1, 5, "F");
    }
    if($text=~/grummus/i){
        quest::setglobal("pop_pod_grimmus_planar_projection",1, 5, "F");
    }
    # Justice
    if($text=~/justice/i){
        plugin::Whisper("[" . quest::saylink("Mavuin") . "], [" . quest::saylink("Execution") . "], [" . quest::saylink("Flame") . "], [" . quest::saylink("Hanging") . "], [" . quest::saylink("Lashing") . "], [" . quest::saylink("Stoning") . "], or [" . quest::saylink("Torture") . "]?");
    }
    if($text=~/mavuin/i){
        quest::setglobal("pop_poj_mavuin", 1, 5, "F");
        quest::setglobal("pop_poj_valor_storms", 1, 5, "F");
    }
    if($text=~/pop_poj_tribunal/i){
        quest::setglobal("pop_poj_tribunal", 1, 5, "F");
    }
    if($text=~/execution/i){
        quest::setglobal("pop_poj_execution", 1, 5, "F");
    }
    if($text=~/flame/i){
        quest::setglobal("pop_poj_flame", 1, 5, "F");
    }
    if($text=~/hanging/i){
        quest::setglobal("pop_poj_hanging", 1, 5, "F");
    }
    if($text=~/lashing/i){
        quest::setglobal("pop_poj_lashing", 1, 5, "F");
    }
    if($text=~/stoning/i){
        quest::setglobal("pop_poj_stoning", 1, 5, "F");
    }
    if($text=~/torture/i){
        quest::setglobal("pop_poj_torture", 1, 5, "F");
    }
    # Valor
    if($text=~/valor/i){
        plugin::Whisper("[" . quest::saylink("Aerin") . "]");
    }
    if($text=~/aerin/i){
        quest::setglobal("pop_pov_aerin_dar", 1, 5, "F");
    }
    # Storms
    if($text=~/storms/i){
        plugin::Whisper("[" . quest::saylink("Askr") . "]");
    }
    if($text=~/askr/i){
        quest::setglobal("pop_pos_askr_the_lost", 1, 5, "F");
        quest::setglobal("pop_pos_askr_the_lost_final", 1, 5, "F");
    }
    # Decay
    if($text=~/decay/i){
        plugin::Whisper("[" . quest::saylink("Bertox") . "]");
    }
    if($text=~/bertox/i){
        quest::setglobal("pop_cod_preflag", 1, 5, "F");
        quest::setglobal("pop_cod_bertox", 1, 5, "F");
        quest::setglobal("pop_cod_final", 1, 5, "F");
    }
    # Torment
    if($text=~/torment/i){
        plugin::Whisper("[" . quest::saylink("Shadyglade") . "], [" . quest::saylink("Newleaf") . "], or [" . quest::saylink("Saryrn") . "]?");
    }
    if($text=~/shadyglade/i){
        quest::setglobal("pop_pot_shadyglade", 1, 5, "F");
    }
    if($text=~/newleaf/i){
        quest::setglobal("pop_pot_newleaf", 1, 5, "F");
    }
    if($text=~/saryrn/i){
        quest::setglobal("pop_pot_saryrn", 1, 5, "F");
        quest::setglobal("pop_pot_saryrn_final", 1, 5, "F");
    }
    # Halls of Honor
    if($text=~/honor/i){
        plugin::Whisper("[" . quest::saylink("Faye") . "], [" . quest::saylink("Trell") . "], or [" . quest::saylink("Garn") . "]?");
    }
    if($text=~/faye/i){
        quest::setglobal("pop_hoh_faye", 1, 5, "F");
    }
    if($text=~/trell/i){
        quest::setglobal("pop_hoh_trell", 1, 5, "F");
    }
    if($text=~/garn/i){
        quest::setglobal("pop_hoh_garn", 1, 5, "F");
    }
    # Halls of Honor B
    if($text=~/marr/i){
        plugin::Whisper("[" . quest::saylink("Mithanael Marr") . "]");
    }
    if($text=~/mithanael/i){
        quest::setglobal("pop_hohb_marr", 1, 5, "F");
    }
    # Bastion of Thunder
    if($text=~/thunder/i){
        plugin::Whisper("[" . quest::saylink("Agnarr") . "] or [" . quest::saylink("Karana") . "]?");
    }
    if($text=~/agnarr/i){
        quest::setglobal("pop_bot_agnarr", 1, 5, "F");
    }
    if($text=~/karana/i){
        quest::setglobal("pop_bot_karana", 1, 5, "F");
    }
    # Tactics
    if($text=~/tactics/i){
        plugin::Whisper("[" . quest::saylink("Tallon") . "], [" . quest::saylink("Vallon") . "], or [" . quest::saylink("Rallos") . "]");
    }
    if($text=~/tallon/i){
        quest::setglobal("pop_tactics_tallon", 1, 5, "F");
    }
    if($text=~/vallon/i){
        quest::setglobal("pop_tactics_vallon", 1, 5, "F");
    }
    if($text=~/rallos/i){
        quest::setglobal("pop_tactics_ralloz", 1, 5, "F");
    }
    # Tranquility
    if($text=~/tranquility/i){
        plugin::Whisper("[" . quest::saylink("Maelin") . "]");
    }
    if($text=~/librarian/i){
        quest::setglobal("pop_elemental_grand_librarian", 1, 5, "F");
    }
    # Solusek Ro
    if($text=~/solusek ro/i){
        plugin::Whisper("[" . quest::saylink("Arlyxir") . "], [" . quest::saylink("Dresolik") . "], [" . quest::saylink("Jiva") . "], [" . quest::saylink("Rizlona") . "], [" . quest::saylink("Xuzl") . "], or [" . quest::saylink("Solusek") . "]?");
    }
    if($text=~/arlyxir/i){
        quest::setglobal("pop_sol_ro_arlyxir", 1, 5, "F");
    }
    if($text=~/dresolik/i){
        quest::setglobal("pop_sol_ro_dresolik", 1, 5, "F");
    }
    if($text=~/jiva/i){
        quest::setglobal("pop_sol_ro_jiva", 1, 5, "F");
    }
    if($text=~/rizlona/i){
        quest::setglobal("pop_sol_ro_rizlona", 1, 5, "F");
    }
    if($text=~/xuzl/i){
        quest::setglobal("pop_sol_ro_xuzl", 1, 5, "F");
    }
    if($text=~/solusek/i){
        quest::setglobal("pop_sol_ro_solusek", 1, 5, "F");
    }
    # Fire
    if($text=~/fire/i){
        plugin::Whisper("[" . quest::saylink("Fennin") . "]");
    }
    if($text=~/fennin/i){
        quest::setglobal("pop_fire_fennin_projection", 1, 5, "F");
    }
    # Wind
    if($text=~/wind/i){
        plugin::Whisper("[" . quest::saylink("Xegony") . "]");
    }
    if($text=~/xegony/i){
        quest::setglobal("pop_wing_xegony_projection", 1, 5, "F");
    }
    # Water
    if($text=~/water/i){
        plugin::Whisper("[" . quest::saylink("Coirnav") . "]");
    }
    if($text=~/coirnav/i){
        quest::setglobal("pop_water_coirnav_projection", 1, 5, "F");
    }
    # Earth
    if($text=~/earth/i){
        plugin::Whisper("[" . quest::saylink("Arbitor") . "]");
    }
    if($text=~/arbitor/i){
        quest::setglobal("pop_eartha_arbitor_projection", 1, 5, "F");
    }
    # Earth B
    if($text=~/vegarlson/i){
        plugin::Whisper("[" . quest::saylink("Rathe") . "]");
    }
    if($text=~/rathe/i){
        quest::setglobal("pop_earthb_rathe", 1, 5, "F");
    }
    # Time
    if($text=~/time/i){
        plugin::Whisper("[" . quest::saylink("Maelin") . "]");
    }
    if($text=~/maelin/i){
        quest::setglobal("pop_time_maelin", 1, 5, "F");
    }
}