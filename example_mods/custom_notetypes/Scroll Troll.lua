function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Scroll Troll' then
			setPropertyFromGroup('unspawnNotes', i, 'multSpeed', math.random(75,150) / 100)
		end
	end
end