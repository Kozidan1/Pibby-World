function opponentNoteHit(id, dir, noteType)
    if noteType == 'Bothchr' then
        triggerEvent('Play Animation', getProperty('singAnimations')[dir + 1], 'gf')
    end
end