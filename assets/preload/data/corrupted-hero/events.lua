function onCreate()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
end

function onStepHit()
    if curStep == 540 or curStep == 924 or curStep == 1564 then
        doTweenAlpha('1cam','camGame',0,0.5,'expoOut')
        doTweenAlpha('2cam','camHUD',0,0.5,'expoOut')
    elseif curStep == 544 or curStep == 928 or curStep == 1568 then
        doTweenAlpha('1cam','camGame',1,1,'expoOut')
        doTweenAlpha('2cam','camHUD',1,1,'expoOut')
    end
end


function onEvent(n,v1,v2)
    if n == 'camera_target' then
        if v1 == 'all' then
            folowcam = true
        else
            folowcam = false
        end
    end

    if n == 'GBG' then
        if v1 == 'on' then
            setProperty('laboratory.visible',false)
            else
            setProperty('laboratory.visible',true)
        end
    end
end


folowcam = false
camX = 1300
camY = 600
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end
end