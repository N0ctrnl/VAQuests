function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Hello, traveler! Do you wish to [journey to luclin]?");
	elseif e.message:findi("journey to luclin") then
		-- e.self:Say("Take this, " .. e.other:GetName() .. ". You must stay inside the circle of the Spires, and keep this shard on your person. Should you need another, simply ask me. I do not think we will run out of shards any time soon! If you do NOT wish to travel to Luclin, destroy that which I gave you, or step well away from the Spires lest you be caught up in the portal. It will open soon.");
		-- e.other:SummonItem(19720); -- Spire Stone
		e.other:MovePC(150, 0, 0, 0, 0);
	end
end