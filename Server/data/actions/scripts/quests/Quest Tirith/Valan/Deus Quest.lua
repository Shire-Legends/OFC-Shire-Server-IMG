function onUse(cid, item, frompos, item2, topos)

voc = getPlayerVocation(cid)
queststatus = getPlayerStorageValue(cid,2354)

if voc == 9 then
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� recebeu o Espirito de um Deus.")
local item1 = doPlayerAddItem(cid,7374,1)
doSetItemSpecialDescription(item1, "Esse item � uma recorda��o com a voca��o Dark Wyzard\'s." .. getPlayerName(cid) .. "  Obrigado pela Deus Quest.")
doSendMagicEffect(topos,CONST_ME_MAGIC_BLUE)
doSendAnimatedText(topos, "Cleck!", TEXTCOLOR_LIGHTGREEN)
doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_BLUE)
doShowTextDialog(cid,2180,"Parab�ns ao ter chegado aqui, agora crie um novo jogador e esse spirit of Deus no seu novo char level 8 ele ira ser seu novo Deus.")
setPlayerStorageValue(cid,7374,1)
else
doPlayerSendTextMessage(cid,22,"Est� vazio, voc� j� completou essa miss�o.")
end
elseif voc == 10 then
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� recebeu o Espirito de um Deus.")
local item1 = doPlayerAddItem(cid,7373,1)
doSetItemSpecialDescription(item1, "Esse item � uma recorda��o com a voca��o Elemental Cleric\'s." .. getPlayerName(cid) .. "  Obrigado pela Deus Quest.")
doSendMagicEffect(topos,CONST_ME_MAGIC_BLUE)
doSendAnimatedText(topos, "Cleck!", TEXTCOLOR_LIGHTGREEN)
doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_BLUE)
doShowTextDialog(cid,2180,"Parab�ns ao ter chegado aqui, agora crie um novo jogador e esse spirit of Deus no seu novo char level 8 ele ira ser seu novo Deus.")
setPlayerStorageValue(cid,7373,1)
else
doPlayerSendTextMessage(cid,22,"Est� vazio, voc� j� completou essa miss�o.")
end
elseif voc == 11 then
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� recebeu o Espirito de um Deus.")
local item1 = doPlayerAddItem(cid,7375,1)
doSetItemSpecialDescription(item1, "Esse item � uma recorda��o com a voca��o Elven Ranger\'s." .. getPlayerName(cid) .. "  Obrigado pela Deus Quest.")
doSendMagicEffect(topos,CONST_ME_MAGIC_BLUE)
doSendAnimatedText(topos, "Cleck!", TEXTCOLOR_LIGHTGREEN)
doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_BLUE)
doShowTextDialog(cid,2180,"Parab�ns ao ter chegado aqui, agora crie um novo jogador e esse spirit of Deus no seu novo char level 8 ele ira ser seu novo Deus.")
setPlayerStorageValue(cid,7375,1)
else
doPlayerSendTextMessage(cid,22,"Est� vazio, voc� j� completou essa miss�o.")
end
elseif voc == 12 then
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� recebeu o Espirito de um Deus.")
local item1 = doPlayerAddItem(cid,7376,1)
doSetItemSpecialDescription(item1, "Esse item � uma recorda��o com a voca��o Dragon Slayer\'s." .. getPlayerName(cid) .. "  Obrigado pela Deus Quest.")
doSendMagicEffect(topos,CONST_ME_MAGIC_BLUE)
doSendAnimatedText(topos, "Cleck!", TEXTCOLOR_LIGHTGREEN)
doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_BLUE)
doShowTextDialog(cid,2180,"Parab�ns ao ter chegado aqui, agora crie um novo jogador e esse spirit of Deus no seu novo char level 8 ele ira ser seu novo Deus.")
setPlayerStorageValue(cid,7376,1)
else
doPlayerSendTextMessage(cid,22,"Est� vazio, voc� j� completou essa miss�o.")
end
else
doPlayerSendTextMessage(cid,22,"Desculpe, mas voc� n�o tem voca��o necess�ria.")
return 0
end
return 1
end
