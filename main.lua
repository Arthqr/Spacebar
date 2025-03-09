-- Lade Rayfield GUI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Erstelle das Hauptfenster
local Window = Rayfield:CreateWindow({
    Name = "Auto Spacebar",
    LoadingTitle = "Auto Spacebar Script",
    LoadingSubtitle = "Made by YourName",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- Erstelle einen Tab
local Tab = Window:CreateTab("Main", 4483362458)

-- Status-Variable
local isRunning = false
local interval = 600 -- Standardmäßig 10 Minuten (600 Sekunden)

-- Funktion zum Springen mit Humanoid:ChangeState
local function autoJump()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    while isRunning do
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        wait(interval)
    end
end

-- Slider für Intervall-Einstellung
Tab:CreateSlider({
    Name = "Intervall (Sekunden)",
    Min = 10,
    Max = 1200,
    Default = 600,
    Increment = 10,
    Callback = function(value)
        interval = value
    end
})

-- Button zum Starten
Tab:CreateButton({
    Name = "Start Auto Jump",
    Callback = function()
        if not isRunning then
            isRunning = true
            autoJump()
        end
    end
})

-- Button zum Stoppen
Tab:CreateButton({
    Name = "Stop Auto Jump",
    Callback = function()
        isRunning = false
    end
})
