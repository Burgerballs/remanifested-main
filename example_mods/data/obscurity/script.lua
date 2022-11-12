function onUpdate(l)	

    if getProperty('health') > 0.05 then
        setProperty('health', getProperty('health')- (l / 10));
    end

end
function onUpdatePost()
    setProperty('scoreTxt.text', 'Score:' .. score)
    setProperty('scoreTxt.x', -300)
end