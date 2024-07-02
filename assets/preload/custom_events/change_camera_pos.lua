--script by latter you're not allowed to use this unless you have my permission
function onCreatePost()--getting the original values for the cameras x and y
originalCamXPosDad = getProperty('dad.cameraPosition[0]')--dad x
originalCamYPosDad = getProperty('dad.cameraPosition[1]')--dad y

originalCamXPosBf = getProperty('boyfriend.cameraPosition[0]')--bf x
originalCamYPosBf = getProperty('boyfriend.cameraPosition[1]')--bf y

originalCamXPosGf = getProperty('gf.cameraPosition[0]')--gf x
originalCamYPosGf = getProperty('gf.cameraPosition[1]')--gf y
end

function onEvent(n, v1, v2)
if n == 'change_camera_pos' or n == 'change camera pos' then--in case the file uses spaces instead of underscore
if v1 == 'x,dad' then--if you want dad x
setProperty('dad.cameraPosition[0]', originalCamXPosDad + v2)
elseif v1 == 'x,bf' then--if you want bf x
setProperty('boyfriend.cameraPosition[0]', originalCamXPosBf + v2)

elseif v1 == 'x,gf' then--if you want gf x
setProperty('gf.cameraPosition[0]', originalCamXPosGf + v2)
end


if v1 == 'y,dad' then--if you want dad y
setProperty('dad.cameraPosition[1]', originalCamYPosDad + v2)
elseif v1 == 'y,bf' then--if you want bf y
setProperty('boyfriend.cameraPosition[1]', originalCamYPosBf + v2)

elseif v1 == 'y,gf' then--if you want gf y
setProperty('gf.cameraPosition[1]', originalCamYPosGf + v2)
end


end


if n == 'Change Character' then
restartCamOrigin()
end
end


function restartCamOrigin()
originalCamXPosDad = getProperty('dad.cameraPosition[0]')--dad x
originalCamYPosDad = getProperty('dad.cameraPosition[1]')--dad y

originalCamXPosBf = getProperty('boyfriend.cameraPosition[0]')--bf x
originalCamYPosBf = getProperty('boyfriend.cameraPosition[1]')--bf y

originalCamXPosGf = getProperty('gf.cameraPosition[0]')--gf x
originalCamYPosGf = getProperty('gf.cameraPosition[1]')--gf y
end