target = false
function onEvent(n,v1,v2)
if n == 'camera_target' then
target = v1

if not (v2 == 'inst') then
setProperty('cameraSpeed', v2)
targetS = v2
else
targetS = getProperty('cameraSpeed')
runTimer('normallol', 0.05)
 setProperty('cameraSpeed', 10000)
end


end
end

function onTimerCompleted(t)
if t == 'normallol' then
setProperty('cameraSpeed', targetS)
end
end

function onUpdate()
if target == 'bf' then
cameraSetTarget('boyfriend')
elseif target == 'dad' then
cameraSetTarget('dad')
elseif target == 'gf' then

setProperty('camFollow.y', getMidpointY('gf') + (getProperty('gf.cameraPosition[1]') + getProperty('girlfriendCameraOffset[1]')))
setProperty('camFollow.x', getMidpointX('gf') + (getProperty('gf.cameraPosition[0]') + getProperty('girlfriendCameraOffset[0]')))
end
end