function onCreate()

if songName == 'Black Mark' or songName == 'treasure island' or boyfriendName == 'PLAYABLE/yodi-bf' then
    close(true)
end

    precacheSound('shoot')
    precacheSound('gunclick')
end

function onCreatePost()
    makeLuaText('bullet_counter', 
[[
]]..bullets..[[ bullets
 remaining
]]


    , 0, getProperty('healthBar.x') + 650,getProperty('healthBar.y') - 25)
    setTextSize('bullet_counter',30)
    setTextFont('bullet_counter','bullet counter.ttf')
    setProperty('bullet_counter.alpha',0)
    addLuaText('bullet_counter')

end


bullets = 10
cooldown = false
textRed = true
function onUpdatePost()
    if keyJustPressed('space') and cooldown == false and getProperty('camGame.alpha') == 1 and getProperty('camHUD.alpha') == 1 and getProperty('healthBar.alpha') == 1 and getProperty('camGame.visible') == true and getProperty('camHUD.visible') == true and getProperty('healthBar.visible') == true then
        runTimer('hideText',3)
        if bullets > 0 then

            if dadName ~= 'SU/shield-steven' then
                addHealth(0.2)
            end

            if dadName == 'SU/shield-steven' then
                playAnim('Steven_block','Block',true)
                setProperty('Steven_block.visible', true)
                setProperty('dad.visible', false)
                runTimer('endanim', 0.95)
            end

            cooldown = true
            cancelTween('hideText')
            setProperty('bullet_counter.alpha',1)
            if dadName ~= 'FNF/corrupted-gf' then
                triggerEvent('Play Animation','attack','bf')
                playSound('shoot', 1)

                bullets = bullets - 1
                setTextString('bullet_counter',
[[
]]..bullets..[[ bullets
 remaining
]])
                cameraShake('camGame',0.05,0.05)
                cameraShake('camHUD',0.05,0.05)
            else
                setTextString('bullet_counter',
[[
i can't...
]])
            end

            runTimer('cooldown',1)
        else
            if dadName ~= 'FNF/corrupted-gf' then
                triggerEvent('Play Animation','singRIGHTmiss','bf')
                playSound('gunclick', 1)
                cooldown = true
                cancelTween('hideText')
                setProperty('bullet_counter.alpha',1)
                setTextString('bullet_counter',
[[
]]..bullets..[[ bullets
 remaining
]])
                runTimer('flash',0.1,6)
            else
                setTextString('bullet_counter',
[[
i can't...
]])
            end
                runTimer('cooldown',1)
        end
    end
end


function onTimerCompleted(t)
    if t == 'cooldown' then
        cooldown = false
    elseif t == 'flash' then
        setTextBorder('bullet_counter', 1, (textRed == true and 'ff0a0a' or textRed == false and '000000'))
        textRed = (textRed == true and false or textRed == false and true)
    elseif t == 'hideText' then
        doTweenAlpha('hideText','bullet_counter',0,1)
    elseif t == 'endanim' then
        setProperty('Steven_block.visible', false)
        setProperty('dad.visible', true)
    end
end