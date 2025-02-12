local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
    npcHandler:onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
    npcHandler:onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)
    npcHandler:onCreatureSay(cid, type, msg)
end

function onThink()
    npcHandler:onThink()
	randsay = math.random(1,100)
	if randsay == 1 then
		selfSay('Ajuda!')
	   end
	   if randsay == 50 then
		selfSay('Algu�m me ajuda!')
	   end
	   if randsay == 100 then
		selfSay('Me ajuda por favor!')
	   end
end

local function greetCallback(cid)
    -- count[cid], transfer[cid] = nil, nil
    return true
end

local topicList = {
    NONE = 0,
    PROMOTE = 1,
    MISSIONWORM = 2,
    MISSIONSTRAWBARRY = 3,
    MISSIONTEST = 4,

}

local itensQuest = {
	morango = 2680,
	darkCogumelo = 2792,
	minhoca = 3976,
	money = 2152
}

local questNumber = {
	PROMOTE = 30038,
}

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if msgcontains(msg, 'yes') then
        npcHandler:say("Consegue abrir a porta e me tirar daqui ?", cid)
        npcHandler.topic[cid] = topicList.PROMOTE
    elseif npcHandler.topic[cid] == topicList.PROMOTE then
		if msgcontains(msg,"yes") and player:getStorageValue(questNumber.PROMOTE) == 2 then
        	npcHandler:say("�timo tire-me daqui ent�o...", cid)
		elseif msgcontains(msg, "no") and player:getStorageValue(questNumber.PROMOTE) == 2 then
        	npcHandler:say("Entendo, ent�o pe�o que fale com a rainha e pe�a para ela enviar a guarda real", cid)
			doPlayerSendTextMessage(cid,22,"Quest 'O Resgate de sarina!' atualiza.")
			player:setStorageValue(questNumber.PROMOTE, 3)
		else
			npcHandler:say("voc� falou com fartur ?, fale com ele!.", cid)
		end
        return true
	elseif npcHandler.topic[cid] == topicList.MISSIONTEST then

		return true
	end
end

npcHandler:setMessage(MESSAGE_GREET, "Ol�, voc� foi enviado por minha m�e?!")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())


