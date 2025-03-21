math.randomseed(os.time())
dofile('data/lib/lib.lua')

ropeSpots = {
	384, 418, 8278, 8592, 13189, 14435, 14436, 14857, 15635, 19518, 24621, 24622, 24623, 24624, 26019
}

keys = {
	2086, 2087, 2088, 2089, 2090, 2091, 2092, 10032
}

ITEM_GOLD_COIN =	 2148
ITEM_PLATINUM_COIN = 2152
ITEM_CRYSTAL_COIN =  2160
ITEMCOUNT_MAX = 100
ITEM_RUBY_COIN = 13685

openDoors = {
	1211, 1214, 1233, 1236, 1251, 1254, 3546, 3537, 4915, 4918, 5100, 5109, 5118, 5127, 5136, 5139, 5142,
	5145, 5280, 5283, 5734, 5737, 6194, 6197, 6251, 6254, 6893, 6902, 7035, 7044, 8543, 8546, 9167, 9170,
	9269, 9272, 10270, 10273, 10470, 10479, 10777, 10786, 12094, 12101, 12190, 12199, 19842, 19851, 19982,
	19991, 20275, 20284
}
closedDoors = {
	1210, 1213, 1232, 1235, 1250, 1253, 3536, 3545, 4914, 4917, 5099, 5108, 5117, 5126, 5135, 5138, 5141,
	5144, 5279, 5282, 5733, 5736, 6193, 6196, 6250, 6253, 6892, 6901, 7034, 7043, 8542, 8545, 9166, 9169,
	9268, 9271, 10269, 10272, 10766, 10785, 10469, 10478, 12093, 12100, 12189, 12198, 19841, 19850, 19981,
	19990, 20274, 20283
}
lockedDoors = {
	1209, 1212, 1231, 1234, 1249, 1252, 3535, 3544, 4913, 4916, 5098, 5107, 5116, 5125, 5134, 5137, 5140,
	5143, 5278, 5281, 5732, 5735, 6192, 6195, 6249, 6252, 6891, 6900, 7033, 7042, 8541, 8544, 9165, 9168,
	9267, 9270, 10268, 10271, 10468, 10477, 10775, 10784, 12092, 12099, 12188, 12197, 19840, 19849, 19980,
	19989, 20273, 20282
}

openExtraDoors = {
	1540, 1542, 6796, 6798, 6800, 6802, 7055, 7057, 13021, 13023, 17236, 17238, 25159, 25161
}
closedExtraDoors = {
	1539, 1541, 6795, 6797, 6799, 6801, 7054, 7056, 13020, 13022, 17235, 17237, 25158, 25160
}

openHouseDoors = {
	1220, 1222, 1238, 1240, 3539, 3548, 5083, 5085, 5102, 5111, 5120, 5129, 5285, 5287, 5516, 5518, 6199,
	6201, 6256, 6258, 6895, 6904, 7037, 7046, 8548, 8550, 9172, 9174, 9274, 9276, 10275, 10277, 10472, 10481,
	18209, 19844, 19853, 19984, 19993, 20277, 20286
}
closedHouseDoors = {
	1219, 1221, 1237, 1239, 3538, 3547, 5082, 5084, 5101, 5110, 5119, 5128, 5284, 5286, 5515, 5517, 6198,
	6200, 6255, 6257, 6894, 6903, 7036, 7045, 8547, 8549, 9171, 9173, 9273, 9275, 10274, 10276, 10471, 10480,
	18208, 19843, 19852, 19983, 19992, 20276, 20285
}

--[[ (Not currently used, but probably useful to keep up to date)
openQuestDoors = {
	1224, 1226, 1242, 1244, 1256, 1258, 3543, 3552, 5106, 5115, 5124, 5133, 5289, 5291, 5746, 5749, 6203,
	6205, 6260, 6262, 6899, 6908, 7041, 7050, 8552, 8554, 9176, 9178, 9278, 9280, 10279, 10281, 10476, 10485,
	10783, 10792, 12098, 12105, 12194, 12203, 19848, 19857, 19988, 19997, 20281, 20290, 25163, 25165
}
]]--
closedQuestDoors = {
	1223, 1225, 1241, 1243, 1255, 1257, 3542, 3551, 5105, 5114, 5123, 5132, 5288, 5290, 5745, 5748, 6202,
	6204, 6259, 6261, 6898, 6907, 7040, 7049, 8551, 8553, 9175, 9177, 9277, 9279, 10278, 10280, 10475, 10484,
	10782, 10791, 12097, 12104, 12193, 12202, 19847, 19856, 19987, 19996, 20280, 20289, 25162, 25164
}

