local banned = {"Johajep"}

-- Function to check and ban players
local function checkAndBan(player)
    for _, name in pairs(banned) do
        if string.find(string.lower(player.Name), string.lower(name)) then
            player:Kick("You have been banned from this game.")
            print(player.Name .. " has been banned.")
            return
        end
    end
end

-- Ban existing players when the script starts
for _, player in pairs(game.Players:GetPlayers()) do
    checkAndBan(player)
end

-- Ban new players who join
game.Players.PlayerAdded:Connect(checkAndBan)

-- Display a message indicating the script is active
local m = Instance.new("Message")
m.Text = "Banning Script Loaded"
m.Parent = game.Workspace
task.delay(5, function() m:Destroy() end) -- Removes the message after 5 seconds
