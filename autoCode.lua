local Code = {
    "SECRET_ADMIN",
    "CODESLIDE",
    "ADMINHACKED",
    "TRIPLEABUSE",
    "SEATROLLING",
    "ZIOLES",
    "KITT_RESET",
    "Sub2CaptainMaui",
    "SUB2GAMERROBOT_RESET1",
    "kittgaming",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "Magicbus",
    "JCWK",
    "Starcodeheo",
    "Bluxxy",
    "fudd10_v2",
    "FUDD10",
    "BIGNEWS",
    "THEGREATACE",
    "SUB2GAMERROBOT_EXP1",
    "Sub2OfficialNoobie",
    "StrawHatMaine",
    "SUB2NOOBMASTER123",
    "Sub2UncleKizaru",
    "Sub2Daigrock",
    "Axiore",
    "TantaiGaming"
}
x = 1
while wait() do
    if x <= #Code then
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Code[x])
        x = x + 1
    else
        break
    end
end
--https://raw.githubusercontent.com/BotHub-scrip/BotHub-Scrip/main/Code