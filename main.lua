local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Auto Spacebar",
    LoadingTitle = "Auto Spacebar Script",
    LoadingSubtitle = "Made by Athqr",
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

local function pressSpace()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    while isRunning do
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
        wait(0.1)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
        wait(600) 
    end
end

Tab:CreateButton({
    Name = "Start Auto Spacebar",
    Callback = function()
        if not isRunning then
            isRunning = true
            pressSpace()
        end
    end
})

Tab:CreateButton({
    Name = "Stop Auto Spacebar",
    Callback = function()
        isRunning = false
    end
})
