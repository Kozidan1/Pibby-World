
function onCreatePost()
makeLuaSprite('ffade', nil, -2, -2)
makeGraphic('ffade', screenWidth+4, screenHeight+4, 'ffffff')
setProperty('ffade.alpha', 0)
setObjectCamera('ffade', 'other')
addLuaSprite('ffade', false)
end

function onEvent(name, value1, value2)
if name == 'Flashfade' then
doTweenAlpha('nsiw177', 'ffade', 1, value1, 'linear')
speedval = value2

end
end

function onTweenCompleted(t)
if t == 'nsiw177' then
doTweenAlpha('nsiwejue177', 'ffade', 0, speedval, 'linear')

end
end