--[[ (Not currently used, but probably useful to keep up to date)
openLevelDoors = {
	1228, 1230, 1246, 1248, 1260, 1262, 3541, 3550, 5104, 5113, 5122, 5131, 5293, 5295, 6207, 6209, 6264,
	6266, 6897, 6906, 7039, 7048, 8556, 8558, 9180, 9182, 9282, 9284, 10283, 10285, 10474, 10483, 10781,
	10790, 12096, 12103, 12196, 12205, 19846, 19855, 19986, 19995, 20279, 20288
}
]]--
closedLevelDoors = {
	1227, 1229, 1245, 1247, 1259, 1261, 3540, 3549, 5103, 5112, 5121, 5130, 5292, 5294, 6206, 6208, 6263,
	6265, 6896, 6905, 7038, 7047
}

function getDistanceBetween(firstPosition, secondPosition)
	local xDif = math.abs(firstPosition.x - secondPosition.x)
	local yDif = math.abs(firstPosition.y - secondPosition.y)
	local posDif = math.max(xDif, yDif)
	if firstPosition.z ~= secondPosition.z then
		posDif = posDif + 15
	end
	return posDif
end

function getFormattedWorldTime()
	local worldTime = getWorldTime()
	local hours = math.floor(worldTime / 60)

	local minutes = worldTime % 60
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

function getLootRandom()
	return math.random(0, MAX_LOOTCHANCE) / configManager.getNumber(configKeys.RATE_LOOT)
end

table.contains = function(array, value)
	for _, targetColumn in pairs(array) do
		if targetColumn == value then
			return true
		end
	end
	return false
end

