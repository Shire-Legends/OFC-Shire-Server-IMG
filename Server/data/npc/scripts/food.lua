local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local voices = { {text = "foods, meat, ram, salmon ! Have a look!"} }
npcHandler:addModule(VoiceModule:new(voices))

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

keywordHandler:addKeyword({'stuff'}, StdModule.say, {npcHandler = npcHandler, text = 'Just ask me for a {trade} to see my offers.'})
keywordHandler:addAliasKeyword({'wares'})
keywordHandler:addAliasKeyword({'offer'})



local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

local function showOffers(player)
    npcHandler:say("aqui está alguns dos itens que eu vendo: meat, fish, salmon, ham, dragon ham, pear, red apple, orange, banana, blueberry, cherry, melon, carrot, tomato, corncob, cookie, bread, roll, brown bread, egg, white mushroom, brown mushroom", player)
end

keywordHandler:addKeyword({'offer'}, showOffers)

shopModule:addBuyableItem({'meat'}, 2666, 5, 'meat')
shopModule:addBuyableItem({'fish'}, 2667, 5, 'fish')
shopModule:addBuyableItem({'salmon'}, 2668, 5, 'salmon')
shopModule:addBuyableItem({'ham'}, 2671, 8, 'ham')
shopModule:addBuyableItem({'dragon ham'}, 2672, 20, 'dragon ham')
shopModule:addBuyableItem({'pear'}, 2673, 4, 'pear')
shopModule:addBuyableItem({'red apple'}, 2674, 3, 'red apple')
shopModule:addBuyableItem({'orange'}, 2675, 10, 'orange')
shopModule:addBuyableItem({'banana'}, 2676, 3, 'banana')
shopModule:addBuyableItem({'blueberry'}, 2677, 1, 'blueberry')
shopModule:addBuyableItem({'cherry'}, 2679, 1, 'cherry')
shopModule:addBuyableItem({'melon'}, 2682, 8, 'melon')
shopModule:addBuyableItem({'carrot'}, 2684, 3, 'carrot')
shopModule:addBuyableItem({'tomato'}, 2685, 5, 'tomato')
shopModule:addBuyableItem({'corncob'}, 2686, 3, 'corncob')
shopModule:addBuyableItem({'cookie'}, 2687, 2, 'cookie')
shopModule:addBuyableItem({'bread'}, 2689, 4, 'bread')
shopModule:addBuyableItem({'roll'}, 2690, 2, 'roll')
shopModule:addBuyableItem({'brown bread'}, 2691, 3, 'brown bread')
shopModule:addBuyableItem({'egg'}, 2695, 2, 'egg')
shopModule:addBuyableItem({'white mushroom'}, 2787, 6, 'white mushroom')
shopModule:addBuyableItem({'brown mushroom'}, 2789, 10, 'brown mushroom')

npcHandler:addModule(FocusModule:new())
