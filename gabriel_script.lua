--[[ Gabriel Script - Roblox (2025) Fitur: Auto Farm, Speed Boost, Jump Boost, ESP, Anti AFK, Auto Collect, Teleport, Dupe Gunakan dengan bijak dan pahami risikonya. ]]

-- Cek apakah pengguna memiliki akses eksekutor if not game:IsLoaded() then game.Loaded:Wait() end

-- Memuat Mercury Library local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

-- Auto Farm (Tele ke item atau coin) local function autoFarm() while wait(1) do for _, item in pairs(workspace:GetChildren()) do if item:IsA("Part") and item.Name == "Coin" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = item.CFrame wait(0.5) -- Delay untuk keamanan end end end end

-- Speed Boost local function speedBoost(value) local player = game.Players.LocalPlayer player.Character.Humanoid.WalkSpeed = value or 100 -- Default 100 end

-- Jump Boost local function jumpBoost(value) local player = game.Players.LocalPlayer player.Character.Humanoid.JumpPower = value or 150 -- Default 150 end

-- ESP (Menampilkan nama pemain di seluruh map) local function esp() for _, player in pairs(game.Players:GetPlayers()) do if player ~= game.Players.LocalPlayer then local billboard = Instance.new("BillboardGui", player.Character.Head) billboard.Size = UDim2.new(4, 0, 1, 0) billboard.AlwaysOnTop = true local label = Instance.new("TextLabel", billboard) label.Size = UDim2.new(1, 0, 1, 0) label.Text = player.Name label.TextColor3 = Color3.new(1, 0, 0) label.BackgroundTransparency = 1 end end end

-- Anti AFK (Mencegah keluar karena diam) local function antiAFK() game:GetService("Players").LocalPlayer.Idled:Connect(function() game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end) end

-- Auto Collect (Mengambil item di sekitar otomatis) local function autoCollect() while wait(1) do for _, v in pairs(workspace:GetDescendants()) do if v:IsA("TouchTransmitter") and v.Parent then firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0) firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1) end end end end

-- Teleport (Teleport ke lokasi pemain) local function teleportToPlayer(targetName) local target = game.Players:FindFirstChild(targetName) if target and target.Character then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame end end

-- Dupe (Menyalin item tertentu) local function duplicateItem(itemName) local backpack = game.Players.LocalPlayer.Backpack for _, item in pairs(backpack:GetChildren()) do if item.Name == itemName then local clone = item:Clone() clone.Parent = backpack end end end

-- Membuat GUI dengan Mercury local GUI = Mercury:Create{ Name = "Gabriel Hub", Size = UDim2.fromOffset(600, 400), Theme = Mercury.Themes.Dark, Link = "https://github.com/deeeity/mercury-lib" }

-- Menambahkan Tab dan Komponen local MainTab = GUI:Tab{ Name = "Main", Icon = "rbxassetid://8569322835" }

MainTab:Button{ Name = "Mulai Auto Farm", Description = "Ambil semua coin secara otomatis", Callback = function() autoFarm() end }

MainTab:Slider{ Name = "Speed Boost", Default = 100, Min = 16, Max = 250, Callback = function(value) speedBoost(value) end }

MainTab:Slider{ Name = "Jump Boost", Default = 150, Min = 50, Max = 300, Callback = function(value) jumpBoost(value) end }

MainTab:Button{ Name = "ESP", Description = "Tampilkan semua pemain", Callback = function() esp() end }

MainTab:Button{ Name = "Anti AFK", Description = "Cegah dari keluar karena diam", Callback = function() antiAFK() end }

MainTab:Button{ Name = "Auto Collect", Description = "Ambil semua item di sekitar", Callback = function() autoCollect() end }

MainTab:Textbox{ Name = "Teleport ke Pemain", Description = "Masukkan nama pemain", Callback = function(txt) teleportToPlayer(txt) end }

MainTab:Textbox{ Name = "Dupe Item", Description = "Masukkan nama item", Callback = function(txt) duplicateItem(txt) end }

print("Gabriel Script Aktif dengan Mercury!")

