-- Cleric 1.5 Pre_Quest
-- items involved:
-- Talisman of the Plasmatic Priests (identifies as "The world shall burn") (56010)
--
-- NPCs triggered:
-- High Priest Valon (175308)
-- A_Plasmatic_Priest x2 (27129)
-- A_Plasmatic_Priestess x2 (27130)

function event_trade(e)
    local item_lib = require("items");
        
        if (item_lib.check_turn_in(e.trade, {item1 = 56010})) then --Check for "Talisman of the Plasmatic Priests"
			e.other:SummonItem(56010); --return "Talisman of the Plasmatic Priests"
            -- Spawn High Priest Valon
            eq.spawn2(175308, 0, 0, 1468, -1710, -45, 402); -- needs_heading_validation
            -- Spawn 2 A Plasmatic Priest
            eq.spawn2(27129, 0, 0, 1464, -1716, -45, 502); -- needs_heading_validation
            eq.spawn2(27129, 0, 0, 1454, -1712, -47, 88);
            -- Spawn 3 A Plasmatic Priestess
            eq.spawn2(27130, 0, 0, 1473, -1692, -47, 374); -- needs_heading_validation
            eq.spawn2(27130, 0, 0, 1451, -1694, -47, 224);
            eq.depop_with_timer();
        end
		
    end
