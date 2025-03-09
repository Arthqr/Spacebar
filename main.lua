local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Auto Spacebar",
    LoadingTitle = "Auto Spacebar Script",
    LoadingSubtitle = "Made by Arthqr",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

local Tab = Window:CreateTab("Main", 4483362458)

local isRunning = false

local function autoJump()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    while isRunning do
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        wait(600) -- 10 Minuten
    end
end

Tab:CreateButton({
    Name = "Start Auto Jump",
    Callback = function()
        if not isRunning then
            isRunning = true
            autoJump()
        end
    end
})

Tab:CreateButton({
    Name = "Stop Auto Jump",
    Callback = function()
        isRunning = false
    end
})
