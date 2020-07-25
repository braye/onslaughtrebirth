AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )
include( "util.lua" )

function GM:Think()
    TimeLeft = NextRound - CurTime()
    if TimeLeft <= 0 then
        gamemode.Call( "PhaseChange" )
    end
end

function GM:PhaseChange()
    if PHASE == "BUILD" then
        AllChat("Entering Battle Phase!")
        PHASE = "BATTLE"
        NextRound = CurTime() + BATTLETIME
    elseif PHASE == "BATTLE" then
        AllChat("Entering Build Phase!")
        PHASE = "BUILD"
        NextRound = CurTime() + BUILDTIME
    end
end

function GM:PlayerInitialSpawn(ply)
    -- race condition that gmod lua doesn't equip us to get around
    timer.Simple(1, function() gamemode.Call("PlayerJoinTeam", ply, team.BestAutoJoinTeam()) end)
    ply:SetNWInt("money", STARTINGMONEY)
    timer.Create("moneyprint", 1, 0, function() AllChat("money: "..ply:GetNWInt("money")) end)
end

function GM:PlayerLoadout(ply)
    if PHASE == "BUILD" then
        ply:Give("weapon_physgun")
    end
end
