local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Sendell",
    LoadingTitle = "Sendell Hub",
    LoadingSubtitle = "Mobile & PC",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "Sendell hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

-- Constants
local SPEED_DEFAULT = 16
local SPEED_SLIDER_RANGE = {1, 100}
local ESP_COLOR_DEFAULT = Color3.new(1, 1, 1)
local HIGH_JUMP_HEIGHT = 100
local NORMAL_JUMP_HEIGHT = 50

-- Main tab
local MainTab = Window:CreateTab("Main", nil)

-- Speed hack
local speedToggleValue = false
local speedSliderValue = SPEED_DEFAULT

local Toggle = MainTab:CreateToggle({
    Name = "Speed",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
        speedToggleValue = Value
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        if Value then
            humanoid.WalkSpeed = speedSliderValue
        else
            humanoid.WalkSpeed = SPEED_DEFAULT
        end
    end,
})

local Slider = MainTab:CreateSlider({
    Name = "Speed Slider",
    Range = SPEED_SLIDER_RANGE,
    Increment = 1,
    Suffix = "",
    CurrentValue = SPEED_DEFAULT,
    Flag = "Slider1",
    Callback = function(Value)
        speedSliderValue = Value
        if speedToggleValue then
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.WalkSpeed = Value
        end
    end,
})

-- High jump
local highJumpToggleValue = false

local Toggle = MainTab:CreateToggle({
    Name = "High Jump",
    CurrentValue = false,
    Flag = "Toggle3",
    Callback = function(Value)
        highJumpToggleValue = Value
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        if Value then
            humanoid.JumpPower = HIGH_JUMP_HEIGHT
        else
            humanoid.JumpPower = NORMAL_JUMP_HEIGHT
        end
    end,
})

-- Performance tab
local PerformanceTab = Window:CreateTab("Performance", nil)

-- Remove textures
local Button = PerformanceTab:CreateButton({
    Name = "Remove Textures",
    Callback = function()
        for _, descendant in pairs(game:GetDescendants()) do
            if descendant:IsA("Texture") then
                descendant:Destroy()
            end
        end
    end,
})

-- Visuals tab
local VisualsTab = Window:CreateTab("Visuals", nil)

-- ESP
local ESPColor = ESP_COLOR_DEFAULT

local ColorPicker = VisualsTab:CreateColorPicker({
    Name = "ESP Color",
    CurrentColor = ESPColor,
    Flag = "ColorPicker1",
    Callback = function(Color)
        ESPColor = Color
    end,
})

local ESPSection = VisualsTab:CreateSection("ESP")

-- Box ESP
local ESPBoxToggleValue = false

local Toggle = ESPSection:CreateToggle({
    Name = "Box",
    CurrentValue = false,
    Flag = "ToggleBox",
    Callback = function(Value)
        ESPBoxToggleValue = Value
        if Value then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    drawBox(player, ESPColor)
                end
            end
        else
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    for _, adornment in pairs(player.Character.HumanoidRootPart:GetDescendants()) do
                        if adornment:IsA("BoxHandleAdornment") then
                            adornment:Destroy()
                        end
                    end
                end
            end
        end
    end,
})

-- Tracer ESP
local ESPTracerToggleValue = false

local Toggle = ESPSection:CreateToggle({
    Name = "Tracer",
        CurrentValue = false,
    Flag = "ToggleTracer",
    Callback = function(Value)
        ESPTracerToggleValue = Value
        if Value then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    drawTracer(player, ESPColor)
                end
            end
        else
            for _, beam in pairs(game.Workspace:GetDescendants()) do
                if beam:IsA("Beam") then
                    beam:Destroy()
                end
            end
        end
    end,
})

-- Health bar ESP
local ESPHealthBarToggleValue = false

local Toggle = ESPSection:CreateToggle({
    Name = "Health Bar",
    CurrentValue = false,
    Flag = "ToggleHealthBar",
    Callback = function(Value)
        ESPHealthBarToggleValue = Value
        if Value then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    drawHealthBar(player, ESPColor)
                end
            end
        else
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    for _, gui in pairs(player.Character.HumanoidRootPart:GetDescendants()) do
                        if gui:IsA("BillboardGui") then
                            gui:Destroy()
                        end
                    end
                end
            end
        end
    end,
})

-- Skeleton ESP
local ESPSkeletonToggleValue = false

local Toggle = ESPSection:CreateToggle({
    Name = "Skeleton",
    CurrentValue = false,
    Flag = "ToggleSkeleton",
    Callback = function(Value)
        ESPSkeletonToggleValue = Value
        if Value then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    drawSkeleton(player, ESPColor)
                end
            end
        else
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    for _, line in pairs(player.Character.HumanoidRootPart:GetDescendants()) do
                        if line:IsA("Line") then
                            line:Destroy()
                        end
                    end
                end
            end
        end
    end,
})

