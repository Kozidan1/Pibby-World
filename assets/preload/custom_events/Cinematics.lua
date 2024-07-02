
local hideHud = {'iconP1', 'iconP2', 'scoreTxt', 'healthBar', 'healthBarBG', 'timeBar', 'timeBarBG', 'timeTxt'}
local tagbar = {'UpperBar', 'LowerBar'}
function onCreate()

    makeLuaSprite('UpperBar', nil, -100, -720)
    makeLuaSprite('LowerBar', nil, -100, 720)

    for i = 1,2 do
        makeGraphic(tagbar[i], screenWidth * 1.12, screenHeight, '000000')
        setObjectCamera(tagbar[i], 'hud')
        addLuaSprite(tagbar[i])
    end
end


function onCreatePost()
    NOY = getPropertyFromGroup('strumLineNotes', 0, 'y')
    UOY = getProperty('UpperBar.y')
    LOY = getProperty('LowerBar.y')
    
end


function onEvent(name, value1, value2)
	if name == 'Cinematics' then
        doTweenY('BarMove1', 'UpperBar', UOY + value2, value1, 'sineInOut')
        doTweenY('BarMove2', 'LowerBar', LOY - value2, value1, 'sineInOut')

        for i = 0,7 do
            if tonumber(value2) ~= 0 then
                if downscroll then
                    noteTweenY('NoteMove'..i,i, NOY - value2 + 40, value1, 'sineInOut')
                else
                    noteTweenY('NoteMove'..i,i, NOY + value2 - 40, value1, 'sineInOut')
                end

            else
                noteTweenY('NoteMove'..i,i, NOY, value1, 'sineInOut')
            end
         end

        for i = 1,#hideHud do

            if tonumber(value2) ~= 0 then
                doTweenAlpha('HudAlpha'..i, hideHud[i], 0, value1 / 2, 'sineInOut')
            else
                doTweenAlpha('HudAlpha'..i, hideHud[i], 1, value1, 'sineInOut')
            end
        end
	end
end