local HWID =  {
    "f990bbc0-a32c-4ad2-8992-99b31a2d0dc3","",""
}
if HWID[table.find(HWID,game:GetService("RbxAnalyticsService"):GetClientId())] == game:GetService("RbxAnalyticsService"):GetClientId() then
    _G.script = true
    loadstring(game:HttpGet("https://ybothub.000webhostapp.com/YBotHub"))()
else
    game.Players.LocalPlayer:Kick("Hwid error Please reset Hwid")
    wait(3)
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end
