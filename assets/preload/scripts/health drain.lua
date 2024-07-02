function onCreate()
    if songName == 'wish-come-true' or dadName == 'FNF/corrupted-bf' then
        close(true)
    end
end

function opponentNoteHit()
    addHealth((getHealth() > 0.1 and -0.012))
end