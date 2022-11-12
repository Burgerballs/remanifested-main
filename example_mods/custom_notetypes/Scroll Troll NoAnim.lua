function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Scroll Troll NoAnim' then
			setPropertyFromGroup('unspawnNotes', i, 'NoAnimation', true)
			setPropertyFromGroup('unspawnNotes', i, 'multSpeed', math.random(75,125) / 100)
		end
	end
end