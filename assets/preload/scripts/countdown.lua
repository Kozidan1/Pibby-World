function onCreate()
    if songName == 'Rusted Steamboat' or songName == 'House of Mouse' then
        close(true)
    end
end


function onStartCountdown()
    if bpm > 120 and bpm < 150 then
        setProperty('countdownRate',1)
    end
end


function onCreatePost()
    makeAnimatedLuaSprite('count', 'intro')
    setObjectCamera('count', 'other')
    addAnimationByPrefix('count', 'Ready', 'Ready',24,false)
    addAnimationByPrefix('count', 'Set', 'Set',24,false)
    addAnimationByPrefix('count', 'Go', 'Go',24,false)
    screenCenter('count', 'xy')
    addOffset('count', 'Ready',100,-80)
    addOffset('count', 'Set',55,-90)
    addOffset('count', 'Go',0,0)
    setProperty("count.alpha",0)
    addLuaSprite('count',true)
end


function onCountdownTick(c)
    if c == 1 then
        setProperty('countdownReady.visible', false);
        playAnim('count','Ready',true)
        setProperty("count.alpha",1)

    elseif c == 2 then
        setProperty('countdownSet.visible', false)
        playAnim('count','Set',true)

    elseif c == 3 then
        setProperty('countdownGo.visible', false)
        playAnim('count','Go',true)

    elseif c == 4 then
        removeLuaSprite('count', true);

    end
end