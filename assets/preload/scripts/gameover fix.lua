function onCreate()
if songName == 'Black Mark' or songName == 'Treasure Island' then
    close(true)
end

    if boyfriendName == 'PLAYABLE/survivor-bf' then
        setPropertyFromClass('GameOverSubstate', 'characterName', 'Game_Overs/bf-dead')
    elseif boyfriendName == 'PLAYABLE/yodi-bf' then
        setPropertyFromClass('GameOverSubstate', 'characterName', 'Game_Overs/bf-yodi-death')
    end
end


function onGameOverStart()
    setScrollFactor('boyfriend', 0,0)
    if boyfriendName ~= 'PLAYABLE/yodi-bf' then
        screenCenter('boyfriend', 'xy')
    else
        setProperty('boyfriend.x',350)
        setProperty('boyfriend.y',200)
    end
    setShaderFloat("Shader1", "AMT", 0.03)
    setShaderFloat("Shader1", "SPEED", 1)
end


function onGameOverConfirm(retry)
    setShaderFloat("Shader1", "AMT", 0)
    setShaderFloat("Shader1", "SPEED", 0)
    doTweenAlpha('fadeIn','boyfriend',0,2,'quadIn')
end