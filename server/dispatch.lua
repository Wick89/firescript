--================================--
--       FIRE SCRIPT v1.6.10      --
--  by GIMI (+ foregz, Albo1125)  --
--      License: GNU GPL 3.0      --
--================================--

Dispatch = {
	players = {},
	lastNumber = 0,
	__index = self,
	init = function(object)
		object = object or {players = {}, lastNumber = 0}
		setmetatable(object, self)
		return object
	end
}

function Dispatch:create(text, coords)
	text = tostring(text)

	if not (text and coords) then
		return
	end

	self.lastNumber = self.lastNumber + 1

	for k, v in pairs(self.players) do
		sendMessage(k, text, ("Dispatch (#%s)"):format(self.lastNumber))
		TriggerClientEvent('fireClient:createDispatch', k, self.lastNumber, coords)
	end
end

function Dispatch:addPlayer(serverId)
	self.players[serverId] = true
end

function Dispatch:removePlayer(serverId)
	self.players[serverId] = nil
end

function Dispatch:players()
	return table.length(self.players)
end

function Dispatch:getRandomPlayer()
	if not next(self.players) then
		return false
	end
	return table.random(self.players)
end