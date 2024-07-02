function onEvent(name, value1, value2)
if name == 'Flash Camera' then
makeLuaSprite('flash', '', -2, -2);
makeGraphic('flash',screenWidth+4,screenHeight+4,'ffffff')
addLuaSprite('flash', false);
setObjectCamera('flash', 'other')
setBlendMode('flash', 'add')
setProperty('flash.alpha',value2)
if value2 == '' then
setProperty('flash.alpha',1)
end

doTweenAlpha('flTw','flash',0,value1,'linear')
end
end
