
Time = 50
CAamount = 0
function onStepHit()
    if curStep == 1808 then
setSpriteShader("Shader1", "Glitchy")
setSpriteShader("Shader2", "shift glitch")

makeLuaSprite("Shader3")
setSpriteShader("Shader3", "chrom")

runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);

game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);
		]])

setShaderFloat("Shader1", "AMT", 0)
setShaderFloat("Shader1", "SPEED", 0)

setShaderFloat("Shader2", "offsetIntensity", 0)
setShaderFloat("Shader2", "noiseQuality",100)

setShaderFloat("Shader3", "amount", 0)
    elseif curStep == 1953 then
        setShaderFloat("Shader3", "amount", 0)
    end
end

function onBeatHit()
    if curStep > 1808 and curStep <= 1952 then
        if curBeat %8 == 6 then
            Time = 5
            CAamount = 3
        end

        if curBeat %8 == 0 then
            Time = 0.1
            CAamount = 0
        end
    end
end

amount = 0
function onUpdatePost()
    if curStep >= 1808 and curStep <= 1952 then
        setShaderFloat('Shader3', "amount", amount)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'glitch_note' then
        amount = 0
    end
end

function boundTo(value, min, max)
return math.max(min, math.min(max, value))
end
function math.lerp(from,to,i)
return from+(to-from)*i
end


function onUpdate(elapsed)
if curStep >= 1808 and curStep <= 1952 then
amount = math.lerp(amount, CAamount + 0.000001, boundTo(elapsed * 10 / Time, 0, 500));
end
end