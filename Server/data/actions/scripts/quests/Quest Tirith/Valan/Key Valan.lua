function onUse(cid, item, frompos, item2, topos)

if item.uid == 7573 then
	queststatus = getPlayerStorageValue(cid,7573)
	if queststatus == -1 then
	doPlayerSendTextMessage(cid,22,"You have found King Key")
	key_uid = doPlayerAddItem(cid,2091,1)
	doSetItemActionId(key_uid,2091)
	doSendMagicEffect(topos,CONST_ME_MAGIC_BLUE)
	doSendAnimatedText(topos, "Cleck!", TEXTCOLOR_ORANGE)
	doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_BLUE)
	setPlayerStorageValue(cid,7573,1)
	else
	doPlayerSendTextMessage(cid,22,"It is empty.")
	end
	else
	return 0
   	end
   return 1
end

