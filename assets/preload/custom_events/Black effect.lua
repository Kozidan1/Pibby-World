function onCreatePost()
makeLuaSprite('flashbla', '', -2, -2);
makeGraphic('flashbla',screenWidth+4,screenHeight+4,'ffffff')
addLuaSprite('flashbla', true);
setBlendMode('flashbla', 'SUBTRACT')
setObjectCamera('flashbla', 'other')
setProperty('flashbla.alpha',0)
end

function onEvent(n,v1,v2)
if n == 'Black effect' then
setProperty('flashbla.alpha',1)
doTweenAlpha('flTdw','flashbla',0,v1)
end
end
