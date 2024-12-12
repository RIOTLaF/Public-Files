-- some parts are broken

function Script()
    local Mode = "First"
    local function GetItem(a)
        local TweenService = game:GetService "TweenService"
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
        local char = Player.Character or Player.CharacterAdded:Wait()
        local HumanoidRootPart = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
        local Distance = (HumanoidRootPart.Position -a.Position).Magnitude
        if Distance >= 1 then
            Speed = 300
        end
        local Tween =
            TweenService:Create(
            HumanoidRootPart,
            TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
            {CFrame = v.Character.HumanoidRootPart.CFrame}
        )
        Tween:Play()
        if not a then
            Tween:Cancel()
        end
        fireproximityprompt(a.ProximityPrompt, 5)
        task.wait(0.055)
        Tween.Completed:Wait()
    end

    local function GetNearest(path)
        local previous = nil
        local nearest = nil
        local lastminor = math.huge

        for i, v in pairs(path) do
            local z = v:FindFirstChildOfClass("Part") or v:FindFirstChildOfClass("MeshPart")
            if z then
                if previous == nil then
                    previous = z
                    nearest = z
                else
                    local distance = (z.Position - previous.Position).Magnitude
                    if distance < lastminor then
                        nearest = z
                        lastminor = distance
                    end
                end
            end
        end

        return nearest
    end

    local function GetFirst()
        local path = workspace.Art.Lobby.Interactive:GetChildren()
        for i, v in pairs(path) do
            local a = v:FindFirstChildOfClass("Part") or v:FindFirstChildOfClass("MeshPart")
            GetItem(a)
        end
    end

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/Roblox/master/Orion.lua"))()
    local Window =
        OrionLib:MakeWindow(
        {
            Name = loadstring(
                game:HttpGet("https://raw.githubusercontent.com/KrypDeveloper/Quasar/main/src/Settings/HubName.lua")
            )(),
            TestMode = false,
            SaveConfig = true,
            ConfigFolder = "Quasar Hub",
            IntroEnabled = true,
            IntroText = "Welcome " .. Players.LocalPlayer.DisplayName
        }
    )
    local Tabs = {
        Main = Window:MakeTab({Name = "Main", Icon = "home", TestersOnly = false}),
        Misc = Window:MakeTab({Name = "Misc", Icon = "person-standing", TestersOnly = false}),
        ESP = Window:MakeTab({Name = "ESP", Icon = "eye", TestersOnly = false})
    }

    Tabs.Main:AddSection({Name = "Farm"})

    Tabs.Main:AddToggle(
        {
            Name = "Auto Item",
            Default = false,
            Callback = function(ItemFarm)
                if Mode == "First" and ItemFarm then
                    GetFirst()
                    repeat
                        task.wait()
                    until EasyPath:FinishedPathfinding() == true
                elseif Mode == "Nearest" and ItemFarm then
                    local path = workspace.Art.Lobby.Interactive:GetChildren()
                    GetItem(GetNearest(path))
                    repeat
                        task.wait()
                    until EasyPath:FinishedPathfinding() == true
                end

                workspace.Art.Lobby.Interactive.ChildAdded:Connect(
                    function()
                        if Mode == "First" and ItemFarm then
                            GetFirst()
                            repeat
                                task.wait()
                            until EasyPath:FinishedPathfinding() == true
                        elseif Mode == "Nearest" and ItemFarm then
                            local path = workspace.Art.Lobby.Interactive:GetChildren()
                            GetItem(GetNearest(path))
                            repeat
                                task.wait()
                            until EasyPath:FinishedPathfinding() == true
                        end
                    end
                )
            end
        }
    )

    Tabs.Main:AddDropdown(
        {
            Name = "Mode",
            Default = "First",
            Options = {"First", "Nearest"},
            Callback = function(Value)
                Mode = Value
                return Mode
            end
        }
    )

    Tabs.Main:AddToggle(
        {
            Name = "Auto Redeem",
            Default = false,
            Callback = function(Value)
                while Value do
                    firesignal(
                        game.Players.LocalPlayer.PlayerGui.ScreenAchievement.Frame.FrameContainer.FrameDesc.FrameRewards.Claim[
                            "MouseButton1Click"
                        ]
                    )
                    task.wait(1)
                end
            end
        }
    )

    Tabs.Main:AddToggle(
        {
            Name = "Item Notify",
            Default = false,
            Callback = function(Value)
                workspace.Art.Lobby.Interactive.ChildAdded:Connect(
                    function()
                        if Value then
                            OrionLib:MakeNotification(
                                {
                                    Name = "Quasar Hub",
                                    Content = "Item Spawned!",
                                    Image = "eye",
                                    Time = 5
                                }
                            )
                        end
                    end
                )
            end
        }
    )

    local autoFishing = false

    Tabs.Main:AddToggle(
        {
            Name = "Auto Fishing",
            Default = false,
            Callback = function(Value)
                autoFishing = Value
                while autoFishing do
                    local VIS = game:GetService("VirtualInputManager")
                    character:SetPrimaryPartCFrame(CFrame.new(111, 26, -5))
                    VIS:SendKeyEvent(true, "E" or Enum.KeyCode.E, false, game)
                    task.wait(1)
                end
            end
        }
    )

    Tabs.Main:AddSection({Name = "Aura"})

    Tabs.Main:AddToggle(
        {
            Name = "Auto Equip Aura",
            Default = false,
            Callback = function(Value)
                while Value do
                    firesignal(game.Players.LocalPlayer.PlayerGui.ScreenRoll.Frame.BtnFrame.Equip["MouseButton1Click"])
                    task.wait(0.8)
                end
            end
        }
    )

    Tabs.Misc:AddSection({Name = "Misc"})
    local CSpeed = 0
    local ESPItem = false
    Tabs.Misc:AddSlider(
        {
            Name = "CFrame Speed(Bypass AntiCheat)",
            Min = 0,
            Max = 2,
            Default = 0,
            Color = Color3.fromRGB(69, 233, 255),
            Increment = 0.1,
            ValueName = "Speed",
            Callback = function(Value)
                CSpeed = Value
                return CSpeed
            end
        }
    )

    Tabs.Misc:AddButton(
        {
            Name = "Anti Afk",
            Callback = function()
                local GC = getconnections or get_signal_cons
                if GC then
                    for i, v in pairs(GC(Players.LocalPlayer.Idled)) do
                        if v["Disable"] then
                            v["Disable"](v)
                        elseif v["Disconnect"] then
                            v["Disconnect"](v)
                        end
                    end
                else
                    local VirtualUser = cloneref(game:GetService("VirtualUser"))
                    Players.LocalPlayer.Idled:Connect(
                        function()
                            VirtualUser:CaptureController()
                            VirtualUser:ClickButton2(Vector2.new())
                        end
                    )
                end
            end
        }
    )

    Tabs.Misc:AddButton(
        {
            Name = "Boost FPS",
            Callback = function()
                local Lighting = game:GetService("Lighting")
                local Terrain = workspace:FindFirstChildOfClass("Terrain")
                Terrain.WaterWaveSize = 0
                Terrain.WaterWaveSpeed = 0
                Terrain.WaterReflectance = 0
                Terrain.WaterTransparency = 0
                Lighting.GlobalShadows = false
                Lighting.FogEnd = 9e9
                settings().Rendering.QualityLevel = 1
                for i, v in pairs(game:GetDescendants()) do
                    if
                        v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or
                            v:IsA("TrussPart")
                     then
                        v.Material = "Plastic"
                        v.Reflectance = 0
                    elseif v:IsA("Decal") then
                        v.Transparency = 1
                    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                        v.Lifetime = NumberRange.new(0)
                    elseif v:IsA("Explosion") then
                        v.BlastPressure = 1
                        v.BlastRadius = 1
                    end
                end
                for i, v in pairs(Lighting:GetDescendants()) do
                    if
                        v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or
                            v:IsA("BloomEffect") or
                            v:IsA("DepthOfFieldEffect")
                     then
                        v.Enabled = false
                    end
                end
                workspace.DescendantAdded:Connect(
                    function(child)
                        task.spawn(
                            function()
                                if child:IsA("ForceField") then
                                    RunService.Heartbeat:Wait()
                                    child:Destroy()
                                elseif child:IsA("Sparkles") then
                                    RunService.Heartbeat:Wait()
                                    child:Destroy()
                                elseif child:IsA("Smoke") or child:IsA("Fire") then
                                    RunService.Heartbeat:Wait()
                                    child:Destroy()
                                end
                            end
                        )
                    end
                )
            end
        }
    )

    Tabs.ESP:AddToggle(
        {
            Name = "ESP Item",
            Default = false,
            Callback = function(Value)
                ESPItem = Value
                return ESPItem
            end
        }
    )

    local function makeesp(location, color)
        local camera = workspace.CurrentCamera
        local Vector = camera:WorldToViewportPoint(location.Position)

        local Line = Drawing.new("Line")
        Line.Visible = true
        Line.Color = color or Color3.new(1, 1, 1)
        Line.Thickness = 1
        Line.Transparency = 1

        Line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
        Line.To = Vector2.new(Vector.X, Vector.Y)
        task.wait(0.01)
        Line:Remove()
    end

    RunService.Stepped:Connect(
        function()
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame =
                    character.HumanoidRootPart.CFrame + character.Humanoid.MoveDirection * CSpeed
            end

            if ESPItem then
                local path = workspace.Art.Lobby.Interactive:GetChildren()
                for i, v in pairs(path) do
                    if v:FindFirstChildOfClass("Part") or v:FindFirstChildOfClass("MeshPart") then
                        makeesp(v, Color3.new(1, 0.690196, 0.333333))
                    end
                end
            end
        end
    )

    OrionLib:Init()
end

pcall(Script)