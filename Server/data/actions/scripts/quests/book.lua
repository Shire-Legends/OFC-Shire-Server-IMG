function onUse(cid, item, frompos, item2, topos)

if item.uid == 1973 then
queststatus = getPlayerStorageValue(cid,1973)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You have found a Book.")
doPlayerAddItem(cid,1973,1)
doSendMagicEffect(topos,CONST_ME_MAGIC_BLUE)
doSendAnimatedText("Cleck!",topos,  TEXTCOLOR_ORANGE)
doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_BLUE)
setPlayerStorageValue(cid,1973,2)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
else
return 0
end
return 1
end
