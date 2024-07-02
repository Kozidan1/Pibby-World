--by latter
function onCreate()
    makeAnimatedLuaSprite('GBG', 'Glitch_Bg')
    addAnimationByPrefix('GBG', 'idle', 'Bg Glitch',24,true)
    scaleObject('GBG', 2.5,2.5)
    addLuaSprite('GBG')
    screenCenter('GBG','xy')
    setScrollFactor('GBG', 0, 0)
    setSpriteShader("GBG", "saturation")
    setShaderFloat('GBG','contrast',1)
    setShaderFloat('GBG','saturation',2)
    setShaderFloat('GBG','brightness',0)
end

function onCreatePost()
    setProperty('GBG.visible', false)
end



function rgbToHex(array)
    return (array[1] * 65536) + (array[2] * 256) + array[3]
end--ne_eo IS THE GOAT


local chr = {'dad', 'boyfriend', 'gf'}
local hideHud = {'iconP1', 'iconP2', 'scoreTxt', 'healthBar', 'healthBarBG', 'timeBar', 'timeBarBG', 'timeTxt'}
function onEvent(n,v1)
    if n == 'GBG' then
        if v1 == 'on' then
            setProperty('GBG.visible', true)
            for i = 1,#hideHud do
                setProperty(hideHud[i]..'.visible', false)
            end

            for i = 1,#chr do
                setProperty(chr[i]..".colorTransform.color", rgbToHex(getProperty(chr[i]..'.healthColorArray')))
            end

        elseif v1 == 'off' then

            setProperty('GBG.visible', false)
            for i = 1,#hideHud do
                setProperty(hideHud[i]..'.visible', true)
            end

            for i = 1,#chr do
                resetColor(chr[i])
            end


        end
    end
end


function resetColor(spr)
setProperty(spr..".colorTransform", nil)
local oa = getProperty(spr..".alpha")
setProperty(spr..".alpha", 0)
setProperty(spr..".alpha", oa)
end-- again,ne_eo is the GOAT