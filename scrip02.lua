if game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then
    if _G.Kaitun == true then
        loadstring(game:HttpGet("Scrip Kaitun"))()
    else
        loadstring(game:HttpGet("Scrip"))()
    end
else game.Players.LocalPlayer:Kick("Erro in PlaceId")
    wait(1)
    game:Shutdown()
end