-- Box filled ESP
local ESPBoxFilledToggleValue = false

local Toggle = ESPSection:CreateToggle({
    Name = "Box Filled",
    CurrentValue = false,
    Flag = "ToggleBoxFilled",
    Callback = function(Value)
        ESPBoxFilledToggleValue = Value
        if Value then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    drawBoxFilled(player, ESPColor)
                end
            end
        else
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    for _, adornment in pairs(player.Character.HumanoidRootPart:GetDescendants()) do
                        if adornment:IsA("BoxHandleAdornment") then
                            adornment:Destroy()
                        end
                    end
                end
            end
        end
    end,
})

-- Other scripts tab
local OtherScriptsTab = Window:CreateTab("Other Scripts", nil)

-- Dropdown
local Dropdown = OtherScriptsTab:CreateDropdown({
    Name = "Other Scripts",
    Options = {"Select", "SwagMode", "Tbo", "Faded", "Polakya", "Nyula"},
    CurrentOption = {"Select"},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Option)
        if Option[1] == "SwagMode" then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002'))()
        elseif Option[1] == "Tbo" then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript'))()
        elseif Option[1] == "Faded" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/Faded-Grid/main/YesEpic", true))()
        elseif Option[1] == "Polakya" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/pixelheadx/Polakya/main/Bestscript.md"))()
        elseif Option[1] == "Nyula" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/nyulachan/nyula/main/nyulauh"))()
        end
    end,
})

-- Add the Dropdown to the OtherScriptsTab
Dropdown.Parent = OtherScriptsTab

-- Functions
local function drawBox(player, color)
    local character = player.Character
    if character then
                local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            local box = Instance.new("BoxHandleAdornment")
            box.Size = Vector3.new(4, 6, 1)
            box.Color3 = color
            box.Parent = character.HumanoidRootPart
        end
    end
end

local function drawTracer(player, color)
    local character = player.Character
    if character then
        local beam = Instance.new("Beam")
        beam.Color = ColorSequence.new(color)
        beam.Width0 = 0.5
        beam.Width1 = 0.5
        beam.Transparency = NumberSequence.new(0, 0)
        beam.Parent = game.Workspace
        local attachment0 = Instance.new("Attachment")
        attachment0.Parent = character.HumanoidRootPart
        local attachment1 = Instance.new("Attachment")
        attachment1.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        beam.Attachment0 = attachment0
        beam.Attachment1 = attachment1
    end
end

local function drawHealthBar(player, color)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            local health = humanoid.Health
            local gui = Instance.new("BillboardGui")
            gui.Size = UDim2.new(0, 100, 0, 20)
            gui.StudsOffset = Vector3.new(0, 2, 0)
            gui.Parent = character.HumanoidRootPart
            local frame = Instance.new("Frame")
            frame.BackgroundColor3 = color
            frame.Size = UDim2.new(0, health, 0, 20)
            frame.Parent = gui
        end
    end
end

local function drawSkeleton(player, color)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            local rightArm = character:FindFirstChild("Right Arm")
            local leftArm = character:FindFirstChild("Left Arm")
            local rightLeg = character:FindFirstChild("Right Leg")
            local leftLeg = character:FindFirstChild("Left Leg")
            local torso = character:FindFirstChild("Torso")
            local head = character:FindFirstChild("Head")
            if rightArm and leftArm and rightLeg and leftLeg and torso and head then
                local line1 = Instance.new("Line")
                line1.Color = color
                line1.Thickness = 2
                line1.From = rightArm.Position
                line1.To = torso.Position
                line1.Parent = character.HumanoidRootPart
                local line2 = Instance.new("Line")
                line2.Color = color
                line2.Thickness = 2
                line2.From = leftArm.Position
                line2.To = torso.Position
                line2.Parent = character.HumanoidRootPart
                local line3 = Instance.new("Line")
                line3.Color = color
                line3.Thickness = 2
                line3.From = rightLeg.Position
                line3.To = torso.Position
                line3.Parent = character.HumanoidRootPart
                local line4 = Instance.new("Line")
                line4.Color = color
                line4.Thickness = 2
                line4.From = leftLeg.Position
                line4.To = torso.Position
                line4.Parent = character.HumanoidRootPart
                local line5 = Instance.new("Line")
                line5.Color = color
                line5.Thickness = 2
                line5.From = head.Position
                line5.To = torso.Position
                line5.Parent = character.HumanoidRootPart
            end
        end
    end
end

local function drawBoxFilled(player, color)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            local box = Instance.new("BoxHandleAdornment")
            box.Size = Vector3.new(4, 6, 1)
            box.Color3 = color
            box.Filled = true
            box.Parent = character.HumanoidRootPart
        end
    end
end
