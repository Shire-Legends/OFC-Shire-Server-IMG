local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local voices = { {text = "Mana fluid's! Have a look!"} }
npcHandler:addModule(VoiceModule:new(voices))

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

keywordHandler:addKeyword({'stuff'}, StdModule.say, {npcHandler = npcHandler, text = 'Just ask me for a {trade} to see my offers.'})
keywordHandler:addAliasKeyword({'wares'})
keywordHandler:addAliasKeyword({'offer'})



local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

local function showOffers(player)
    npcHandler:say("aqui está alguns dos itens que eu vendo: large mana fluid, small mana fluid", player)
end

	keywordHandler:addKeyword({'trade'}, showOffers)


	shopModule:addBuyableItem({'small mana fluid', 'smf'}, 15000, 100, 7, 'Small Mana Fluid')
	shopModule:addBuyableItem({'large mana fluid', 'lmf'}, 14996, 5000, 39,	'Large Mana Fluid')

npcHandler:addModule(FocusModule:new())


local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

