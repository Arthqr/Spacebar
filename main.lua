local isRunning = true
local interval = 5

local function autoJump()
    while isRunning do
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
        wait(interval)
    end
end

task.spawn(autoJump)
