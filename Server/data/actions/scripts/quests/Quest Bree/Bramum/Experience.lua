local condition = createConditionObject(CONDITION_ENERGY)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 0, 0, 0)

function onUse(cid, item, frompos, item2, topos)

queststatus = getPlayerStorageValue(cid,5100)
EXP = math.random(1000000,2000000)
PlayerLevel = getPlayerLevel(cid)

if PlayerLevel > 49 then
if queststatus == -1 then
doPlayerAddExp(cid,EXP)
cid:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
doAddCondition(cid, condition)
doPlayerSendTextMessage(cid,20,'Voc� recebeu ' .. EXP .. ' de experi�ncia.')
doSendAnimatedText("EXP!", cid:getPosition(),179)
setPlayerStorageValue(cid,5100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
else
doPlayerSendTextMessage(cid,20,'Desculpe, voc� n�o tem n�vel suficiente.')
end
end