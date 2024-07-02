function onCreate()
    precacheSound('slice')-- cool precache
    for i = 0, getProperty('unspawnNotes.length')-1 do-- general note stuff no one gives a fuck
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Sword Note' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'Sword');
            setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true);
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
        end
    end


    makeAnimatedLuaSprite('finn_attack', 'special_Anims/slash')
    addAnimationByPrefix('finn_attack', 'attack', 'Finn Slash',24,false)
    scaleObject('finn_attack', 0.9, 0.9)
    addLuaSprite('finn_attack')
    setProperty('finn_attack.offset.x', 80)
    setProperty('finn_attack.offset.y', 144)

end


function onCreatePost()--new finn assets for the attack anim only, to replace it with the actual finn
    setProperty('finn_attack.visible', false)

    setProperty('finn_attack.x', getProperty((dadName == 'AT/finn' and 'dad' or gfName == 'AT/finn' and 'gf')..'.x'))
 
    setProperty('finn_attack.y', getProperty((dadName == 'AT/finn' and 'dad' or gfName == 'AT/finn' and 'gf')..'.y'))

    setObjectOrder('gfGroup', 11)
    setObjectOrder('boyfriendGroup', 12)
    setObjectOrder('finn_attack', 13)
    setObjectOrder('dadGroup', 14)
end


function goodNoteHit(id, direction, noteType)
    if noteType == 'Sword Note' then
        playAnim('finn_attack', 'attack', true)
        setProperty('finn_attack.visible', true)--show fake finn
        triggerEvent('Play Animation', 'dodge', 'bf')

        setProperty((dadName == 'AT/finn' and 'dad' or gfName == 'AT/finn' and 'gf')..'.visible', false)

        playSound('slice', 0.2)
        runTimer('endanim', 0.48)-- timer to replace fake with real finn
        triggerEvent('Screen Shake', '0.1,0.03', '0.1,0.03')
    end
end


function onEvent(n,v1,v2)
    if n == 'GBG' then
        if v1 == 'on' then
            setProperty('finn_attack.colorTransform.color', 0xffffff)

    elseif v1 == 'off' then
        resetColor('finn_attack')

        end
    end
end

function resetColor(spr)
setProperty(spr..".colorTransform", nil)
local oa = getProperty(spr..".alpha")
setProperty(spr..".alpha", 0)
setProperty(spr..".alpha", oa)
end-- again,ne_eo is the GOAT


function noteMiss(id, direction, noteType)-- the same one above but now you get damage lol
    if noteType == 'Sword Note' then
        playAnim('finn_attack', 'attack', true)
        setProperty('finn_attack.visible', true)
        setProperty((dadName == 'AT/finn' and 'dad' or gfName == 'AT/finn' and 'gf')..'.visible', false)

        triggerEvent('Play Animation','hit','bf')

        playSound('slice', 0.2)
        runTimer('endanim', 0.48)
        runTimer('endanimbf', 0.42)
        triggerEvent('Screen Shake', '0.1,0.03', '0.1,0.03')
        setProperty('health', getProperty('health') - 0.3)
    end
end


function onTimerCompleted(t)
    if t == 'endanim' then
        setProperty('finn_attack.visible', false)
        setProperty((dadName == 'AT/finn' and 'dad' or gfName == 'AT/finn' and 'gf')..'.visible', true)
    end
end