string.split = function(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v
	end
	return res
end

string.splitTrimmed = function(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v:trim()
	end
	return res
end

string.trim = function(str)
	return str:match'^()%s*$' and '' or str:match'^%s*(.*%S)'
end

if not nextUseStaminaTime then
	nextUseStaminaTime = {}
end

function getPlayerDatabaseInfo(name_or_guid)
	local sql_where = ""

	if type(name_or_guid) == 'string' then
		sql_where = "WHERE `p`.`name`=" .. db.escapeString(name_or_guid) .. ""
	elseif type(name_or_guid) == 'number' then
		sql_where = "WHERE `p`.`id`='" .. name_or_guid .. "'"
	else
		return false
	end

	local sql_query = [[
		SELECT
			`p`.`id` as `guid`,
			`p`.`name`,
			CASE WHEN `po`.`player_id` IS NULL
				THEN 0
				ELSE 1
			END AS `online`,
			`p`.`group_id`,
			`p`.`level`,
			`p`.`experience`,
			`p`.`vocation`,
			`p`.`maglevel`,
			`p`.`skill_fist`,
			`p`.`skill_club`,
			`p`.`skill_sword`,
			`p`.`skill_axe`,
			`p`.`skill_dist`,
			`p`.`skill_shielding`,
			`p`.`skill_fishing`,
			`p`.`town_id`,
			`p`.`balance`,
			`gm`.`guild_id`,
			`gm`.`nick`,
			`g`.`name` AS `guild_name`,
			CASE WHEN `p`.`id` = `g`.`ownerid`
				THEN 1
				ELSE 0
			END AS `is_leader`,
			`gr`.`name` AS `rank_name`,
			`gr`.`level` AS `rank_level`,
			`h`.`id` AS `house_id`,
			`h`.`name` AS `house_name`,
			`h`.`town_id` AS `house_town`
		FROM `players` AS `p`
		LEFT JOIN `players_online` AS `po`
			ON `p`.`id` = `po`.`player_id`
		LEFT JOIN `guild_membership` AS `gm`
			ON `p`.`id` = `gm`.`player_id`
		LEFT JOIN `guilds` AS `g`
			ON `gm`.`guild_id` = `g`.`id`
		LEFT JOIN `guild_ranks` AS `gr`
			ON `gm`.`rank_id` = `gr`.`id`
		LEFT JOIN `houses` AS `h`
			ON `p`.`id` = `h`.`owner`
	]] .. sql_where

	local query = db.storeQuery(sql_query)
	if not query then
		return false
	end

	local info = {
		["guid"] = result.getNumber(query, "guid"),
		["name"] = result.getString(query, "name"),
		["online"] = result.getNumber(query, "online"),
		["group_id"] = result.getNumber(query, "group_id"),
		["level"] = result.getNumber(query, "level"),
		["experience"] = result.getNumber(query, "experience"),
		["vocation"] = result.getNumber(query, "vocation"),
		["maglevel"] = result.getNumber(query, "maglevel"),
		["skill_fist"] = result.getNumber(query, "skill_fist"),
		["skill_club"] = result.getNumber(query, "skill_club"),
		["skill_sword"] = result.getNumber(query, "skill_sword"),
		["skill_axe"] = result.getNumber(query, "skill_axe"),
		["skill_dist"] = result.getNumber(query, "skill_dist"),
		["skill_shielding"] = result.getNumber(query, "skill_shielding"),
		["skill_fishing"] = result.getNumber(query, "skill_fishing"),
		["town_id"] = result.getNumber(query, "town_id"),
		["balance"] = result.getNumber(query, "balance"),
		["guild_id"] = result.getNumber(query, "guild_id"),
		["nick"] = result.getString(query, "nick"),
		["guild_name"] = result.getString(query, "guild_name"),
		["is_leader"] = result.getNumber(query, "is_leader"),
		["rank_name"] = result.getString(query, "rank_name"),
		["rank_level"] = result.getNumber(query, "rank_level"),
		["house_id"] = result.getNumber(query, "house_id"),
		["house_name"] = result.getString(query, "house_name"),
		["house_town"] = result.getNumber(query, "house_town")
	}

	result.free(query)
	return info
end

task_sys = {

    [1] = {name = "Demon", start = 176201, monsters_list = {"Demon"}, level = 8, count = 10, points = 0, items = {}, reward = {{2160,20}}, exp = 3000000, money = 2000},

[2] = {name = "juggernaut", start = 176201, monsters_list = {"Juggernaut"}, level = 8, count = 300, points = 0, items = {}, reward = {{2160,50}}, exp = 4000000, money = 2000},

[3] = {name = "bazir", start = 176201, monsters_list = {"Bazir"}, level = 8, count = 3, points = 0, items = {}, reward = {{2160,30}}, exp = 2000000, money = 2000},

[4] = {name = "Birds", start = 176201, monsters_list = {"Chicken","Flamingo","Parrot","Penguin","Seagull","Terror Bird"}, level = 8, count = 200, points = 0, items = {}, reward = {{2160,10}}, exp = 1000000, money = 2000},



}

daily_task = {

    [1] = {name = "juggernaut" ,monsters_list = {"Juggernaut"}, count = 100, points = 3, reward = {{2173,1}}, exp = 130000, money = 200000},

    [2] = {name = "demon" ,monsters_list = {"Demon"}, count = 30, points = 3, reward = {{2173,1}}, exp = 130000, money = 200000},

    [3] = {name = "Birds" ,monsters_list = {"Chicken","Flamingo","Parrot","Penguin","Seagull","Terror Bird"}, count = 30, points = 3, reward = {{2173,1}}, exp = 130000, money = 200000},

    [4] = {name = "orshabaal" ,monsters_list = {"Orshabaal"}, count = 30, points = 3, reward = {{2173,1}}, exp = 130000, money = 200000},



}

task_sys_storages = {176601, 176602, 176603, 176604, 176605, 176606, 176607, 176608} -- task, points, count, daily task, daily count, daily time , daily start, contador
function Player.getTaskMission(self)

    return self:getStorageValue(task_sys_storages[1]) < 0 and 1 or self:getStorageValue(task_sys_storages[1])
end
function Player.getDailyTaskMission(self)

    return self:getStorageValue(task_sys_storages[4]) < 0 and 1 or self:getStorageValue(task_sys_storages[4])
end
function Player.getTaskPoints(self)

    return self:getStorageValue(task_sys_storages[2]) < 0 and 0 or self:getStorageValue(task_sys_storages[2])
end

function Player.randomDailyTask(self)
    local t = {
        [{6,49}] = {1,3},
        [{50,79}] = {1,3},
        [{80,129}] = {1,3},
        [{130,math.huge}] = {1,3}
    }
    for a , b in pairs(t) do
        if self:getLevel()  >= a[1] and self:getLevel() <= a[2] then
            return math.random(b[1], b[2])
        end
    end
    return 0
end
function Player.GetRankTask(self)
    local ranks = {
        [{1, 20}] = "Huntsman",
        [{21, 50}] = "Ranger",
        [{51, 100}] = "Big Game Hunter",
        [{101, 200}] = "Trophy Hunter",
        [{201, math.huge}] = "Elite Hunter"
    }
    for v , r in pairs(ranks) do
        if self:getTaskPoints() >= v[1] and self:getTaskPoints() <= v[2] then
            return r
        end
    end
    return 0
end

function getItemsFromList(items)
    local str = ''
    if table.maxn(items) > 0 then
        for i = 1, table.maxn(items) do
            str = str .. items[i][2] .. ' ' .. getItemName(items[i][1])
            if i ~= table.maxn(items) then str = str .. ', '
            end
        end
    end
    return str
end


function Player.doRemoveItemsFromList(self,items)
    local count = 0
    if table.maxn(items) > 0 then
        for i = 1, table.maxn(items) do
            if self:getItemCount(items[i][1]) >= items[i][2] then
            count = count + 1 end
        end
    end
    if count == table.maxn(items) then
        for i = 1, table.maxn(items) do self:removeItem(items[i][1],items[i][2]) end
    else
        return false
    end
    return true
end

function getMonsterFromList(monster)
    local str = ''
    if #monster > 0 then
        for i = 1, #monster do
            str = str .. monster[i]
            if i ~= #monster then str = str .. ', ' end
        end
    end
    return str
end


function Player.GiveRewardsTask(self, items)
    local backpack = self:addItem(1999, 1) -- backpackID
    for _, i_i in ipairs(items) do
        local item, amount = i_i[1],i_i[2]
        if isItemStackable(item) or amount == 1 then
            doAddContainerItem(backpack, item, amount)
        else
            for i = 1, amount do
                doAddContainerItem(backpack, item, 1)
            end
        end
    end
end
