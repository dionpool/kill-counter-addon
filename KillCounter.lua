-- Initialize variables
local killsPerXP = 0
local killsFrame

-- Function to calculate how many kills are needed to level up
local function GetKillsToLevelUp()
    local currentXP = UnitXP("player")
    local maxXP = UnitXPMax("player")
    local xpNeeded = maxXP - currentXP
    local killsRemaining = xpNeeded / killsPerXP
    killsRemaining = math.ceil(killsRemaining)
    return killsRemaining
end

-- Function to update the text in the frame
local function UpdateKillsFrame()
    local killsRemaining = GetKillsToLevelUp()
    killsFrame.text:SetText(string.format("Kills needed: %d", killsRemaining))
end

-- Create the frame to display the kills remaining
local function CreateKillsFrame()
    killsFrame = CreateFrame("Frame", "KillsRemainingFrame", UIParent)
    killsFrame:SetSize(150, 25)
    killsFrame:SetPoint("TOP", UIParent, "TOP", 0, -20)

    killsFrame.bg = killsFrame:CreateTexture(nil, "BACKGROUND")
    killsFrame.bg:SetAllPoints()
    killsFrame.bg:SetColorTexture(0, 0, 0, 0.7)

    killsFrame.text = killsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    killsFrame.text:SetPoint("CENTER")
    killsFrame.text:SetText("Kills needed: 0")

    UpdateKillsFrame()

    killsFrame:SetScript("OnUpdate", function(self, elapsed)
        UpdateKillsFrame()
    end)
end

-- Register slash command
SLASH_KC1 = "/kc"
SlashCmdList["KC"] = function(msg)
    local command, subCommand, value = strsplit(" ", strtrim(msg), 3)

    if not command or command == "" then
        print("Usage:")
        print("'/kc set xp <number>' to set the average XP per kill.")
        print("'/kc remaining' to see the remaining kills")
        return
    end

    if command == "set" and subCommand == "xp" then
        local newKillsPerXP = tonumber(value)
        if newKillsPerXP and newKillsPerXP > 0 then
            killsPerXP = newKillsPerXP
            print(string.format("Kills per XP updated to %.1f", killsPerXP))
        else
            print("Invalid number. Please enter a positive number.")
        end
    elseif command == "remaining" then
        CreateKillsFrame()
    else
        print("Invalid command. Usage:")
        print("'/kc set xp <number>' to set the average XP per kill.")
        print("'/kc remaining' to see the remaining kills")
    end
end
