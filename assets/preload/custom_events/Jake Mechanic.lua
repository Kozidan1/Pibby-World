--[[fully made jakes hand pc mechanic by latter, sorry tinny or fuck you idfk lol]]
function onCreatePost()
--jake right hand
makeAnimatedLuaSprite('JH1', 'Jake_Hands', getProperty('dad.x') + 470,getProperty('dad.y') + 130)
addAnimationByPrefix('JH1', 'spawn', 'Jake Mechanic Spawn',24,false)
addAnimationByPrefix('JH1', 'idle', 'Jake Mechanic Idle',24,true)
addAnimationByPrefix('JH1', 'charge', 'Jake Mechanic Charge0',24,false)
addAnimationByPrefix('JH1', 'chargeI', 'Jake Mechanic Charged Idle',24,true)


scaleObject('JH1', 0.8,0.8,true)
setProperty('JH1.visible', false)
addLuaSprite('JH1', false)

    if songName == 'Together Forever' then
        setObjectOrder('JH1',getObjectOrder('boyfriendGroup') + 1)
    end

---------------------------------------------
---------------------------------------------
---------------------------------------------
--jake left hand
makeAnimatedLuaSprite('JH2', 'Jake_Hands', getProperty('dad.x') - 200,getProperty('dad.y') + 130)
addAnimationByPrefix('JH2', 'spawn', 'Jake Mechanic Spawn',24,false)
addAnimationByPrefix('JH2', 'idle', 'Jake Mechanic Idle',24,true)
addAnimationByPrefix('JH2', 'charge', 'Jake Mechanic Charge0',24,false)
addAnimationByPrefix('JH2', 'chargeI', 'Jake Mechanic Charged Idle',24,true)

scaleObject('JH2', 0.8,0.8,true)--yes there's updatehitbox in lua by putting true
setProperty('JH2.flipX', true)
setProperty('JH2.visible', false)
addLuaSprite('JH2', false)
---------------------------------------------
---------------------------------------------
---------------------------------------------
--jake cover notes hand1
makeAnimatedLuaSprite('JM1', 'Jake_Mechanic2',900,-100)
addAnimationByPrefix('JM1', 'spawn', 'Jake Mechanic2 Charge',24,false)
addAnimationByPrefix('JM1', 'idle', 'Jake Mechanic2 Idle',24,true)
setObjectCamera('JM1', 'hud')
scaleObject('JM1', 0.5, 0.5,true)
setProperty('JM1.visible', false)
addLuaSprite('JM1', true)
---------------------------------------------
---------------------------------------------
---------------------------------------------
--jake cover notes hand2
makeAnimatedLuaSprite('JM2', 'Jake_Mechanic2ALT',930,370)
addAnimationByPrefix('JM2', 'spawn', 'Jake Mechanic2 Alt Charge',24,false)
addAnimationByPrefix('JM2', 'idle', 'Jake Mechanic2 Alt Idle',24,true)
setObjectCamera('JM2', 'hud')
scaleObject('JM2', 0.5, 0.5,true)
setProperty('JM2.visible', false)
addLuaSprite('JM2', true)
---------------------------------------------
---------------------------------------------
---------------------------------------------
--jake health draining hand
makeAnimatedLuaSprite('JM3', 'Jake_HealthDrain',0,getProperty('iconP1.y') + 20)
if downscroll then
makeAnimatedLuaSprite('JM3', 'Jake_HealthDrain',0,getProperty('iconP1.y') - 160)
setProperty('JM3.flipY', true)
end
addAnimationByPrefix('JM3', 'spawn', 'Jake Drain Start',24,false)
addAnimationByPrefix('JM3', 'idle', 'Jake Drain Idle',24,true)
addAnimationByPrefix('JM3', 'leave', 'Jake Drain Leave',20,false)

setObjectCamera('JM3', 'hud')
scaleObject('JM3', 0.5, 0.5,true)
setProperty('JM3.visible', false)
addLuaSprite('JM3', true)

end


function onEvent(n,v1,v2)
if n == 'Jake Mechanic' then
if v1 == 'Spawn' then--spawn hands
playAnim('JH1', 'spawn', true)
setProperty('JH1.visible', true)
playAnim('JH2', 'spawn', true)
setProperty('JH2.visible', true)
runTimer('play_idle1', 0.4)
runTimer('play_idle2', 0.4)
end



if v1 == 'RetreatR' then--hide jakes right hand
playAnim('JH1', 'charge', true, true)--second true to reverse the animations
playAnim('JM1', 'spawn', true, true)
playAnim('JM2', 'spawn', true, true)
runTimer('remov_charge1', 0.4)
elseif v1 == 'RetreatL' then--hide jakes left hand
Drain = false
playAnim('JH2', 'charge', true, true)
playAnim('JM3', 'leave', true)
runTimer('remov_charge2', 0.4)
elseif v1 == 'RetreatBoth' then--hide both hands
playAnim('JH1', 'charge', true, true)
playAnim('JM1', 'spawn', true, true)
playAnim('JM2', 'spawn', true, true)
playAnim('JM3', 'leave', true)
runTimer('remov_charge1', 0.4)
Drain = false
playAnim('JH2', 'charge', true, true)
runTimer('remov_charge2', 0.4)
end



