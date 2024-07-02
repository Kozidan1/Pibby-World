function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'PibbySing' then
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
            setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true);

        if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
            setPropertyFromGroup("unspawnNotes", i, "multAlpha", 0)
            end
        end
    end
end