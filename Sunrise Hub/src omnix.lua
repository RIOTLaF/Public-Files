-- Variables
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HTTPService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")


local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local multiplier = 0

local data = HTTPService:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/KrypDeveloper/Sunrise-Hub/refs/heads/main/Core/OMNI%20X/data.json"))
local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
local Window = WindUI:CreateWindow({
    Title = "Sunrise hub", -- UI Title
    Icon = "sun", -- Url or rbxassetid or lucide
    Author = "RIOT and devizin", -- Author & Creator
    Folder = "Sunrise", -- Folder name for saving data (And key)
    Size = UDim2.fromOffset(580, 460), -- UI Size
    Transparent = true,-- UI Transparency
    Theme = "Light", -- UI Theme
    SideBarWidth = 200, -- UI Sidebar Width (number)
    HasOutline = false, -- Adds Oultines to the window
})

-------------------------------------------------------------------------------------------------
local omni = workspace.World.Map.Map_Scripts_Parts.Ominitrix_Giver.Omnitrix_Capsule.Interact
local NPCS = workspace.NPCS
-------------------------------------------------------------------------------------------------

WindUI:SetNotificationLower(false)

Window:EditOpenButton({
    Title = "Open UI Button",
    Icon = "image-upscale",  -- New icon
    CornerRadius = UDim.new(0,10),
    StrokeThickness = 3,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    )
})

-- Tabs

-- TransparencyValue
WindUI.TransparencyValue = .1

-- Font (example)
-- WindUI:SetFont("rbxassetid://font-id")

--- Section for Tabs

local MainTab = Window:Tab({
    Title = "Main",
    Icon = "house",
})

Window:SelectTab(1)
-- Functions
-- Slider

MainTab:Section({ 
    Title = "Teleports",
    TextXAlignment = "Center"
})

MainTab:Button({
    Title = "Get omnitrix",
    Callback = function()
        character:PivotTo(CFrame.new(omni.Position))
        fireproximityprompt(omni.ProximityPrompt)
    end
})

local function GetList(path)
    local list = {}
    for i,v in pairs(path) do
        if #v:GetChildren() > 0 then
            table.insert(list, v.Name)
        end
    end
    return list
end

local Dropdown = MainTab:Dropdown({
    Title = "NPCS",
    Desc = "Select one to teleport",
    Multi = false,
    Value = "...",
    AllowNone = true,
    Values = GetList(NPCS:GetChildren()),
    Callback = function(selected)
        local NPC = NPCS:FindFirstChild(selected)
        if character and NPC and NPC:FindFirstChild("Character") then
            local root = NPC.Character:FindFirstChild("HumanoidRootPart") or NPC.Character:FindFirstChild("RootPart")
            character:PivotTo(CFrame.new(root.Position))
        end
    end
})

MainTab:Section({ 
    Title = "Geral hacks",
    TextXAlignment = "Center"
})

local WalkSpeedSlider = MainTab:Slider({
    Title = "WalkSpeed Hack",
    Desc = "Unleash your inner speed demon and leave others in the dust!",
    Step = 1,
    Value = {
        Min = 0,
        Max = 30,
        Default = 0,
    },
    Callback = function(value)
        multiplier = value / 2
    end
})

local MainTab = Window:Tab({
    Title = "Aliens",
    Icon = "boxes",
})

for i,v in pairs(data.aliens) do
    local Dropdown = MainTab:Dropdown({
        Title = i,
        Desc = "Select",
        Multi = false,
        Value = "...",
        AllowNone = true,
        Values = v,
        Callback = function(alien)
            local callback = ReplicatedStorage.RemoteFunctions.Character.Morph.AlienMorph:InvokeServer(alien, 1)
            if callback == false then
                WindUI:Notify({
                    Title = "Sunrise Hub",
                    Content = "Failed to transform",
                    Duration = 2,
                })
            end
        end
    })
end

local MainTab = Window:Tab({
    Title = "Debug",
    Icon = "github",
})

MainTab:Section({ Title = "INFO" })
local Paragraph1 = MainTab:Paragraph({
    Title = "Current Races",
    Desc = "Current have: ".. #data.races.. " races in database\n".. #game:GetService("ReplicatedStorage").Aliens.OT:GetChildren().. " races in game",
})

local function boot()
    character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local event

    event = RunService.Stepped:Connect(function()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame + character.Humanoid.MoveDirection * multiplier
        end
    end)

    humanoid.Died:Connect(function()
        event:Disconnect()
        player.CharacterAdded:Wait()
        boot()
    end)
end

boot()