if v1 == 'attackR' then--cover note
playAnim('JH1', 'charge', true)
runTimer('play_chargeI1', 0.4)

elseif v1 == 'attackL' then--drain health
playAnim('JH2', 'charge', true)
runTimer('play_chargeI2', 0.4)

elseif v1 == 'attackBoth' then--both attacks
playAnim('JH1', 'charge', true)
playAnim('JH2', 'charge', true)
runTimer('play_chargeI1', 0.4)
runTimer('play_chargeI2', 0.4)

end
end
end

Drain = false
function onUpdatePost()
setProperty('JM3.x', getProperty('iconP1.x') + 20)--jakes drain health hand follows bfs icon
setProperty('JM3.alpha', getProperty('iconP1.alpha'))--jakes drain health hand fades with bf icon


if Drain and songName == 'Elastic Destruction' then--enable/disable the health drain
setProperty('health', getProperty('health') - 0.003)
end

--this all to put the right offsets on different animations
if getProperty('JH1.animation.curAnim.name') == 'charge' then--when play animation then
setProperty('JH1.offset.x', 20)
setProperty('JH1.offset.y', -270)
elseif getProperty('JH1.animation.curAnim.name') == 'chargeI' then
setProperty('JH1.offset.x', 30)
setProperty('JH1.offset.y', -293)
elseif getProperty('JH1.animation.curAnim.name') == 'spawn' then
setProperty('JH1.offset.x', 0)
setProperty('JH1.offset.y', 0)
elseif getProperty('JH1.animation.curAnim.name') == 'idle' then
setProperty('JH1.offset.x', 0)
setProperty('JH1.offset.y', -200)
end
---------------------------------------------
---------------------------------------------
---------------------------------------------
if getProperty('JH2.animation.curAnim.name') == 'charge' then
setProperty('JH2.offset.x', 100)
setProperty('JH2.offset.y', -260)
elseif getProperty('JH2.animation.curAnim.name') == 'chargeI' then
setProperty('JH2.offset.x', 40)
setProperty('JH2.offset.y', -290)
elseif getProperty('JH2.animation.curAnim.name') == 'spawn' then
setProperty('JH2.offset.x', 0)
setProperty('JH2.offset.y', 0)
elseif getProperty('JH2.animation.curAnim.name') == 'idle' then
setProperty('JH2.offset.x', 40)
setProperty('JH2.offset.y', -200)
end
end


function onTimerCompleted(tag)--timers
if tag == 'play_idle1' then--idle for right hand
playAnim('JH1', 'idle', true)
elseif tag == 'play_idle2' then--idle for left hand
playAnim('JH2', 'idle', true)



elseif tag == 'remov_charge1' then--play the spawn animations on reverse and hide the hud hands
playAnim('JH1', 'spawn', true, true)
setProperty('JM1.visible', false)
setProperty('JM2.visible', false)
runTimer('Retreat_hands1', 0.36)
elseif tag == 'remov_charge2' then
playAnim('JH2', 'spawn', true, true)
setProperty('JM3.visible', false)
runTimer('Retreat_hands2', 0.36)


elseif tag == 'play_chargeI1' then--play idle and show the hud hands
playAnim('JH1', 'chargeI', true)
playAnim('JM1', 'spawn', true)
playAnim('JM2', 'spawn', true)
setProperty('JM1.visible', true)
setProperty('JM2.visible', true)
runTimer('play_M_Idle', 0.36)
elseif tag == 'play_chargeI2' then--play idle and show the draining health hand
playAnim('JH2', 'chargeI', true)
setProperty('JM3.visible', true)
playAnim('JM3', 'spawn', true)
runTimer('drain', 0.2)

elseif tag == 'drain' then--start draining
Drain = true
playAnim('JM3', 'idle', true)
elseif tag == 'play_M_Idle' then--play idle for hud hands
playAnim('JM1', 'idle', true)
playAnim('JM2', 'idle', true)


elseif tag == 'Retreat_hands1' then--delete right hand
setProperty('JH1.visible', false)
elseif tag == 'Retreat_hands2' then--delete left hand
setProperty('JH2.visible', false)
end
end

function goodNoteHit()--stoping bf from gaining health when the health drain mechanic is active
if Drain and getHealth() > 0.03 then--enable/disable helth draining
setProperty('health', getProperty('health') - 0.011)--0.023 is the default amount for gaining health when the player hit there note
end
end