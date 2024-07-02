function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'bullet')
            setPropertyFromGroup('unspawnNotes', i, 'offset.x', -3)
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled',true)
		end
	end

    for i = 1,4 do

        makeAnimatedLuaSprite('splash'..i, 'bullet_splashes')

        setObjectCamera('splash'..i, 'hud')
        setProperty('splash'..i..'.visible', false)
        scaleObject('splash'..i,0.8,0.8)
        addLuaSprite('splash'..i, true)
    end
    addAnimationByPrefix('splash1', 'play', 'note splash purple ', 24, false)
    addAnimationByPrefix('splash2', 'play', 'note splash blue ', 24, false)
    addAnimationByPrefix('splash3', 'play', 'note splash green ', 24, false)
    addAnimationByPrefix('splash4', 'play', 'note splash red ', 24, false)

end

function onCreatePost()
    for i = 1,4 do
        setProperty('splash'..i..'.visible', false)
    end
end


function onUpdatePost()
    for iS = 1,4 do
    setProperty('splash'..iS..'.x', getPropertyFromGroup('playerStrums', iS - 1, 'x') - 120)
    setProperty('splash'..iS..'.y', getPropertyFromGroup('playerStrums', iS - 1, 'y') - 100)
    end
end

dir = 0
function goodNoteHit(id, dir, noteType, isSustainNote)
    if noteType == 'Bullet' and not isSustainNote then
        addHealth(0.2)
        playAnim('splash'..dir + 1, 'play', true)
        setProperty('splash'..dir + 1 ..'.visible', true)
        runTimer('splashhide'..dir + 1, 0.6)
        if boyfriendName == 'PLAYABLE/bf-pirate-final' then
            triggerEvent('Play Animation','shoot','bf')
        end
    end
end

function onTimerCompleted (tag)
    if tag == 'splashhide4' then
        setProperty('splash4.visible', false)

    elseif tag == 'splashhide3' then
        setProperty('splash3.visible', false)

    elseif tag == 'splashhide2' then
        setProperty('splash2.visible', false)

    elseif tag == 'splashhide1' then
        setProperty('splash1.visible', false)

    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if noteType == 'Bullet' and not isSustainNote then
        addHealth(-0.2)
    end
end