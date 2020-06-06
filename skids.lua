local skids = {}
timer.Simple(0, function()
	http.Fetch("https://raw.github.com/cresterienvogel/Skids/master/skids.json", 
		function(content)
			skids = util.JSONToTable(content)
		end
	)
end)

hook.Add("CheckPassword", "XPA Skids", function(steamid)
	if table.HasValue(skids, util.SteamIDTo64(steamid)) then
		return false, "Prohibited connection"
	end
end)