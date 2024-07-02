function onCreate()
    makeLuaSprite("laboratory","backgrounds/finnbg/laboratory",-170,-300)
    scaleObject('laboratory', 1.2, 1.2, true)
    addLuaSprite("laboratory")

    makeAnimatedLuaSprite('pibby', 'characters/GFS/pibby', 2130,610)
    addAnimationByPrefix('pibby', 'idle', 'Pibby idle',24,false)
    setObjectOrder('pibby', 10)
    addLuaSprite('pibby')
end


function onBeatHit()
    if curBeat %2 == 0 then
        playAnim('pibby', 'idle', true)
    end
end


function rgbToHex(array)
    return (array[1] * 65536) + (array[2] * 256) + array[3]
end

local tags = {'JH1', 'JH2','JM1','JM2','JM3'}
function onEvent(n,v1,v2)
    if n == 'GBG' then
        if v1 == 'on' then
            for i = 1,#tags do
                setProperty(tags[i]..".colorTransform.color", rgbToHex(getProperty('dad.healthColorArray')))
            end

                setProperty("pibby.colorTransform.color", 0xea68fe)
                setProperty("gf.colorTransform.color", 0xffffff)

        elseif v1 == 'off' then
            for i = 1,#tags do

                resetColor(tags[i])

            end
                resetColor('pibby')
                resetColor('gf')
        end
    end
end


function resetColor(spr)
setProperty(spr..".colorTransform", nil)
local oa = getProperty(spr..".alpha")
setProperty(spr..".alpha", 0)
setProperty(spr..".alpha", oa)
end