function mysplit (inputstr, sep)
if sep == nil then
sep = "%s";
end
local t = {};
for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
table.insert(t, str);
end
return t;
end


function onEvent(n,v1,v2)
local table = mysplit(v1,",");
local tabledos = mysplit(v2,",");
if n == 'Camera zoom with tween' then
doTweenZoom('zoomeventvalue', 'camGame', tabledos[2], tabledos[1], table[1])
setProperty('defaultCamZoom', tabledos[2])
lockcam = true
end
end

function onTweenCompleted(t)--i love taking shit
    if t == 'zoomeventvalue' then
        lockcam = false
    end
end


function onUpdatePost()
	if lockcam and getProperty('camZooming') == true and not songName == 'Familiar' then
		setProperty('camZooming', false)
		elseif not lockcam and getProperty('camZooming') == false then
		setProperty('camZooming', true)
	end
end