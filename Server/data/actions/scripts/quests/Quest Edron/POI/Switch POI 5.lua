function onUse(cid, item, frompos, item2, topos)
piece1pos = {x=648, y=639, z=11, stackpos=1}
rockpos = {x=648, y=639, z=11, stackpos=1}
rockpos2 = {x=660, y=586, z=12, stackpos=1}
getpiece1 = getThingfromPos(piece1pos)

if item.actionid == 109 and item.itemid == 1945 and getpiece1.itemid == 1354 then
doRemoveItem(getpiece1.uid,1)
doSendMagicEffect(getPlayerPosition(cid),13)
doPlayerSendTextMessage(cid,22,"get hear on something open.")
doTransformItem(item.uid,item.itemid+1)
elseif item.actionid == 109 and item.itemid == 1946 then
doPlayerSendTextMessage(cid,22,"get hear on something open.")
doTransformItem(item.uid,item.itemid-0)
else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end
