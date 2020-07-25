-- Utility library
function AllChat(msg)
	for k,v in pairs(player.GetAll()) do
		v:ChatPrint(msg)
	end
end