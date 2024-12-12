--// my first auto farm 

local Debug = false

function Script()
    spawn(
        function()
            _G.AfkCooldown = 30
            _G.IsFarming = false
            _G.SelectedAlien = "HeatBlast"
            _G.useZ = true
            _G.useX = true
            _G.useC = true
            _G.useV = true
            _G.CurrentQuest = "MechaDroid"
            _G.FarmMetod = "Level Farm"
            _G.TweenDistance = 5
            _G.SecurityMode = "Kick"
            _G.TweenSetting = "Above"
            _G.VerifFarm = "Max"
            _G.CheckQuest = false
            _G.SelectedPlayer = game.Players.LocalPlayer.Name

            game:GetService("StarterGui"):SetCore(
                "SendNotification",
                {
                    Title = "Quasar Hub",
                    Text = "Execute after game load!",
                    Icon = "rbxthumb://type=AvatarHeadShot&id=" ..
                        game:GetService("Players").LocalPlayer.UserId .. "&w=180&h=180 true",
                    Duration = 5
                }
            )
            if not game.Loaded then
                repeat
                    task.wait()
                until game.Loaded
            end
            local function generatefloat()
                local ScreenGui = Instance.new("ScreenGui")
                local ImageButton = Instance.new("ImageButton")
                local UICorner = Instance.new("UICorner")

                ScreenGui.Parent = game:GetService("CoreGui")
                ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

                ImageButton.Parent = ScreenGui
                ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
                ImageButton.Size = UDim2.new(0, 50, 0, 50)
                ImageButton.Image = "rbxassetid://17229118960"
                ImageButton.Draggable = true
                ImageButton.Active = true
                ImageButton.Selectable = true

                UICorner.CornerRadius = UDim.new(0, 30)
                UICorner.Parent = ImageButton

                ImageButton.MouseButton1Click:Connect(
                    function()
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
                    end
                )
            end

            if game:GetService("UserInputService").TouchEnabled then
                generatefloat()
            end

            local Missions = {
                Quest1 = {"AddQuest", "QuestM1"},
                Quest2 = {"AddQuest", "QuestM2"},
                Quest3 = {"AddQuest", "QuestM3"},
                Quest4 = {"AddQuest", "QuestM4"},
                Quest5 = {"AddQuest", "QuestM5"},
                Quest6 = {"AddQuest", "QuestM6"},
                Quest7 = {"AddQuest", "QuestM7"},
                Quest8 = {"AddQuest", "QuestM8"},
                Quest9 = {"AddQuest", "QuestM9"}
            }

            local QuestManager = {
                Quests = {
                    QuestM1 = {
                        questType = 1,
                        minPlayerLevel = 0,
                        maxPlayerLevel = 7,
                        enemys = {MiniRobot = 6},
                        reward = {experience = 40, gold = 80},
                        description = "Main - Kill 6 Droids",
                        npcDescription = "The Droids are attacking everyone here. Help us by defeating 6 of them."
                    },
                    QuestM2 = {
                        questType = 1,
                        minPlayerLevel = 7,
                        maxPlayerLevel = 12,
                        enemys = {SpinRobot = 5},
                        reward = {experience = 80, gold = 160},
                        description = "Main - Kill 5 Mechadroid",
                        npcDescription = "The Mechadroid are attacking everyone here. Help us by defeating 5 of them."
                    },
                    QuestM3 = {
                        questType = 1,
                        minPlayerLevel = 13,
                        maxPlayerLevel = 21,
                        enemys = {GiantMechadroid = 1},
                        reward = {experience = 140, gold = 320, DNA = 3},
                        description = "Main - Kill 1 Giant Mechadroid",
                        npcDescription = "The Giant Mechadroid is causing destruction defeat it."
                    },
                    QuestM4 = {
                        questType = 1,
                        minPlayerLevel = 21,
                        maxPlayerLevel = 29,
                        enemys = {GiantFrog = 5},
                        reward = {experience = 200, gold = 300},
                        description = "Main - Kill 5 Giant Frogs",
                        npcDescription = "Yuck! There are several giant frogs in this swamp. Please, get rid of them."
                    },
                    QuestM5 = {
                        questType = 1,
                        minPlayerLevel = 29,
                        maxPlayerLevel = 35,
                        enemys = {TRex = 4},
                        reward = {experience = 250, gold = 500},
                        description = "Main - Kill 4 Giant T-Rex",
                        npcDescription = "Please help us. A Crazy Man created several giant ferocious dinosaurs, I took care of him and help us recover the laboratory."
                    },
                    QuestM6 = {
                        questType = 1,
                        minPlayerLevel = 35,
                        maxPlayerLevel = 40,
                        enemys = {DrAnimal = 1},
                        reward = {experience = 300, gold = 700, DNA = 5},
                        description = "Main - Kill 1 Crazy Scientist",
                        npcDescription = "He's in there. He didn't win a Nobel Prize and decided to destroy the laboratory. Please, defeat him!!"
                    },
                    QuestM7 = {
                        questType = 1,
                        minPlayerLevel = 40,
                        maxPlayerLevel = 45,
                        enemys = {EternalKnight = 7},
                        reward = {experience = 300, gold = 800},
                        description = "Main - Kill 7 Eternal Knight",
                        npcDescription = "Pleaseee, kill some eternal knights they're making me angry!!"
                    },
                    QuestM8 = {
                        questType = 1,
                        minPlayerLevel = 45,
                        maxPlayerLevel = 55,
                        enemys = {SwordsmanEternalKnight = 8},
                        reward = {experience = 350, gold = 450},
                        description = "Main - Kill 8 Swordsman Eternal Knight",
                        npcDescription = "In a distant land, the Star Tear has vanished. The King calls upon heroes to retrieve it. Adventure, magic, and danger await. Will you be able to help?"
                    },
                    QuestM9 = {
                        questType = 1,
                        minPlayerLevel = 55,
                        maxPlayerLevel = 55,
                        enemys = {CrazyClown = 10},
                        reward = {experience = 400, gold = 550},
                        description = "Main - Kill 10 Crazy Clowns",
                        npcDescription = "I will offer you a magic if you neutralize these Crazy Clowns!!"
                    },
                    QuestS1 = {
                        questType = 2,
                        minPlayerLevel = 15,
                        maxPlayerLevel = 90,
                        enemys = {InsectMan = 2},
                        reward = {experience = 2000, gold = 1000, DNA = 50},
                        description = "Secondary - Kill 2 Insect Man",
                        npcDescription = "Hey buddy, we need help! The Insect Man is terrorizing us. Our weapons are useless against him. Please, accept this challenge and put an end to this nightmare!"
                    }
                }
                
            }

            local Codes = {
                [1] = "NewAliens",
                [2] = "Update",
                [3] = "BugsFixed",
                [4] = "SORRYFORDELAY2",
                [5] = "SORRYFORDELAY",
                [6] = "RELEASE"
            }

            local function TpToQuest(Quest)
                local Questi = workspace.ModelMapa.QuestDummy.Main:FindFirstChild(Quest).HumanoidRootPart
                local Distance = (Questi.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local Speed = 300
                local CFrameTarget = CFrame.new(Questi.Position.X, Questi.Position.Y, Questi.Position.Z) -- Target CFrame
                local a = game:GetService("TweenService"):Create(
                    game.Players.LocalPlayer.Character.HumanoidRootPart,
                    TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
                    {
                        CFrame = CFrameTarget
                    }
                )
                a:Play()
                a.Completed:Wait()
            end

            local function CheckMission()
                local quests = game:GetService("Players").LocalPlayer.Quests:GetChildren()
                for _, quest in pairs(quests) do
                    if quest:IsA("Folder") then
                        return false
                    end
                end
                return true
            end

            local function TakeQuest(Quest)
                if _G.FarmMetod == "Level Farm" then
                    if _G.CheckQuest then
                        if CheckMission() then
                            game:GetService("ReplicatedStorage").Events.QuestEvent:FireServer(unpack(Quest))
                        end
                    else
                        game:GetService("ReplicatedStorage").Events.QuestEvent:FireServer(unpack(Quest))
                    end
                end
            end

            local function UseSkill(Letter)
                game:GetService("ReplicatedStorage").Events.OmnitrixEvent:FireServer("CastSkill", Letter)
            end

            local function transform(Value)
                if game.Players.LocalPlayer:GetAttribute("battery") >= 40 then
                     game:GetService("ReplicatedStorage").Events.OmnitrixEvent:FireServer("Transform", Value)
               end
            end

            --AUTO FARM

            local function TweenToTarget(P1)
                local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local Speed = 800
                local hp = game.Players.LocalPlayer.Character.Humanoid.Health
                local CFrameTarget
                if _G.TweenSetting == "Above" then
                    if hp < 25 then
                        CFrameTarget = CFrame.new(P1.Position.X, P1.Position.Y + 50, P1.Position.Z)
                    else
                        CFrameTarget = CFrame.new(P1.Position.X, P1.Position.Y + _G.TweenDistance, P1.Position.Z)
                    end
                elseif _G.TweenSetting == "Below" then
                    if hp < 25 then
                        CFrameTarget = CFrame.new(P1.Position.X, P1.Position.Y - 50, P1.Position.Z)
                    else
                        CFrameTarget = CFrame.new(P1.Position.X, P1.Position.Y - _G.TweenDistance, P1.Position.Z)
                    end
                end
                local a =
                    game:GetService("TweenService"):Create(
                    game.Players.LocalPlayer.Character.HumanoidRootPart,
                    TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
                    {
                        CFrame = CFrameTarget
                    }
                )
                a:Play()
                if _G.IsFarming == false then
                    a:Cancel()
                end
                a.Completed:Wait()
            end

            local function AttackEnemy(Enemy)
                TweenToTarget(Enemy)
                if _G.useZ then
                    UseSkill(Enum.KeyCode.Z)
                end
                if _G.useX then
                    UseSkill(Enum.KeyCode.X)
                end
                if _G.useC then
                    UseSkill(Enum.KeyCode.C)
                end
                if _G.useV then
                    UseSkill(Enum.KeyCode.V)
                end
                UseSkill(Enum.UserInputType.MouseButton1)
                task.wait(0.055)
            end

            local function AutoFarm(Instance, EspecialObj, Value, Quest, Alien)
                while _G.IsFarming do
                    pcall(
                        function()
                            if _G.VerifFarm == "Max" then
                                transform(Alien)
                            end
                            TakeQuest(Quest)

                            local enemies = Instance
                            for _, enemy in pairs(enemies) do
                                if enemy:IsA("Model") and enemy:FindFirstChild(EspecialObj) and _G.IsFarming then
                                    transform(Alien)
                                    local Hitbox = enemy:FindFirstChild(EspecialObj)

                                    while enemy:FindFirstChild("Humanoid") and
                                        enemy:FindFirstChild("Humanoid").Health > 0 and
                                        _G.IsFarming do
                                        AttackEnemy(Hitbox)
                                        if _G.VerifFarm == "Max" then
                                            transform(Alien)
                                        end
                                    end
                                    if _G.VerifFarm == "Max" then
                                        transform(Alien)
                                    end
                                    TakeQuest(Quest)
                                end
                            end
                        end
                    )
                    task.wait(0.055)
                end
            end

            local Aliens = {
                HeatBlast = 1,
                Diamond = 2,
                XRL8 = 3,
                GrayMatter = 4,
                FourArms = 5,
                WildMutt = 6,
                Stinkfly = 7,
                Aquatic = 8,
                Upgrade = 9,
                Ghostfreak = 10
            }

            local getalien = function()
                return Aliens[_G.SelectedAlien]
            end

            local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

            local Window = Fluent:CreateWindow(
                {
                    Title = "Quasar Hub | Benverse",
                    SubTitle = "Made by Frost Team",
                    TabWidth = 145,
                    Size = UDim2.fromOffset(525, 360),
                    Acrylic = false,
                    Theme = "Rose",
                    MinimizeKey = Enum.KeyCode.End
                }
            )

            local Tabs = {
                Main = Window:AddTab({Title = "Main", Icon = "home"}),
                Security = Window:AddTab({Title = "Security", Icon = "rbxassetid://7734056608"}),
                Settings = Window:AddTab({Title = "Settings", Icon = "settings"}),
                Itens = Window:AddTab({Title = "Itens", Icon = "backpack"}),
                Teleport = Window:AddTab({Title = "Teleport", Icon = "map"}),
                pvp = Window:AddTab({Title = "PVP", Icon = "swords"}),
                Misc = Window:AddTab({Title = "Misc", Icon = "rbxassetid://4370318685"})
            }
            Window:SelectTab(1)
            local Options = Fluent.Options
            do
                Tabs.Main:AddParagraph(
                    {
                        Title = "Auto Farm",
                        Content = "Auto Farm Section!"
                    }
                )

                local Dropdown =
                    Tabs.Main:AddDropdown(
                    "Dropdown",
                    {
                        Title = "Auto Farm Mob",
                        Values = {
                            "MechaDroid",
                            "SpinBot",
                            "SpinBot Boss",
                            "Frog",
                            "T-Rex",
                            "Eternal",
                            "Elite Eternal",
                            "Clown"
                        },
                        Multi = false,
                        Default = "MechaDroid"
                    }
                )

                Dropdown:OnChanged(
                    function(Value)
                        _G.CurrentQuest = Value
                    end
                )

                local Toggle = Tabs.Main:AddToggle("AutoFarmLevel", {Title = "Auto Farm Level", Default = false })

                Toggle:OnChanged(function()
                    _G.IsFarming = Options.AutoFarmLevel.Value
                    while Options.AutoFarmLevel.Value == true do
                        task.wait(0.055)
                        if game.Players.LocalPlayer:GetAttribute("level") >= QuestManager.Quests.QuestM1.minPlayerLevel and game.Players.LocalPlayer:GetAttribute("level") < QuestManager.Quests.QuestM1.maxPlayerLevel then
                            AutoFarm(
                                workspace.Enemys.Instances:GetChildren(),
                                "mechadroid.000_mechadroid.021",
                                _G.IsFarming,
                                Missions.Quest1,
                                getalien()
                            )
                            task.wait(0.055)
                        elseif game.Players.LocalPlayer:GetAttribute("level") >= QuestManager.Quests.QuestM2.minPlayerLevel and game.Players.LocalPlayer:GetAttribute("level") < QuestManager.Quests.QuestM3.maxPlayerLevel then
                            AutoFarm(
                                workspace.Enemys.Instances:GetChildren(),
                                "Circle.000_Circle.006",
                                _G.IsFarming,
                                Missions.Quest2,
                                getalien()
                            )
                            task.wait(0.055)
                        elseif game.Players.LocalPlayer:GetAttribute("level") >= QuestManager.Quests.QuestM4.minPlayerLevel and game.Players.LocalPlayer:GetAttribute("level") < QuestManager.Quests.QuestM4.maxPlayerLevel then
                            AutoFarm(
                                workspace.Enemys.Instances:GetChildren(),
                                "Cube.000_Cube.004",
                                _G.IsFarming,
                                Missions.Quest4,
                                getalien()
                            )
                            task.wait(0.055)
                        elseif game.Players.LocalPlayer:GetAttribute("level") >= QuestManager.Quests.QuestM5.minPlayerLevel and game.Players.LocalPlayer:GetAttribute("level") < QuestManager.Quests.QuestM5.maxPlayerLevel then
                            AutoFarm(
                                workspace.Enemys.Instances:GetChildren(),
                                "TRex_30M_part01",
                                _G.IsFarming,
                                Missions.Quest5,
                                getalien()
                            )
                            task.wait(0.055)
                        elseif game.Players.LocalPlayer:GetAttribute("level") >= QuestManager.Quests.QuestM6.minPlayerLevel and game.Players.LocalPlayer:GetAttribute("level") < QuestManager.Quests.QuestM6.maxPlayerLevel then
                            while _G.IsFarming and Options.AutoFarmLevel.Value do
                                pcall(
                                    function()
                                        transform(getalien())
                                        if _G.FarmMetod == "Level Farm" then
                                            TakeQuest(Missions.Quest7)
                                        end
                                        local enemies = workspace.Enemys.Instances:GetChildren()
                                        for _, enemy in pairs(enemies) do
                                            if _G.FarmMetod == "Level Farm" then
                                                TakeQuest(Missions.Quest7)
                                            end
                                            if
                                                enemy:IsA("Model") and enemy:FindFirstChild("Spear") and
                                                    enemy.Spear:FindFirstChild("Center") and
                                                    _G.IsFarming
                                             then
                                                if _G.FarmMetod == "Level Farm" then
                                                    TakeQuest(Missions.Quest7)
                                                end
                                                transform(getalien())
                                                local Hitbox = enemy.Spear.Center

                                                while enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and
                                                    _G.IsFarming do
                                                    if _G.FarmMetod == "Level Farm" then
                                                        TakeQuest(Missions.Quest7)
                                                    end
                                                    transform(getalien())
                                                    AttackEnemy(Hitbox)
                                                end
                                                transform(getalien())
                                                if _G.FarmMetod == "Level Farm" then
                                                    TakeQuest(Missions.Quest7)
                                                end
                                            end
                                        end
                                    end
                                )
                                wait(.1)
                            end
                        elseif game.Players.LocalPlayer:GetAttribute("level") >= QuestManager.Quests.QuestM7.minPlayerLevel and game.Players.LocalPlayer:GetAttribute("level") < QuestManager.Quests.QuestM7.maxPlayerLevel then
                            while _G.IsFarming do
                                pcall(
                                    function()
                                        transform(getalien())
                                        if _G.FarmMetod == "Level Farm" then
                                            TakeQuest(Missions.Quest8)
                                        end
                                        local enemies = workspace.Enemys.Instances:GetChildren()
                                        for _, enemy in pairs(enemies) do
                                            if _G.FarmMetod == "Level Farm" then
                                                TakeQuest(Missions.Quest8)
                                            end
                                            if
                                                enemy:IsA("Model") and enemy:FindFirstChild("Sword") and
                                                    enemy.Sword:FindFirstChild("Center") and
                                                    _G.IsFarming
                                             then
                                                if _G.FarmMetod == "Level Farm" then
                                                    TakeQuest(Missions.Quest8)
                                                end
                                                transform(getalien())
                                                local Hitbox = enemy.Sword.Center

                                                while enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and
                                                    _G.IsFarming do
                                                    if _G.FarmMetod == "Level Farm" then
                                                        TakeQuest(Missions.Quest8)
                                                    end
                                                    transform(getalien())
                                                    AttackEnemy(Hitbox)
                                                end
                                                transform(getalien())
                                                if _G.FarmMetod == "Level Farm" then
                                                    TakeQuest(Missions.Quest8)
                                                end
                                            elseif _G.CurrentQuest == "Clown" then
                                                AutoFarm(
                                                    workspace.Enemys.Instances:GetChildren(),
                                                    "Handle",
                                                    _G.IsFarming,
                                                    Missions.Quest9,
                                                    getalien()
                                                )
                                            end
                                        end
                                    end
                                )
                                wait(0.1)
                                -- end
                            end
                        end
                    end
                end)


                local ToggleLevel =
                    Tabs.Main:AddToggle(
                    "AutoFarm",
                    {Title = "Farm Specific", Description = "Farm Specific Enemy", Default = false}
                )
                ToggleLevel:OnChanged(
                    function(Value)
                        -- while task.wait(0.090) do
                        _G.IsFarming = Value
                        while Value do
                            task.wait(0.55)
                            if _G.CurrentQuest == "MechaDroid" then
                                AutoFarm(
                                    workspace.Enemys.Instances:GetChildren(),
                                    "mechadroid.000_mechadroid.021",
                                    _G.IsFarming,
                                    Missions.Quest1,
                                    getalien()
                                )
                            elseif _G.CurrentQuest == "SpinBot" then
                                AutoFarm(
                                    workspace.Enemys.Instances:GetChildren(),
                                    "Circle.000_Circle.006",
                                    _G.IsFarming,
                                    Missions.Quest2,
                                    getalien()
                                )
                            elseif _G.CurrentQuest == "SpinBot Boss" then
                                AutoFarm(
                                    workspace.Enemys.Instances:GetChildren(),
                                    "obj1.005_obj1.001",
                                    _G.IsFarming,
                                    Missions.Quest3,
                                    getalien()
                                )
                            elseif _G.CurrentQuest == "Frog" then
                                AutoFarm(
                                    workspace.Enemys.Instances:GetChildren(),
                                    "Cube.000_Cube.004",
                                    _G.IsFarming,
                                    Missions.Quest4,
                                    getalien()
                                )
                            elseif _G.CurrentQuest == "T-Rex" then
                                AutoFarm(
                                    workspace.Enemys.Instances:GetChildren(),
                                    "TRex_30M_part01",
                                    _G.IsFarming,
                                    Missions.Quest5,
                                    getalien()
                                )
                            elseif _G.CurrentQuest == "Eternal" then
                                while _G.IsFarming and Value do
                                    pcall(
                                        function()
                                            transform(getalien())
                                            if _G.FarmMetod == "Level Farm" then
                                                TakeQuest(Missions.Quest7)
                                            end
                                            local enemies = workspace.Enemys.Instances:GetChildren()
                                            for _, enemy in pairs(enemies) do
                                                if _G.FarmMetod == "Level Farm" then
                                                    TakeQuest(Missions.Quest7)
                                                end
                                                if
                                                    enemy:IsA("Model") and enemy:FindFirstChild("Spear") and
                                                        enemy.Spear:FindFirstChild("Center") and
                                                        _G.IsFarming
                                                 then
                                                    if _G.FarmMetod == "Level Farm" then
                                                        TakeQuest(Missions.Quest7)
                                                    end
                                                    transform(getalien())
                                                    local Hitbox = enemy.Spear.Center

                                                    while enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and
                                                        _G.IsFarming do
                                                        if _G.FarmMetod == "Level Farm" then
                                                            TakeQuest(Missions.Quest7)
                                                        end
                                                        transform(getalien())
                                                        AttackEnemy(Hitbox)
                                                    end
                                                    transform(getalien())
                                                    if _G.FarmMetod == "Level Farm" then
                                                        TakeQuest(Missions.Quest7)
                                                    end
                                                end
                                            end
                                        end
                                    )
                                    wait(.1)
                                end
                            elseif _G.CurrentQuest == "Elite Eternal" then
                                while _G.IsFarming do
                                    pcall(
                                        function()
                                            transform(getalien())
                                            if _G.FarmMetod == "Level Farm" then
                                                TakeQuest(Missions.Quest8)
                                            end
                                            local enemies = workspace.Enemys.Instances:GetChildren()
                                            for _, enemy in pairs(enemies) do
                                                if _G.FarmMetod == "Level Farm" then
                                                    TakeQuest(Missions.Quest8)
                                                end
                                                if
                                                    enemy:IsA("Model") and enemy:FindFirstChild("Sword") and
                                                        enemy.Sword:FindFirstChild("Center") and
                                                        _G.IsFarming
                                                 then
                                                    if _G.FarmMetod == "Level Farm" then
                                                        TakeQuest(Missions.Quest8)
                                                    end
                                                    transform(getalien())
                                                    local Hitbox = enemy.Sword.Center

                                                    while enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and
                                                        _G.IsFarming do
                                                        if _G.FarmMetod == "Level Farm" then
                                                            TakeQuest(Missions.Quest8)
                                                        end
                                                        transform(getalien())
                                                        AttackEnemy(Hitbox)
                                                    end
                                                    transform(getalien())
                                                    if _G.FarmMetod == "Level Farm" then
                                                        TakeQuest(Missions.Quest8)
                                                    end
                                                elseif _G.CurrentQuest == "Clown" then
                                                    AutoFarm(
                                                        workspace.Enemys.Instances:GetChildren(),
                                                        "Handle",
                                                        _G.IsFarming,
                                                        Missions.Quest9,
                                                        getalien()
                                                    )
                                                end
                                            end
                                        end
                                    )
                                    wait(0.1)
                                    -- end
                                end
                            end
                        end
                        while Value do
                            _G.IsFarming = Value
                            wait(1)
                        end
                    end
                )

                local Dropdown =
                    Tabs.Security:AddDropdown(
                    "Dropdown",
                    {
                        Title = "Security Config",
                        Values = {"Kick", "Hop"},
                        Multi = false,
                        Default = "Kick"
                    }
                )

                Dropdown:OnChanged(
                    function(Value)
                        _G.SecurityMode = Value
                    end
                )

                local MultiDropdown =
                    Tabs.Settings:AddDropdown(
                    "MultiDropdown",
                    {
                        Title = "Use Attacks",
                        Description = "Use Attacks for farming",
                        Values = {"Z", "X", "C", "V"},
                        Multi = true,
                        Default = {"Z", "X", "C", "V"}
                    }
                )

                MultiDropdown:OnChanged(
                    function(Value)
                        _G.useZ = Value.Z
                        _G.useX = Value.X
                        _G.useC = Value.C
                        _G.useV = Value.V
                    end
                )

                local Dropdown =
                    Tabs.Settings:AddDropdown(
                    "Dropdown",
                    {
                        Title = "Auto Farm Mode",
                        Values = {"Level Farm", "No Quest"},
                        Multi = false,
                        Default = "Level Farm"
                    }
                )

                Dropdown:OnChanged(
                    function(Value)
                        _G.FarmMetod = Value
                    end
                )

                local Dropdown =
                    Tabs.Settings:AddDropdown(
                    "Dropdown",
                    {
                        Title = "Farm Verification Mode",
                        Values = {"Mid", "Max"},
                        Multi = false,
                        Default = "Max"
                    }
                )

                Dropdown:OnChanged(
                    function(Value)
                        _G.VerifFarm = Value
                    end
                )

                local Toggle = Tabs.Settings:AddToggle("MyToggle", {Title = "Check Quest", Default = false})

                Toggle:OnChanged(
                    function(Value)
                        _G.CheckQuest = Value
                    end
                )

                local Dropdown =
                    Tabs.Settings:AddDropdown(
                    "Dropdown",
                    {
                        Title = "Alien",
                        Values = {
                            "HeatBlast",
                            "Diamond",
                            "XRL8",
                            "GrayMatter",
                            "FourArms",
                            "WildMutt",
                            "Stinkfly",
                            "Aquatic",
                            "Upgrade",
                            "Ghostfreak"
                        },
                        Multi = false,
                        Default = "HeatBlast"
                    }
                )

                Dropdown:OnChanged(
                    function(Value)
                        _G.SelectedAlien = Value
                    end
                )

                local Dropdown =
                    Tabs.Settings:AddDropdown(
                    "Dropdown",
                    {
                        Title = "Tween Settings",
                        Values = {"Above", "Below"},
                        Multi = false,
                        Default = "Above"
                    }
                )

                Dropdown:OnChanged(
                    function(Value)
                        _G.TweenSetting = Value
                    end
                )

                local AntiAfk =
                    Tabs.Settings:AddToggle(
                    "AntiAfk",
                    {Title = "Anti Afk", Description = "Anti Idle Kick", Default = true}
                )
                AntiAfk:OnChanged(
                    function(Value)
                        if Value then
                            game:GetService("Players").LocalPlayer.Idled:connect(
                                function()
                                    game:GetService("VirtualUser"):Button2Down(
                                        Vector2.new(0, 0),
                                        workspace.CurrentCamera.CFrame
                                    )
                                    wait(1)
                                    game:GetService("VirtualUser"):Button2Up(
                                        Vector2.new(0, 0),
                                        workspace.CurrentCamera.CFrame
                                    )
                                end
                            )
                        end
                    end
                )

                local Slider =
                    Tabs.Settings:AddSlider(
                    "Slider",
                    {
                        Title = "Distance",
                        Description = "Tween Distance",
                        Default = 5,
                        Min = 0,
                        Max = 50,
                        Rounding = 2,
                        Callback = function(Value)
                            _G.TweenDistance = Value
                        end
                    }
                )

                Slider:OnChanged(
                    function(Value)
                        _G.TweenDistance = Value
                    end
                )

                local Toggle = Tabs.Itens:AddToggle("MyToggle", {Title = "Auto Roll Skin", Default = false})

                Toggle:OnChanged(
                    function(Value)
                        while Value do
                            game:GetService("ReplicatedStorage").Events.SkinEvent:FireServer("SummonSkin")
                            task.wait(1.5)
                        end
                    end
                )

                local Dropdown =
                    Tabs.Teleport:AddDropdown(
                    "Dropdown",
                    {
                        Title = "Quests",
                        Values = {
                            "None",
                            "QuestM1",
                            "QuestM2",
                            "QuestM3",
                            "QuestM4",
                            "QuestM5",
                            "QuestM6",
                            "QuestM7",
                            "QuestM8",
                            "QuestM9"
                        },
                        Multi = false,
                        Default = "None"
                    }
                )

                Dropdown:OnChanged(
                    function(Value)
                        if Value ~= "None" then
                            TpToQuest(Value)
                        end
                    end
                )

                Tabs.Teleport:AddButton(
                    {
                        Title = "AFK Mode",
                        Description = "Teleport you to AFK",
                        Callback = function()
                            game:GetService("TeleportService"):Teleport(16810818923)
                        end
                    }
                )

                Tabs.Misc:AddButton(
                    {
                        Title = "Redeem Codes",
                        Description = "Redeem all Codes",
                        Callback = function()
                            for _, code in pairs(Codes) do
                                game:GetService("ReplicatedStorage").Events.CodesEvent:FireServer("GetCode", code)
                            end
                        end
                    }
                )

                local Slider =
                    Tabs.Misc:AddSlider(
                    "Slider",
                    {
                        Title = "Speed",
                        Description = "Set Player WalkSpeed",
                        Default = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
                        Min = 16,
                        Max = 300,
                        Rounding = 1,
                        Callback = function(Value)
                            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
                        end
                    }
                )

                Slider:OnChanged(
                    function(Value)
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
                    end
                )

                local Slider =
                    Tabs.Misc:AddSlider(
                    "Slider",
                    {
                        Title = "Jump",
                        Description = "Set Player JumpPower",
                        Default = game.Players.LocalPlayer.Character.Humanoid.JumpPower,
                        Min = 16,
                        Max = 300,
                        Rounding = 1,
                        Callback = function(Value)
                            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
                        end
                    }
                )

                Slider:OnChanged(
                    function(Value)
                        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
                    end
                )

                local function getplayers()
                    local players = {}

                    for i, v in ipairs(game.Players:GetPlayers()) do
                        if (v ~= game.Players.LocalPlayer) then
                            table.insert(players, v.Name)
                        end
                    end
                    return players
                end

                local Dropdown =
                    Tabs.pvp:AddDropdown(
                    "Dropdown",
                    {
                        Title = "Players",
                        Values = getplayers(),
                        Multi = false,
                        Default = 1
                    }
                )

                Dropdown:OnChanged(
                    function(Value)
                        _G.SelectedPlayer = Value
                    end
                )

                local Toggle = Tabs.pvp:AddToggle("MyToggle", {Title = "Kill Player", Default = false})

                Toggle:OnChanged(
                    function(Value)
                        _G.IsFarming = true
                        while workspace[_G.SelectedPlayer].Humanoid.Health > 0 and Value do
                            transform(getalien())
                            local TpPart =
                                workspace[_G.SelectedPlayer]:FindFirstChildOfClass("Part") or
                                workspace[_G.SelectedPlayer]:FindFirstChildOfClass("MeshPart") or
                                workspace[_G.SelectedPlayer].Parts:FindFirstChildOfClass("Part") or
                                workspace[_G.SelectedPlayer].Parts:FindFirstChildOfClass("Part")
                            AttackEnemy(TpPart)
                        end
                        _G.IsFarming = false
                    end
                )
            end
        end
    )
end

pcall(Script)