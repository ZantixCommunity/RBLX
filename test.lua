-- Made By zack;#6969

-- Instances:

local FlyScript = Instance.new("ScreenGui")
local Gradient = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local UICorner = Instance.new("UICorner")
local Button = Instance.new("TextButton")
local Shadow = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")

--Properties:

FlyScript.Name = "FlyScript"
FlyScript.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
FlyScript.ResetOnSpawn = false

Gradient.Name = "Gradient"
Gradient.Parent = FlyScript
Gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gradient.BorderColor3 = Color3.fromRGB(27, 42, 53)
Gradient.BorderSizePixel = 0
Gradient.Position = UDim2.new(0.0199062824, 0, 0.781767964, 0)
Gradient.Size = UDim2.new(0, 231, 0, 81)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(57, 104, 252)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(51, 68, 175))}
UIGradient.Parent = Gradient

UICorner.CornerRadius = UDim.new(0.0399999991, 0)
UICorner.Parent = Gradient

Button.Name = "Button"
Button.Parent = Gradient
Button.BackgroundColor3 = Color3.fromRGB(77, 100, 150)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.0921155736, 0, 0.238353431, 0)
Button.Size = UDim2.new(0, 187, 0, 41)
Button.ZIndex = 2
Button.Font = Enum.Font.GothamSemibold
Button.Text = "Fly"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextScaled = true
Button.TextSize = 14.000
Button.TextWrapped = true

local flying = false
local plr = game.Players.LocalPlayer
local torso = plr.Character:WaitForChild("Torso")
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local speed = 0
local maxspeed = 50
local bg, bv

function Fly()
    if flying then
        flying = false
        if bg then bg:Destroy() end
        if bv then bv:Destroy() end
        plr.Character.Humanoid.PlatformStand = false
        Button.Text = "Fly"
    else
        flying = true
        bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame

        bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0, 0.1, 0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

        Button.Text = "Stop Fly"
        plr.Character.Humanoid.PlatformStand = true

        while flying do
            wait()
            bv.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) * speed
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame
            if ctrl.f + ctrl.b ~= 0 then
                speed = math.min(speed + 1, maxspeed)
            else
                speed = math.max(speed - 1, 0)
            end
        end
    end
end

Button.MouseButton1Click:Connect(Fly)
