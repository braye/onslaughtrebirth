GM.Name = "Onslaught: Rebirth"
GM.Author = "nearlyepic"
GM.Email = "N/A"
GM.Website = "N/A"
GM.TeamBased = true

PHASE = "BUILD"

BUILDTIME = 60
BATTLETIME = 90

STARTINGMONEY = 4000

function GM:Initialize()
	NextRound = CurTime() + BUILDTIME
	team.SetUp(1, "Red", Color(255, 0, 0))
	team.SetUp(2, "Blue", Color(0, 0, 255))
end