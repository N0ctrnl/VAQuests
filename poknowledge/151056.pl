# MASTER FLAG GRANTING SCRIPT
# This script grants ALL PoP flags via EVENT_SAY (speech to NPC)
# Speak the phrases below to grant the corresponding flags
#
# HOW TO USE THIS SCRIPT:
# 1. Hail the NPC to see available flag categories
# 2. Speak the phrases listed below to grant groups of related flags
# 3. All zone flags will be set automatically with the character flags
#

sub EVENT_SAY {
    my $text = $text;
    
    # Display help/menu on hail
    if ($text =~ /hail/i) {
        quest::say("Welcome! I can grant you all the Plane of Power flags. Click any of the following:");
        quest::say(quest::saylink("nightmare flags", 0, "Plane of Nightmare flags") . " - Plane of Nightmare access and progression");
        quest::say(quest::saylink("tranquility flags", 0, "Plane of Tranquility flags") . " - Plane of Tranquility access and progression");
        quest::say(quest::saylink("justice flags", 0, "Plane of Justice flags") . " - Plane of Justice access and progression");
        quest::say(quest::saylink("disease flags", 0, "Plane of Disease flags") . " - Plane of Disease access and progression");
        quest::say(quest::saylink("innovation flags", 0, "Plane of Innovation flags") . " - Plane of Innovation access and progression");
        quest::say(quest::saylink("torment flags", 0, "Plane of Torment flags") . " - Plane of Torment access and progression");
        quest::say(quest::saylink("valor flags", 0, "Plane of Valor flags") . " - Plane of Valor access and progression");
        quest::say(quest::saylink("storms flags", 0, "Plane of Storms flags") . " - Plane of Storms access and progression");
        quest::say(quest::saylink("tactics flags", 0, "Plane of Tactics flags") . " - Plane of Tactics access and progression");
        quest::say(quest::saylink("air flags", 0, "Plane of Air flags") . " - Plane of Air access and progression");
        quest::say(quest::saylink("water flags", 0, "Plane of Water flags") . " - Plane of Water access and progression");
        quest::say(quest::saylink("fire flags", 0, "Plane of Fire flags") . " - Plane of Fire access and progression");
        quest::say(quest::saylink("earth flags", 0, "Plane of Earth flags") . " - Plane of Earth access and progression");
        quest::say(quest::saylink("time flags", 0, "Plane of Time flags") . " - Plane of Time access and progression");
        quest::say(quest::saylink("honor flags", 0, "Halls of Honor flags") . " - Halls of Honor access and progression");
        quest::say(quest::saylink("solrotower flags", 0, "Solusek Ro's Tower flags") . " - Solrotower access and progression");
        quest::say(quest::saylink("bothunder flags", 0, "Bastion of Thunder flags") . " - Bothunder access and progression");
        quest::say(quest::saylink("codecay flags", 0, "Crypt of Decay flags") . " - Codecay access and progression");
        quest::say(quest::saylink("all flags", 0, "All flags") . " - Grant ALL flags at once");
        return;
    }

    # ==========================================
    # NIGHTMARE PROGRESSION FLAGS (Plane of Nightmare)
    # ==========================================
    if ($text =~ /nightmare flags/i) {
        quest::say("Granting Plane of Nightmare access and progression flags...");
        quest::setglobal("pop_pon_hedge_jezith", 1, 5, "F");
        quest::setglobal("pop_pon_construct", 1, 5, "F");
        quest::setglobal("pop_ponb_terris", 1, 5, "F");
        quest::setglobal("pop_ponb_poxbourne", 1, 5, "F");
        quest::set_zone_flag(221);  # Lair of Terris Thule
        $client->Message(4, "You receive character flags: pop_pon_hedge_jezith, pop_pon_construct");
        $client->Message(4, "You receive character flags: pop_ponb_terris, pop_ponb_poxbourne");
        $client->Message(7, "You now have access to: Lair of Terris Thule!");
        return;
    }

    # ==========================================
    # TRANQUILITY PROGRESSION FLAGS (Plane of Tranquility)
    # ==========================================
    if ($text =~ /tranquility flags/i) {
        quest::say("Granting Plane of Tranquility access and progression flags...");
        quest::setglobal("pop_pot_shadyglade", 1, 5, "F");
        quest::setglobal("pop_pot_newleaf", 1, 5, "F");
        quest::setglobal("pop_pot_saryrn", 1, 5, "F");
        quest::setglobal("pop_pot_saryrn_final", 1, 5, "F");
        $client->Message(4, "You receive character flags: pop_pot_shadyglade, pop_pot_newleaf");
        $client->Message(4, "You receive character flags: pop_pot_saryrn, pop_pot_saryrn_final");
        $client->Message(4, "Gateway to Plane of Torment unlocked!");
        return;
    }

    # ==========================================
    # JUSTICE PROGRESSION FLAGS (Plane of Justice)
    # ==========================================
    if ($text =~ /justice flags/i) {
        quest::say("Granting Plane of Justice access and progression flags...");
        quest::setglobal("pop_poj_mavuin", 1, 5, "F");
        quest::setglobal("pop_poj_tribunal", 1, 5, "F");
        quest::setglobal("pop_poj_valor_storms", 1, 5, "F");
        quest::setglobal("pop_poj_execution", 1, 5, "F");
        quest::setglobal("pop_poj_flame", 1, 5, "F");
        quest::setglobal("pop_poj_hanging", 1, 5, "F");
        quest::setglobal("pop_poj_lashing", 1, 5, "F");
        quest::setglobal("pop_poj_stoning", 1, 5, "F");
        quest::setglobal("pop_poj_torture", 1, 5, "F");
        quest::set_zone_flag(208);  # Plane of Justice access
        quest::set_zone_flag(210);  # Additional access
        $client->Message(4, "You receive character flags: pop_poj_mavuin, pop_poj_tribunal");
        $client->Message(4, "You receive character flags: pop_poj_valor_storms, pop_poj_execution");
        $client->Message(4, "You receive character flags: pop_poj_flame, pop_poj_hanging");
        $client->Message(4, "You receive character flags: pop_poj_lashing, pop_poj_stoning, pop_poj_torture");
        $client->Message(7, "You now have access to: Plane of Justice!");
        return;
    }

    # ==========================================
    # DISEASE PROGRESSION FLAGS (Plane of Disease)
    # ==========================================
    if ($text =~ /disease flags/i) {
        quest::say("Granting Plane of Disease access and progression flags...");
        quest::setglobal("pop_pod_alder_fuirstel", 1, 5, "F");
        quest::setglobal("pop_pod_grimmus_planar_projection", 1, 5, "F");
        quest::setglobal("pop_pod_elder_fuirstel", 1, 5, "F");
        quest::set_zone_flag(200);  # Plane of Disease access
        $client->Message(4, "You receive character flags: pop_pod_alder_fuirstel");
        $client->Message(4, "You receive character flags: pop_pod_grimmus_planar_projection, pop_pod_elder_fuirstel");
        $client->Message(7, "You now have access to: Plane of Disease!");
        return;
    }

    # ==========================================
    # INNOVATION PROGRESSION FLAGS (Plane of Innovation)
    # ==========================================
    if ($text =~ /innovation flags/i) {
        quest::say("Granting Plane of Innovation access and progression flags...");
        quest::setglobal("pop_poi_behometh_preflag", 1, 5, "F");
        quest::setglobal("pop_poi_behometh_flag", 1, 5, "F");
        quest::setglobal("pop_poi_dragon", 1, 5, "F");
        quest::set_zone_flag(214);  # Drunder, Fortress of Zek
        $client->Message(4, "You receive character flags: pop_poi_behometh_preflag, pop_poi_behometh_flag");
        $client->Message(4, "You receive character flags: pop_poi_dragon");
        $client->Message(7, "You now have access to: Drunder, Fortress of Zek!");
        return;
    }

    # ==========================================
    # TORMENT PROGRESSION FLAGS (Plane of Torment)
    # ==========================================
    if ($text =~ /torment flags/i) {
        quest::say("Granting Plane of Torment access and progression flags...");
        quest::setglobal("pop_pot_saryrn", 1, 5, "F");
        quest::setglobal("pop_pot_saryrn_final", 1, 5, "F");
        $client->Message(4, "You receive character flags: pop_pot_saryrn, pop_pot_saryrn_final");
        $client->Message(4, "Access to Plane of Torment progression unlocked!");
        return;
    }

    # ==========================================
    # VALOR PROGRESSION FLAGS (Plane of Valor)
    # ==========================================
    if ($text =~ /valor flags/i) {
        quest::say("Granting Plane of Valor access and progression flags...");
        quest::setglobal("pop_pov_aerin_dar", 1, 5, "F");
        quest::set_zone_flag(211);  # Plane of Valor access
        $client->Message(4, "You receive character flags: pop_pov_aerin_dar");
        $client->Message(7, "You now have access to: Plane of Valor!");
        return;
    }

    # ==========================================
    # STORMS PROGRESSION FLAGS (Plane of Storms)
    # ==========================================
    if ($text =~ /storms flags/i) {
        quest::say("Granting Plane of Storms access and progression flags...");
        quest::setglobal("pop_pos_askr_the_lost", 1, 5, "F");
        quest::setglobal("pop_pos_askr_the_lost_final", 1, 5, "F");
        quest::set_zone_flag(209);  # Plane of Storms access
        $client->Message(4, "You receive character flags: pop_pos_askr_the_lost, pop_pos_askr_the_lost_final");
        $client->Message(7, "You now have access to: Plane of Storms!");
        return;
    }

    # ==========================================
    # TACTICS PROGRESSION FLAGS (Plane of Tactics)
    # ==========================================
    if ($text =~ /tactics flags/i) {
        quest::say("Granting Plane of Tactics access and progression flags...");
        quest::setglobal("pop_tactics_tallon", 1, 5, "F");
        quest::setglobal("pop_tactics_vallon", 1, 5, "F");
        quest::setglobal("pop_tactics_ralloz", 1, 5, "F");
        quest::set_zone_flag(212);  # Plane of Tactics access
        $client->Message(4, "You receive character flags: pop_tactics_tallon, pop_tactics_vallon");
        $client->Message(4, "You receive character flags: pop_tactics_ralloz");
        $client->Message(7, "You now have access to: Plane of Tactics!");
        return;
    }

    # ==========================================
    # AIR PROGRESSION FLAGS (Plane of Air)
    # ==========================================
    if ($text =~ /air flags/i) {
        quest::say("Granting Plane of Air access and progression flags...");
        quest::setglobal("pop_air_challia", 1, 5, "F");
        quest::setglobal("pop_air_sirran", 1, 5, "F");
        quest::set_zone_flag(218);  # Eryslai, the Kingdom of Wind
        $client->Message(4, "You receive character flags for Plane of Air progression");
        $client->Message(7, "You now have access to: Eryslai, the Kingdom of Wind!");
        return;
    }

    # ==========================================
    # WATER PROGRESSION FLAGS (Plane of Water)
    # ==========================================
    if ($text =~ /water flags/i) {
        quest::say("Granting Plane of Water access and progression flags...");
        quest::setglobal("pop_water_coirnav", 1, 5, "F");
        quest::setglobal("pop_water_pwelon", 1, 5, "F");
        quest::setglobal("pop_water_nrinda", 1, 5, "F");
        quest::setglobal("pop_water_vamuil", 1, 5, "F");
        quest::set_zone_flag(216);  # Reef of Corniav
        $client->Message(4, "You receive character flags for Plane of Water progression");
        $client->Message(7, "You now have access to: Reef of Corniav!");
        return;
    }
    # ==========================================
    # FIRE PROGRESSION FLAGS (Plane of Fire)
    # ==========================================
    if ($text =~ /fire flags/i) {
        quest::say("Granting Plane of Fire access and progression flags...");
        quest::setglobal("pop_fire_fennin_ro", 1, 5, "F");
        quest::setglobal("pop_fire_azobian", 1, 5, "F");
        quest::setglobal("pop_fire_hebabbilys", 1, 5, "F");
        quest::setglobal("pop_fire_javonn", 1, 5, "F");
        quest::setglobal("pop_fire_reaxnous", 1, 5, "F");
        quest::set_zone_flag(217);  # Doomfire, the Burning Lands
        $client->Message(4, "You receive character flags for Plane of Fire progression");
        $client->Message(7, "You now have access to: Doomfire, the Burning Lands!");
        return;
    }

    # ==========================================
    # EARTH PROGRESSION FLAGS (Plane of Earth A & B)
    # ==========================================
    if ($text =~ /earth flags/i) {
        quest::say("Granting Plane of Earth access and progression flags...");
        quest::setglobal("pop_earth_rathe", 1, 5, "F");
        quest::setglobal("pop_earth_avatar", 1, 5, "F");
        quest::set_zone_flag(215);  # Vegarlson, the Earthen Badlands
        quest::set_zone_flag(222);  # Plane of Earth A (poeartha)
        $client->Message(4, "You receive character flags for Plane of Earth progression");
        $client->Message(4, "Earth flags granted!");
        return;
    }   
    # ==========================================
    # TIME PROGRESSION FLAGS (Plane of Time A & B)
    # ==========================================
    if ($text =~ /time flags/i) {
        quest::say("Granting Plane of Time access and progression flags...");
        quest::setglobal("pop_time_traveler", 1, 5, "F");
        quest::setglobal("pop_time_chronologist", 1, 5, "F");
        $client->Message(4, "You receive character flags for Plane of Time progression");
        $client->Message(4, "Time flags granted! (potimea and potimeb)");
        return;
    }

    # ==========================================
    # HONOR PROGRESSION FLAGS (Halls of Honor)
    # ==========================================
    if ($text =~ /honor flags/i) {
        quest::say("Granting Halls of Honor access and progression flags...");
        quest::setglobal("pop_hoh_faye", 1, 5, "F");
        quest::setglobal("pop_hoh_trell", 1, 5, "F");
        quest::setglobal("pop_hoh_garn", 1, 5, "F");
        quest::setglobal("pop_hohb_marr", 1, 5, "F");
        quest::set_zone_flag(220);  # Halls of Honor access
        $client->Message(4, "You receive character flags: pop_hoh_faye, pop_hoh_trell");
        $client->Message(4, "You receive character flags: pop_hoh_garn, pop_hohb_marr");
        $client->Message(7, "You now have access to: Halls of Honor!");
        return;
    }

    # ==========================================
    # SOLROTOWER PROGRESSION FLAGS
    # ==========================================
    if ($text =~ /solrotower flags/i) {
        quest::say("Granting Solrotower access and progression flags...");
        quest::setglobal("pop_sol_ro_arlyxir", 1, 5, "F");
        quest::setglobal("pop_sol_ro_jiva", 1, 5, "F");
        quest::setglobal("pop_sol_ro_rizlona", 1, 5, "F");
        quest::setglobal("pop_sol_ro_dresolik", 1, 5, "F");
        quest::setglobal("pop_sol_ro_xuzl", 1, 5, "F");
        quest::setglobal("pop_sol_ro_solusk", 1, 5, "F");
        quest::set_zone_flag(213);  # Solrotower access
        $client->Message(4, "You receive character flags: pop_sol_ro_arlyxir, pop_sol_ro_jiva");
        $client->Message(4, "You receive character flags: pop_sol_ro_rizlona, pop_sol_ro_dresolik");
        $client->Message(4, "You receive character flags: pop_sol_ro_xuzl, pop_sol_ro_solusk");
        $client->Message(7, "You now have access to: Solrotower!");
        return;
    }

    # ==========================================
    # BOTHUNDER PROGRESSION FLAGS
    # ==========================================
    if ($text =~ /bothunder flags/i) {
        quest::say("Granting Bothunder access and progression flags...");
        quest::setglobal("pop_bot_agnarr", 1, 5, "F");
        quest::setglobal("pop_bot_karana", 1, 5, "F");
        $client->Message(4, "You receive character flags: pop_bot_agnarr, pop_bot_karana");
        $client->Message(7, "You now have access to: Bothunder!");
        return;
    }

    # ==========================================
    # CODECAY PROGRESSION FLAGS
    # ==========================================
    if ($text =~ /codecay flags/i) {
        quest::say("Granting Codecay access and progression flags...");
        quest::setglobal("pop_cod_preflag", 1, 5, "F");
        quest::setglobal("pop_cod_bertox", 1, 5, "F");
        quest::setglobal("pop_cod_final", 1, 5, "F");
        quest::set_zone_flag(207);  # Codecay access
        $client->Message(4, "You receive character flags: pop_cod_preflag, pop_cod_bertox");
        $client->Message(4, "You receive character flags: pop_cod_final");
        $client->Message(7, "You now have access to: Codecay!");
        return;
    }

    # ==========================================
    # GRANT ALL FLAGS AT ONCE
    # ==========================================
    if ($text =~ /all flags/i) {
        quest::say("Granting ALL Plane of Power flags! Congratulations!");
        
        # Nightmare flags
        quest::setglobal("pop_pon_hedge_jezith", 1, 5, "F");
        quest::setglobal("pop_pon_construct", 1, 5, "F");
        quest::setglobal("pop_ponb_terris", 1, 5, "F");
        quest::setglobal("pop_ponb_poxbourne", 1, 5, "F");
        
        # Tranquility flags
        quest::setglobal("pop_pot_shadyglade", 1, 5, "F");
        quest::setglobal("pop_pot_newleaf", 1, 5, "F");
        quest::setglobal("pop_pot_saryrn", 1, 5, "F");
        quest::setglobal("pop_pot_saryrn_final", 1, 5, "F");
        
        # Justice flags
        quest::setglobal("pop_poj_mavuin", 1, 5, "F");
        quest::setglobal("pop_poj_tribunal", 1, 5, "F");
        quest::setglobal("pop_poj_valor_storms", 1, 5, "F");
        quest::setglobal("pop_poj_execution", 1, 5, "F");
        quest::setglobal("pop_poj_flame", 1, 5, "F");
        quest::setglobal("pop_poj_hanging", 1, 5, "F");
        quest::setglobal("pop_poj_lashing", 1, 5, "F");
        quest::setglobal("pop_poj_stoning", 1, 5, "F");
        quest::setglobal("pop_poj_torture", 1, 5, "F");
        
        # Disease flags
        quest::setglobal("pop_pod_alder_fuirstel", 1, 5, "F");
        quest::setglobal("pop_pod_grimmus_planar_projection", 1, 5, "F");
        quest::setglobal("pop_pod_elder_fuirstel", 1, 5, "F");
        
        # Innovation flags
        quest::setglobal("pop_poi_behometh_preflag", 1, 5, "F");
        quest::setglobal("pop_poi_behometh_flag", 1, 5, "F");
        quest::setglobal("pop_poi_dragon", 1, 5, "F");
        
        # Valor flags
        quest::setglobal("pop_pov_aerin_dar", 1, 5, "F");
        
        # Storms flags
        quest::setglobal("pop_pos_askr_the_lost", 1, 5, "F");
        quest::setglobal("pop_pos_askr_the_lost_final", 1, 5, "F");
        
        # Tactics flags
        quest::setglobal("pop_tactics_tallon", 1, 5, "F");
        quest::setglobal("pop_tactics_vallon", 1, 5, "F");
        quest::setglobal("pop_tactics_ralloz", 1, 5, "F");
        
        # Honor flags
        quest::setglobal("pop_hoh_faye", 1, 5, "F");
        quest::setglobal("pop_hoh_trell", 1, 5, "F");
        quest::setglobal("pop_hoh_garn", 1, 5, "F");
        quest::setglobal("pop_hohb_marr", 1, 5, "F");
        
        # Solrotower flags
        quest::setglobal("pop_sol_ro_arlyxir", 1, 5, "F");
        quest::setglobal("pop_sol_ro_jiva", 1, 5, "F");
        quest::setglobal("pop_sol_ro_rizlona", 1, 5, "F");
        quest::setglobal("pop_sol_ro_dresolik", 1, 5, "F");
        quest::setglobal("pop_sol_ro_xuzl", 1, 5, "F");
        quest::setglobal("pop_sol_ro_solusk", 1, 5, "F");
        
        # Bothunder flags
        quest::setglobal("pop_bot_agnarr", 1, 5, "F");
        quest::setglobal("pop_bot_karana", 1, 5, "F");
        
        # Codecay flags
        quest::setglobal("pop_cod_preflag", 1, 5, "F");
        quest::setglobal("pop_cod_bertox", 1, 5, "F");
        quest::setglobal("pop_cod_final", 1, 5, "F");
        
        # All zone flags
        quest::set_zone_flag(200);  # Plane of Disease
        quest::set_zone_flag(207);  # Codecay
        quest::set_zone_flag(208);  # Plane of Justice
        quest::set_zone_flag(209);  # Plane of Storms
        quest::set_zone_flag(210);  # Plane of Justice additional
        quest::set_zone_flag(211);  # Plane of Valor
        quest::set_zone_flag(212);  # Plane of Tactics
        quest::set_zone_flag(213);  # Solrotower
        quest::set_zone_flag(214);  # Drunder, Fortress of Zek
        quest::set_zone_flag(215);  # Vegarlson, the Earthen Badlands
        quest::set_zone_flag(216);  # Reef of Corniav
        quest::set_zone_flag(217);  # Doomfire, the Burning Lands
        quest::set_zone_flag(218);  # Eryslai, the Kingdom of Wind
        quest::set_zone_flag(220);  # Halls of Honor
        quest::set_zone_flag(221);  # Lair of Terris Thule
        quest::set_zone_flag(222);  # Plane of Earth A (poeartha)
        
        $client->Message(7, "========================================");
        $client->Message(7, "ALL PLANE OF POWER FLAGS GRANTED!");
        $client->Message(7, "========================================");
        $client->Message(4, "Character Flags: 39 granted");
        $client->Message(4, "Zone Flags: 12 granted");
        $client->Message(7, "You have full access to all Planes of Power!");
        return;
    }
}

1;

