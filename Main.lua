--[[

	westbound.pro by Exunys © CC0 1.0 Universal (2023)
	https://github.com/Exunys

]]

local assert = assert

assert(game.PlaceId == 2474168535, "[westbound.pro] - The game you executed the script on is not Westbound!")

repeat task.wait(0) until game:IsLoaded()

local getgenv, getgc, hookmetamethod, hookfunction, newcclosure, setfpscap, getconnections, getconstant, getconstants, setconstant, getinfo, isfile, printconsole = getgenv, getgc, hookmetamethod, hookfunction, newcclosure, setfpscap, getconnections, debug.getconstant, debug.getconstants, debug.setconstant, debug.getinfo, isfile, printconsole or function() end
local getfenv, require, rawget, rawset, loadstring, select, next, unpack, tick, tostring, type, typeof, delay, wait = getfenv, require, rawget, rawset, loadstring, select, next, table.unpack, tick, tostring, type, typeof, task.delay
local stringgsub, stringfind, stringsub, stringformat = string.gsub, string.find, string.sub, string.format
local mathrandom = math.random
local tablefind = table.find
local coroutinewrap = coroutine.wrap
local Instancenew, Color3fromRGB, Vector3new, Vector3zero, Vector2new, CFramenew, TweenInfonew, GetService, WorldToViewportPoint, GetPartsObscuringTarget, GetMouseLocation, FindFirstChild, FindFirstChildOfClass, WaitForChild, GetChildren, GetDescendants, GetPlayers, GetPlayerFromCharacter, HttpGet = Instance.new, Color3.fromRGB, Vector3.new, Vector3.zero, Vector2.new, CFrame.new, TweenInfo.new, function(...)
	return game.GetService(game, ...)
end

local UserInputService, TeleportService, HttpService, TweenService, RunService, ReplicatedStorage, StarterGui, VirtualUser, Players, Lighting, Teams = GetService("UserInputService"), GetService("TeleportService"), GetService("HttpService"), GetService("TweenService"), GetService("RunService"), GetService("ReplicatedStorage"), GetService("StarterGui"), GetService("VirtualUser"), GetService("Players"), GetService("Lighting"), GetService("Teams")
local Camera, LocalPlayer = workspace.CurrentCamera, Players.LocalPlayer

wait = function()
	return RunService.RenderStepped.Wait(RunService.RenderStepped)
end

WorldToViewportPoint = function(...)
	return Camera.WorldToViewportPoint(Camera, ...)
end

GetPartsObscuringTarget = function(...)
	return Camera.GetPartsObscuringTarget(Camera, ...)
end

GetMouseLocation = function()
	return UserInputService:GetMouseLocation()
end

FindFirstChild = function(self, ...)
	return self.FindFirstChild(self, ...)
end

FindFirstChildOfClass = function(self, ...)
	return self.FindFirstChildOfClass(self, ...)
end

WaitForChild = function(self, ...)
	return self.WaitForChild(self, ...)
end

GetChildren = function(self, ...)
	return self.GetChildren(self, ...)
end

GetDescendants = function(self, ...)
	return self.GetDescendants(self, ...)
end

GetPlayers = function()
	return Players:GetPlayers()
end

GetPlayerFromCharacter = function(...)
	return Players:GetPlayerFromCharacter(...)
end

HttpGet = function(...)
	return game.HttpGet(game, ...)
end

if getgenv().AirTeam_westboundpro then return end

getgenv().AirTeam_westboundpro = {
	Version = "V1.6.6",

	Settings = {
		SilentAim = {
			Enabled = false,
			WallCheck = false,
			HitChance = 100,
		},

		Triggerbot = {
			Enabled = false,
			Delay = 0
		},

		Character = {
			AutoFarm = false,
			AutoFarmLocation = "Tumbleweed",
			RobRegisterAura = false,
			AntiRagdoll = false,
			NoFallDamage = false,
			NoJumpCooldown = false,
			AutoHeal = false,
			InfiniteGallopStamina = false,
			AutoBreakFree = false,
			InstantContextAction = false,
			InstantRespawn = false,
			DisableCashNotification = false,
			CollectCash = false
		},

		GunMods = {
			NoSpread = false,
			NoCooldowns = false,
			NoRecoil = false,
			NoFireRate = false,
			InfiniteAmmo = false,
			OneShot = false,
			MaxShots = false
		},

		FOV = {
			Enabled = false,
			Amount = 90
		},

		Miscellaneous = {
			FullBright = false,
			AmbientColor = Color3fromRGB(255, 255, 255),
			AntiAFK = false,
			OptimizeUponUnfocus = false,
			Fly = false,
			FlyKeybind = Enum.KeyCode.F,
			FlySpeed = 1,
			NoClip = false,
			NoClipKeybind = Enum.KeyCode.X
		},

		HitPart = "Head",
		ToggleKeybind = Enum.KeyCode.RightShift,
	},

	Aimbot = {
		Settings = {
			Enabled = false,
			WallCheck = false,
			Sensitivity = 0, -- Animation length (in seconds) before fully locking onto target
			ThirdPerson = false, -- Uses mousemoverel instead of CFrame to support locking in third person (could be choppy)
			ThirdPersonSensitivity = 3,
			TriggerKey = "MouseButton2",
			Toggle = false,
		},

		FOVSettings = {
			Color = Color3fromRGB(255, 255, 255),
			LockedColor = Color3fromRGB(255, 70, 70),
			Transparency = 0.5,
			Sides = 60,
			Thickness = 1,
			Filled = false
		}
	},

	WallHack = {
		Settings = {
			Enabled = false,
			TeamCheck = false,
			AliveCheck = true,
			Animals = false
		},

		Visuals = {
			ESPSettings = {
				Enabled = true,
				TextColor = Color3fromRGB(255, 255, 255),
				TextSize = 14,
				Outline = true,
				OutlineColor = Color3fromRGB(0, 0, 0),
				TextTransparency = 0.7,
				TextFont = Drawing.Fonts.UI, -- UI, System, Plex, Monospace
				DisplayDistance = true,
				DisplayHealth = true,
				DisplayName = true
			},

			TracersSettings = {
				Enabled = true,
				Type = 1, -- 1 - Bottom; 2 - Center; 3 - Mouse
				Transparency = 0.7,
				Thickness = 1,
				Color = Color3fromRGB(255, 255, 255)
			},

			BoxSettings = {
				Enabled = true,
				Type = 1; -- 1 - 3D; 2 - 2D;
				Color = Color3fromRGB(255, 255, 255),
				Transparency = 0.7,
				Thickness = 1,
				Filled = false, -- For 2D
				Increase = 1
			},

			HeadDotSettings = {
				Enabled = true,
				Color = Color3fromRGB(255, 255, 255),
				Transparency = 0.5,
				Thickness = 1,
				Filled = true,
				Sides = 30
			}
		},

		Crosshair = {
			Settings = {
				Enabled = false,
				Type = 1, -- 1 - Mouse; 2 - Center
				Size = 12,
				Thickness = 1,
				Color = Color3fromRGB(0, 255, 0),
				Transparency = 1,
				GapSize = 5,
				CenterDot = false,
				CenterDotColor = Color3fromRGB(0, 255, 0),
				CenterDotSize = 1,
				CenterDotTransparency = 1,
				CenterDotFilled = true,
				CenterDotThickness = 1
			},
		}
	}
}

local CharacterValues, LocationsVectors, FullBrightValues, OldLightingValues, Teleporting, Flying, NoClipping, Farming, Typing, Debounce, HealDebounce, Version, PrevHealth = {
	WalkSpeed = 13,
	JumpPower = 45
}, {
	Tumbleweed = Vector3new(-386, 12, -83),
	StoneCreek = Vector3new(951, 21, 206),
	Grayridge = Vector3new(1519, 120, 1591),
	RustRidgeQuarry = Vector3new(-1659, -28, 1639),
	FortArthur = Vector3new(-65, 72, 1267),
	FortCassidy_SAFE = Vector3new(-1239, 160, -571),
	RedRocksCamp_SAFE = Vector3new(1862, 104, -1827)
}, {}, {}, false, false, false, false, false, false, false, "V1.6.6", 100

local Parts, Fonts, TracersType = {"Random", "Head", "HumanoidRootPart", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg", "UpperTorso", "LeftUpperLeg", "RightFoot", "RightLowerLeg", "LowerTorso", "RightUpperLeg"}, {"UI", "System", "Plex", "Monospace"}, {"Bottom", "Center", "Mouse"}
local Mouse, RagdollScript, GeneralEvents, RagdollFunction, OldRecoilFunction, Notification = LocalPlayer:GetMouse(), require(ReplicatedStorage.SharedModules.Ragdoll), ReplicatedStorage.GeneralEvents
RagdollFunction = RagdollScript.EnableRagdoll

if not LocalPlayer.Character then
	StarterGui:SetCore("SendNotification", {
		Title = "westbound.pro",
		Text = "Waiting for character to load...",
		Duration = 1 / 0,
		Icon = "rbxassetid://6238537240",
		Button1 = "OK"
	})
end

repeat wait() until LocalPlayer.Character and FindFirstChildOfClass(LocalPlayer.Character, "Humanoid")

local Tick = tick()

local ConfigLibrary = loadstring(HttpGet("https://raw.githubusercontent.com/Exunys/Config-Library/main/Main.lua"))()
loadstring(HttpGet("https://raw.githubusercontent.com/Exunys/westbound.pro-Utilites/main/Aimbot.lua"))()
loadstring(HttpGet("https://raw.githubusercontent.com/Exunys/westbound.pro-Utilites/main/WallHack.lua"))()

printconsole(stringformat("[westbound.pro %s] - Fetching script configuration...", Version), 100, 100, 200)

if not isfile("AirTeam/westbound.pro/Config.json") then
	printconsole(stringformat("[westbound.pro %s] - Failed to find the configuration! Creating a new one...", Version), 200, 50, 50)
	ConfigLibrary:SaveConfig("AirTeam/westbound.pro/Config.json", getgenv().AirTeam_westboundpro)
end

local Config = ConfigLibrary:LoadConfig("AirTeam/westbound.pro/Config.json")

if Config.Version and Config.Version == Version then
	getgenv().AirTeam_westboundpro = Config
	printconsole(stringformat("[westbound.pro %s] - Loaded configuration!", Version), 100, 200, 100)
else
	printconsole(stringformat("[westbound.pro %s] - Configuration version (%s) outdated! Deleting and creating a new configuration...", Version, Config.Version or "N/A"), 0, 200, 200)
	delfile("AirTeam/westbound.pro/Config.json")
	ConfigLibrary:SaveConfig("AirTeam/westbound.pro/Config.json", getgenv().AirTeam_westboundpro)
end

local Settings, Aimbot, WallHack, OldNamecall, OldNewIndex, OldIndex = getgenv().AirTeam_westboundpro.Settings, getgenv().AirTeam_westboundpro.Aimbot, getgenv().AirTeam_westboundpro.WallHack

FullBrightValues = {
	FogColor = Settings.Miscellaneous.AmbientColor,
	FogEnd = 1 / 0,
	FogStart = 1 / 0,
	Ambient = Settings.Miscellaneous.AmbientColor,
	Brightness = 5,
	ColorShift_Bottom = Settings.Miscellaneous.AmbientColor,
	ColorShift_Top = Settings.Miscellaneous.AmbientColor,
	OutdoorAmbient = Settings.Miscellaneous.AmbientColor,
	Outlines = true
}

local CoreFunctions = {
	GetClosestPlayer = function()
		local HitPart, RequiredDistance, Target = Settings.HitPart == "Random" and Parts[mathrandom(2, #Parts)] or Settings.HitPart, Settings.FOV.Enabled and Settings.FOV.Amount or 2000

		for _, v in next, GetPlayers() do
			if v ~= LocalPlayer and v.Character and FindFirstChild(v.Character, Settings.HitPart) and FindFirstChildOfClass(v.Character, "Humanoid") then
				if FindFirstChildOfClass(v.Character, "ForceField") then continue end
				if FindFirstChildOfClass(v.Character, "Humanoid").Health <= 0 then continue end
				if LocalPlayer.Team == Teams.Cowboys and v.TeamColor == LocalPlayer.TeamColor then continue end
				if Settings.SilentAim.WallCheck and #(GetPartsObscuringTarget({v.Character[HitPart].Position}, GetDescendants(v.Character))) > 0 then continue end

				local Vector, OnScreen = WorldToViewportPoint(v.Character[HitPart].Position); Vector = Vector2new(Vector.X, Vector.Y)
				local Distance = (GetMouseLocation() - Vector).Magnitude

				if Distance < RequiredDistance and OnScreen then
					RequiredDistance = Distance
					Target = v
				end
			end
		end

		return Target
	end,

	GetClosestCashRegister = function()
		local RequiredDistance, Target = 10

		for _, v in next, GetChildren(workspace) do
			if v.ClassName == "Model" and v.Name == "CashRegister" then
				local Distance = (LocalPlayer.Character.PrimaryPart.Position - v.Union.Position).Magnitude

				Target = Distance < RequiredDistance and v or Target
				RequiredDistance = Distance < RequiredDistance and Distance or RequiredDistance
			end
		end

		return Target
	end,

	Teleport = function(Location, AutoFarm)
		if Teleporting --[[or Settings.Character.AutoFarm and not AutoFarm]] then return end

		local PrimaryPart = LocalPlayer.Character.PrimaryPart; Teleporting = true

		repeat wait() until PrimaryPart.Position

		local Animation = TweenService:Create(PrimaryPart, TweenInfonew((PrimaryPart.Position - Location).Magnitude / 150, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {CFrame = CFramenew(Location)})
		Animation:Play(); Animation.Completed:Connect(function()
			Teleporting = false; wait(); return true
		end)
	end,

	SeparateUpper = function(Value)
		return stringgsub(Value, "(%l)(%u)", function(...)
			return select(1, ...).." "..select(2, ...)
		end)
	end
}

local Functions = {
	ModGuns = function()
		for _, v in next, getgc(true) do
			if type(v) == "table" and rawget(v, "Shots") then
				if Settings.GunMods.InfiniteAmmo then
					rawset(v, "Shots", v.GunStats.MaxShots)
					v.AmmoVal.Clip.Value = v.GunStats.MaxShots
					rawset(v, "TotalAmmoClient", LocalPlayer.Stats.AmmoCapacityLevel.CurrentAmount.Value)
				end

				if Settings.GunMods.ShotgunOneShot then
					rawset(v.GunStats, "BulletCount", v.GunStats.MaxShots)
				end

				if Settings.GunMods.NoSpread then
					rawset(v.GunStats, "ZoomAccuracy", 0)
					rawset(v.GunStats, "HipFireAccuracy", 0)
					rawset(v.GunStats, "FiringOffset", CFramenew(Vector3zero, Vector3zero, Vector3zero))
				end

				if Settings.GunMods.NoCooldowns then
					rawset(v.GunStats, "ReloadSpeed", 0)
					rawset(v.GunStats, "equipSpeed", 0)
					rawset(v.GunStats, "EquipDelay", 0)
					rawset(v.GunStats, "ReloadAnimationSpeed", 0)
					rawset(v.GunStats, "InstantFireAnimation", true)
					rawset(v.GunStats, "prepSpeed", 0)
					rawset(v.GunStats, "ZoomFOVSpeed", 0)
					rawset(v, "reloadManual", false)
				end

				if Settings.GunMods.MaxShots then
					rawset(v.GunStats, "MaxShots", rawget(v, "TotalAmmoClient"))
				end

				OldRecoilFunction = getconstant(v.shakeCam, 1) ~= "RECOIL OFF" and v.shakeCam or OldRecoilFunction

				rawset(v, "shakeCam", Settings.GunMods.NoRecoil and function() local _ = "RECOIL OFF" end or OldRecoilFunction)

				if Settings.GunMods.NoFireRate then
					rawset(v, "shotDebounce", false)
					rawset(v, "Delay", 0)
				end
			end
		end
	end,

	ChangeWalkSpeed = function(Value)
		for _, v in next, getgc(true) do
			if type(v) == "table" then
				if rawget(v, "GunOutRunSpeed") then
					if Value == 13 then
						rawset(v, "RunSpeed", 30)
						rawset(v, "GunOutRunSpeed", 26)
						rawset(v, "WalkSpeed", 13)
						rawset(v, "ZoomSpeed", 13)
					else
						rawset(v, "RunSpeed", Value * 2.3)
						rawset(v, "GunOutRunSpeed", Value * 2)
						rawset(v, "WalkSpeed", Value)
						rawset(v, "ZoomSpeed", Value)
					end
				end
			end
		end

		CharacterValues.WalkSpeed = Value
		LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end,

	ChangeJumpPower = function(Value)
		CharacterValues.JumpPower = Value
		LocalPlayer.Character.Humanoid.JumpPower = Value
	end,

	Respawn = function()
		GeneralEvents.Spawn:FireServer(nil, LocalPlayer.Team == Teams.Outlaws)
	end,

	RagdollCallback = function(Value)
		Settings.Character.AntiRagdoll = Value and Value or Settings.Character.AntiRagdoll

		if Settings.Character.AntiRagdoll or Farming then
			hookfunction(RagdollScript.EnableRagdoll, function() end)
		else
			hookfunction(RagdollScript.EnableRagdoll, RagdollFunction)
		end
	end,

	EditJumpingStamina = function()
		repeat wait() until FindFirstChildOfClass(LocalPlayer.Character, "Humanoid")

		for _, v in next, getconnections(LocalPlayer.Character.Humanoid.Jumping) do
			if #getconstants(v.Function) == 15 and (getconstant(v.Function, 8) == 1.4 or getconstant(v.Function, 8) == 0.1) then
				setconstant(v.Function, 8, (Settings.Character.NoJumpCooldown or CharacterValues.JumpPower > 45) and 0.1 or 1.4)
			end
		end
	end,

	Fly = function()
		if not Settings.Miscellaneous.Fly then return end

		repeat wait() until LocalPlayer.Character and FindFirstChild(LocalPlayer.Character, "HumanoidRootPart") and FindFirstChildOfClass(LocalPlayer.Character, "Humanoid")

		local Control, LocalControl, Speed = {F = 0, B = 0, L = 0, R = 0}, {F = 0, B = 0, L = 0, R = 0}, 0
		local BG, BV = Instancenew("BodyGyro", LocalPlayer.Character.HumanoidRootPart), Instancenew("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)

		BG.P = 9e4
		BG.MaxTorque = Vector3new(9e9, 9e9, 9e9)
		BG.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame

		BV.Velocity = Vector3new(0, 0.1, 0)
		BV.MaxForce = Vector3new(9e9, 9e9, 9e9)

		coroutinewrap(function()
			repeat
				wait(); LocalPlayer.Character.Humanoid.PlatformStand = true

				if Control.L + Control.R ~= 0 or Control.F + Control.B ~= 0 then
					Speed = 50
				elseif not (Control.L + Control.R ~= 0 or Control.F + Control.B ~= 0) and Speed ~= 0 then
					Speed = 0
				end

				if (Control.L + Control.R) ~= 0 or (Control.F + Control.B) ~= 0 then
					BV.Velocity = ((Camera.CFrame.LookVector * (Control.F + Control.B)) + ((Camera.CFrame * CFramenew(Control.L + Control.R, (Control.F + Control.B) * 0.2, 0).p) - Camera.CFrame.Position)) * Speed
					LocalControl = {F = Control.F, B = Control.B, L = Control.L, R = Control.R}
				elseif (Control.L + Control.R) == 0 and (Control.F + Control.B) == 0 and Speed ~= 0 then
					BV.Velocity = ((Camera.CFrame.LookVector * (LocalControl.F + LocalControl.B)) + ((Camera.CFrame * CFramenew(LocalControl.L + LocalControl.R, (LocalControl.F + LocalControl.B) * 0.2, 0).p) - Camera.CFrame.Position)) * Speed
				else
					BV.Velocity = Vector3new(0, 0.1, 0)
				end

				BG.CFrame = Camera.CFrame
			until not Flying

			Control, LocalControl, Speed = {F = 0, B = 0, L = 0, R = 0}, {F = 0, B = 0, L = 0, R = 0}, 0

			BG:Destroy()
			BV:Destroy()

			LocalPlayer.Character.Humanoid.PlatformStand = false
		end)()

		UserInputService.InputBegan:Connect(function(Input)
			if not Typing then
				if Input.KeyCode == Enum.KeyCode.W then
					Control.F = Settings.Miscellaneous.FlySpeed
				elseif Input.KeyCode == Enum.KeyCode.S then
					Control.B = -Settings.Miscellaneous.FlySpeed
				elseif Input.KeyCode == Enum.KeyCode.A then
					Control.L = -Settings.Miscellaneous.FlySpeed
				elseif Input.KeyCode == Enum.KeyCode.D then
					Control.R = Settings.Miscellaneous.FlySpeed
				end
			end
		end)

		UserInputService.InputEnded:Connect(function(Input)
			if not Typing then
				if Input.KeyCode == Enum.KeyCode.W then
					Control.F = 0
				elseif Input.KeyCode == Enum.KeyCode.S then
					Control.B = 0
				elseif Input.KeyCode == Enum.KeyCode.A then
					Control.L = 0
				elseif Input.KeyCode == Enum.KeyCode.D then
					Control.R = 0
				end
			end
		end)
	end,

	NoClip = function()
		UserInputService.InputBegan:Connect(function(Input)
			if Input.KeyCode == Settings.NoClipKeybind and not Typing and Settings.Miscellaneous.NoClip then
				NoClipping = not NoClipping
			end
		end)

		RunService.RenderStepped:Connect(function()
			if NoClipping and Settings.Miscellaneous.NoClip then
				if LocalPlayer.Character and FindFirstChildOfClass(LocalPlayer.Character, "Humanoid") then
					for _, v in next, Parts do
						if not v == "Random" then
							LocalPlayer.Character[v].CanCollide = false
						end
					end
				end
			end
		end)
	end,

	FullBrightCallback = function(Value)
		Settings.Miscellaneous.FullBright = Value

		for i, v in next, Settings.Miscellaneous.FullBright and FullBrightValues or OldLightingValues do
			Lighting[i] = v
		end
	end,

	AutoFarm = function(self)
		if not Farming and Settings.Character.AutoFarm and LocalPlayer.Character and not Teleporting then
			Farming = true; self.RagdollCallback(); CoreFunctions.Teleport(Settings.Character.AutoFarmLocation == "Grayridge" and Vector3new(1478, 133, 1658) or Settings.Character.AutoFarmLocation == "Tumbleweed" and Vector3new(-326, 14, -10), true)

			repeat wait() until Settings.Character.AutoFarm and not Teleporting and LocalPlayer.Character and Farming

			repeat
				wait(); local ClosestRegister = CoreFunctions.GetClosestCashRegister(); GeneralEvents.Rob:FireServer("Register", {
					ActiveValue = ClosestRegister.Active,
					Active = true,
					Part = ClosestRegister.Union,
					OpenPart = ClosestRegister.Open
				})
			until LocalPlayer.States.Bag.Value == LocalPlayer.Stats.BagSizeLevel.CurrentAmount.Value and Settings.Character.AutoFarm and LocalPlayer.Character and Farming

			CoreFunctions.Teleport(Settings.Character.AutoFarmLocation == "Grayridge" and LocationsVectors.FortArthur or Settings.Character.AutoFarmLocation == "Tumbleweed" and LocationsVectors.FortCassidy_SAFE, true)

			repeat wait() until LocalPlayer.States.Bag.Value == 0 and Settings.Character.AutoFarm and not Teleporting and LocalPlayer.Character and Farming

			Farming = false; self.RagdollCallback()
		end
	end,

	AutoFarm_Remote = function()
		if not Settings.Character.AutoFarm then return end

		ReplicatedStorage.Quests.Events.QuestEvent:FireServer({
			QuestType = "Tutorial",
			Action = "QuestsActiveChanged",
			Active = true
		})

		ReplicatedStorage.Quests.Events.QuestEvent:FireServer({
			Action = "Activate",
			QuestName = "Kill an outlaw and collect the bounty",
			QuestId = 1030,
			QuestType = "Tutorial"
		})

		ReplicatedStorage.Quests.Events.QuestFunction:InvokeServer({
			Action = "ClearActiveQuest",
			QuestName = "Kill an outlaw and collect the bounty",
			QuestId = 1030,
			QuestType = "Tutorial"
		})
	end,

	RobRegisterAura = function()
		if not Settings.Character.RobRegisterAura then return end
		if LocalPlayer.States.Bag.Value == LocalPlayer.Stats.BagSizeLevel.CurrentAmount.Value then return end

		local ClosestRegister = CoreFunctions.GetClosestCashRegister()

		if ClosestRegister then
			GeneralEvents.Rob:FireServer("Register", {
				ActiveValue = ClosestRegister.Active,
				Active = true,
				Part = ClosestRegister.Union,
				OpenPart = ClosestRegister.Open
			})
		end
	end,

	Triggerbot = function()
		if Settings.Triggerbot.Enabled and Mouse.Target and FindFirstChildOfClass(Mouse.Target.Parent, "Humanoid") and GetPlayerFromCharacter(Mouse.Target.Parent) and FindFirstChildOfClass(LocalPlayer.Character, "Tool") then
			if Settings.Triggerbot.Delay / 100 ~= 0 then
				task.wait(Settings.Triggerbot.Delay / 100)
			end

			mouse1press(); task.wait(0); mouse1release()
		end
	end,

	OnCharacter = function(self, Character)
		delay(1, function()
			if Debounce then return end; Debounce = true

			Character = Character or WaitForChild(LocalPlayer.Character, "Humanoid").Parent

			for _, v in next, getgc() do
				if type(v) == "function" and getfenv(v).script then
					if getfenv(v).script.Name == "GunLocalModule" and Settings.SilentAim.Enabled then
						if getinfo(v).name == "shootBullet" then
							local function SilentAim(Arguments)
								local ClosestPlayer = CoreFunctions.GetClosestPlayer()

								if ClosestPlayer and Settings.SilentAim.Enabled and (100 * mathrandom()) < Settings.SilentAim.HitChance then
									Arguments[1].GunStats.FiringOffset = CFramenew(Vector3zero, Vector3zero, Vector3zero)
									Arguments[3] = ClosestPlayer.Character[Settings.HitPart].Position
								end

								return unpack(Arguments)
							end

							local Old; Old = hookfunction(v, function(...)
								Old(SilentAim({...}))
							end)
						end
					else
						if getinfo(v).name == "SetUpContextHoldGui" and Settings.Character.AutoBreakFree then
							local Old; Old = hookfunction(v, function(...)
								if ({...}).Title == "Struggle" and Settings.Character.AutoBreakFree then
									GeneralEvents.LassoEvents:FireServer("BreakFree")
								else
									Old(...)
								end
							end)
						elseif getinfo(v).name == "ContextHoldFunc" and Settings.Character.InstantContextAction then
							local Old; Old = hookfunction(v, function(...)
								local Arguments = {...}; Arguments[#Arguments] = Settings.Character.InstantContextAction and 0 or Arguments[#Arguments]

								Old(unpack(Arguments))
							end)
						end
					end
				end
			end

			delay(0.5, self.EditJumpingStamina)

			delay(1, function()
				self.ChangeWalkSpeed(CharacterValues.WalkSpeed)
				self.ChangeJumpPower(CharacterValues.JumpPower)
			end)

			wait(); WaitForChild(Character, "Humanoid", 1 / 0).Died:Connect(function()
				Flying, Farming, Teleporting = false, false, false

				if Settings.Character.InstantRespawn or Settings.Character.AutoFarm then
					self.Respawn()
				end
			end)

			PrevHealth = WaitForChild(Character, "Humanoid", 1 / 0).Health

			WaitForChild(Character, "Humanoid", 1 / 0).Changed:Connect(function()
				local _Character = LocalPlayer.Character
				local Humanoid = FindFirstChildOfClass(_Character, "Humanoid")

				if _Character and Humanoid and Humanoid.Health < PrevHealth and Humanoid.Health <= 30 and Humanoid.Health > 0 and Settings.Character.AutoHeal and not HealDebounce then
					PrevHealth, HealDebounce = LocalPlayer.Character.Humanoid.Health, true

					if LocalPlayer.Consumables["Health Potion"].Value > 0 then
						local Potion = LocalPlayer.Backpack["Health Potion"] or LocalPlayer.Character["Health Potion"]

						if Potion then
							Potion.DrinkPotion:InvokeServer()

							StarterGui:SetCore("SendNotification", {
								Title = "westbound.pro",
								Text = stringformat("Used health potion, potions left: %s.", tostring(LocalPlayer.Consumables["Health Potion"].Value)),
								Duration = 3,
								Icon = "rbxassetid://6238537240",
							})
						else
							StarterGui:SetCore("SendNotification", {
								Title = "westbound.pro",
								Text = "Unable to find potion!",
								Duration = 3,
								Icon = "rbxassetid://6238553573",
							})
						end
					else
						StarterGui:SetCore("SendNotification", {
							Title = "westbound.pro",
							Text = "You are out of health potions!",
							Duration = 3,
							Icon = "rbxassetid://6238540373",
						})
					end

					task.wait(1); HealDebounce, PrevHealth = false, Humanoid.Health or 0
				end
			end)

			task.wait(5); Debounce = false
		end)
	end
}

OldNamecall, OldNewIndex, OldIndex = hookmetamethod(game, "__namecall", newcclosure(function(...)
	local NamecallMethod, Self, Arguments = getnamecallmethod(), ..., {select(2, ...)}

	if not checkcaller() then
		if NamecallMethod == "FireServer" then
			if Self.Name == "GunShot" then
				Functions.ModGuns()
			elseif Self.Name == "ChangeCharacter" then
				if Arguments[1] == "Damage" then
					Arguments[2] = Settings.Character.NoFallDamage and 0 or Teleporting and 0 or Farming and 0 or Flying and 0 or Arguments[2]

					return Self.FireServer(Self, unpack(Arguments))
				elseif Arguments[1] == "Ragdoll" and (Settings.Character.AntiRagdoll or Teleporting or Farming or Flying) then
					return nil
				end
			end
		elseif NamecallMethod == "SetStateEnabled" then
			if Self == LocalPlayer.Character.Humanoid then
				if Arguments[1] == Enum.HumanoidStateType.Jumping and Arguments[2] == false then
					Arguments[2] = Settings.Character.NoJumpCooldown and true or false

					return Self.SetStateEnabled(Self, unpack(Arguments))
				end
			end
		elseif NamecallMethod == "Clone" then
			if Self.Name == "Cash" and Self.ClassName == "TextLabel" and Settings.Character.DisableCashNotification then
				return nil
			end
		end
	end

	return OldNamecall(...)
end)), hookmetamethod(game, "__newindex", function(...)
	local Self, Key, Value = ...

	if not checkcaller() then
		if tostring(Self) == "Humanoid" and Key == "JumpPower" and Value ~= CharacterValues.JumpPower and CharacterValues.JumpPower > 45 then
			Self[Key] = CharacterValues.JumpPower
		end
	end

	return OldNewIndex(...)
end)--[[, hookmetamethod(workspace.Horses, "__index", function(...)
	local Self, Key = ...

	if not checkcaller() and tostring(Self) == "CurrentStamina" and Key == "Value" and Settings.Character.InfiniteGallopStamina then
		return 400
	end

	return OldIndex(...)
end)]]

local OldPrint = nil; OldPrint = hookfunction(print, function(...)
	if select("#", ...) == 1 and ... == "dino was here :)" then
		return nil
	end

	return OldPrint(...)
end)

local Library, ColorPallete = loadstring(HttpGet("https://raw.githubusercontent.com/Exunys/westbound.pro-Utilites/main/UI%20Library.lua"))().new(stringformat("westbound.pro [%s]", Version)), {
	Background = Color3fromRGB(10, 20, 30),
	Glow = Color3fromRGB(100, 180, 230),
	Accent = Color3fromRGB(15, 30, 45),
	LightContrast = Color3fromRGB(30, 45, 60),
	DarkContrast = Color3fromRGB(20, 30, 40),
	TextColor = Color3fromRGB(170, 250, 255)
}

local Combat = Library:addPage("Combat", 12412925815)
local Combat_General, Combat_SilentAim, --[[Combat_Triggerbot,]] Combat_Aimbot, Combat_GunMods = Combat:addSection("General"), Combat:addSection("Silent Aim"), --[[Combat:addSection("Triggerbot"),]] Combat:addSection("Aimbot"), Combat:addSection("Gun Mods")

for i, v in next, ColorPallete do
	Library:setTheme(i, v)
end

Combat_General:addToggle("FOV Enabled", Settings.FOV.Enabled, function(Value)
	Settings.FOV.Enabled = Value
end)

Combat_General:addSlider("Field Of View", Settings.FOV.Amount, 10, 600, function(Value)
	Settings.FOV.Amount = Value
end)

Combat_General:addDropdown("Hit Part ("..Settings.HitPart..")", Parts, function(Value)
	Settings.HitPart = Value
end)

Combat_SilentAim:addToggle("Enabled", Settings.SilentAim.Enabled, function(Value)
	Settings.SilentAim.Enabled = Value; Functions:OnCharacter()
end)

Combat_SilentAim:addToggle("Wall Check", Settings.SilentAim.WallCheck, function(Value)
	Settings.SilentAim.WallCheck = Value
end)

Combat_SilentAim:addSlider("Hit Chance", Settings.SilentAim.HitChance, 1, 100, function(Value)
	Settings.SilentAim.HitChance = Value
end)

--[[
Combat_Triggerbot:addToggle("Enabled", Settings.Triggerbot.Enabled, function(Value)
	Settings.Triggerbot.Enabled = Value
end)

Combat_Triggerbot:addSlider("Delay (ms)", Settings.Triggerbot.Delay, 0, 100, function(Value)
	Settings.Triggerbot.Delay = Value
end)
]]

Combat_Aimbot:addToggle("Enabled", Aimbot.Settings.Enabled, function(Value)
	Aimbot.Settings.Enabled = Value
end)

Combat_Aimbot:addToggle("Wall Check", Aimbot.Settings.WallCheck, function(Value)
	Aimbot.Settings.WallCheck = Value
end)

Combat_Aimbot:addToggle("Toggle", Aimbot.Settings.Toggle, function(Value)
	Aimbot.Settings.Toggle = Value
end)

Combat_Aimbot:addSlider("Sensitivity", Aimbot.Settings.Sensitivity * 100, 0, 100, function(Value)
	Aimbot.Settings.Sensitivity = Value / 100
end)

Combat_Aimbot:addToggle("Third Person", Aimbot.Settings.ThirdPerson, function(Value)
	Aimbot.Settings.ThirdPerson = Value
end)

Combat_Aimbot:addSlider("Third Person Sensitivity", Aimbot.Settings.ThirdPersonSensitivity * 10, 1, 50, function(Value)
	Aimbot.Settings.ThirdPersonSensitivity = Value / 10
end)

Combat_Aimbot:addTextbox("Hotkey", Aimbot.Settings.TriggerKey, function(Value)
	Aimbot.Settings.TriggerKey = Value
end)

Combat_Aimbot:addToggle("FOV Circle Filled", Aimbot.FOVSettings.Filled, function(Value)
	Aimbot.FOVSettings.Filled = Value
end)

Combat_Aimbot:addSlider("FOV Circle Transparency", Aimbot.FOVSettings.Transparency * 100, 1, 100, function(Value)
	Aimbot.FOVSettings.Transparency = Value / 100
end)

Combat_Aimbot:addSlider("FOV Circle Sides", Aimbot.FOVSettings.Sides, 3, 60, function(Value)
	Aimbot.FOVSettings.Sides = Value
end)

Combat_Aimbot:addSlider("FOV Circle Thickness", Aimbot.FOVSettings.Thickness, 1, 5, function(Value)
	Aimbot.FOVSettings.Thickness = Value
end)

Combat_Aimbot:addColorPicker("FOV Circle Color", Aimbot.FOVSettings.Color, function(Value)
	Aimbot.FOVSettings.Color = Value
end)

Combat_Aimbot:addColorPicker("FOV Circle Locked Color", Aimbot.FOVSettings.LockedColor, function(Value)
	Aimbot.FOVSettings.LockedColor = Value
end)

for i, v in next, Settings.GunMods do
	Combat_GunMods:addToggle(i == "InfiniteAmmo" and "Infinite Ammo (PATCHED)" or CoreFunctions.SeparateUpper(i), v, function(Value)
		Settings.GunMods[i] = Value
	end)
end

Library:SelectPage(Combat, true)

local Visuals = Library:addPage("Visuals", 12433857701)
local Visuals_General, Visuals_ESP, Visuals_Tracers, Visuals_Boxes, Visuals_HeadDots, Visuals_Crosshair = Visuals:addSection("General"), Visuals:addSection("ESP"), Visuals:addSection("Tracers"), Visuals:addSection("Boxes"), Visuals:addSection("Head Dots"), Visuals:addSection("Crosshair")

for i, v in next, WallHack.Settings do
	Visuals_General:addToggle(CoreFunctions.SeparateUpper(i), v, function(Value)
		WallHack.Settings[i] = Value
	end)
end

for i, v in next, WallHack.Visuals.ESPSettings do
	if i == "TextFont" then continue end

	if typeof(v) == "boolean" then
		Visuals_ESP:addToggle(CoreFunctions.SeparateUpper(i), v, function(Value)
			WallHack.Visuals.ESPSettings[i] = Value
		end)
	elseif typeof(v) == "Color3" then
		Visuals_ESP:addColorPicker(CoreFunctions.SeparateUpper(i), v, function(Value)
			WallHack.Visuals.ESPSettings[i] = Value
		end)
	elseif typeof(v) == "number" then
		Visuals_ESP:addSlider(CoreFunctions.SeparateUpper(i), v < 1 and v * 100 or v, v < 1 and 1 or 8, v < 1 and 100 or 24, function(Value)
			WallHack.Visuals.ESPSettings[i] = v < 1 and Value / 100 or Value
		end)
	end
end

Visuals_ESP:addDropdown("Text Font (UI)", Fonts, function(Value)
	WallHack.Visuals.ESPSettings.TextFont = Drawing.Fonts[Value]
end)

for i, v in next, WallHack.Visuals.TracersSettings do
	if i == "Type" then continue end

	if typeof(v) == "boolean" then
		Visuals_Tracers:addToggle(CoreFunctions.SeparateUpper(i), v, function(Value)
			WallHack.Visuals.TracersSettings[i] = Value
		end)
	elseif typeof(v) == "Color3" then
		Visuals_Tracers:addColorPicker(CoreFunctions.SeparateUpper(i), v, function(Value)
			WallHack.Visuals.TracersSettings[i] = Value
		end)
	elseif typeof(v) == "number" then
		Visuals_Tracers:addSlider(CoreFunctions.SeparateUpper(i), v < 1 and v * 100 or v, v < 1 and 1 or 1, v < 1 and 100 or 5, function(Value)
			WallHack.Visuals.TracersSettings[i] = v < 1 and Value / 100 or Value
		end)
	end
end

Visuals_Tracers:addDropdown("Start From (Bottom)", TracersType, function(Value)
	WallHack.Visuals.TracersSettings.Type = tablefind(TracersType, Value)
end)

for i, v in next, WallHack.Visuals.BoxSettings do
	if i == "Type" then continue end

	if typeof(v) == "boolean" then
		Visuals_Boxes:addToggle(CoreFunctions.SeparateUpper(i), v, function(Value)
			WallHack.Visuals.BoxSettings[i] = Value
		end)
	elseif typeof(v) == "Color3" then
		Visuals_Boxes:addColorPicker(CoreFunctions.SeparateUpper(i), v, function(Value)
			WallHack.Visuals.BoxSettings[i] = Value
		end)
	elseif typeof(v) == "number" then
		Visuals_Boxes:addSlider(CoreFunctions.SeparateUpper(i), v < 1 and v * 100 or v, v < 1 and 1 or 1, v < 1 and 100 or 5, function(Value)
			WallHack.Visuals.BoxSettings[i] = v < 1 and Value / 100 or Value
		end)
	end
end

Visuals_Boxes:addDropdown("Box Type ("..WallHack.Visuals.BoxSettings.Type == 1 and "3D" or "2D"..")", {"3D", "2D"}, function(Value)
	WallHack.Visuals.BoxSettings.Type = Value == "3D" and 1 or Value == "2D" and 2
end)

for i, v in next, WallHack.Visuals.HeadDotSettings do
	if i == "Type" then continue end

	if typeof(v) == "boolean" then
		Visuals_HeadDots:addToggle(CoreFunctions.SeparateUpper(i), v, function(Value)
			WallHack.Visuals.HeadDotSettings[i] = Value
		end)
	elseif typeof(v) == "Color3" then
		Visuals_HeadDots:addColorPicker(CoreFunctions.SeparateUpper(i), v, function(Value)
			WallHack.Visuals.HeadDotSettings[i] = Value
		end)
	elseif typeof(v) == "number" and i ~= "Sides" then
		Visuals_HeadDots:addSlider(CoreFunctions.SeparateUpper(i), v < 1 and v * 100 or v, v < 1 and 1 or 1, v < 1 and 100 or 5, function(Value)
			WallHack.Visuals.HeadDotSettings[i] = v < 1 and Value / 100 or Value
		end)
	end
end

Visuals_HeadDots:addSlider("Sides", WallHack.Visuals.HeadDotSettings.Sides, 3, 30, function(Value)
	WallHack.Visuals.HeadDotSettings.Sides = Value
end)

for i, v in next, WallHack.Crosshair.Settings do
	if i == "Type" then continue end

	if typeof(v) == "boolean" then
		Visuals_Crosshair:addToggle(CoreFunctions.SeparateUpper(i), v, function(Value)
			WallHack.Crosshair.Settings[i] = Value
		end)
	elseif typeof(v) == "Color3" then
		Visuals_Crosshair:addColorPicker(CoreFunctions.SeparateUpper(i), v, function(Value)
			WallHack.Crosshair.Settings[i] = Value
		end)
	elseif typeof(v) == "number" then
		if stringfind(i, "Transparency") then
			Visuals_Crosshair:addSlider(CoreFunctions.SeparateUpper(i), v * 100, 1, 100, function(Value)
				WallHack.Crosshair.Settings[i] = Value / 100
			end)
		elseif i == "Size" then
			Visuals_Crosshair:addSlider(CoreFunctions.SeparateUpper(i), v, 8, 24, function(Value)
				WallHack.Crosshair.Settings[i] = Value
			end)
		elseif i == "GapSize" then
			Visuals_Crosshair:addSlider(CoreFunctions.SeparateUpper(i), v, 0, 20, function(Value)
				WallHack.Crosshair.Settings[i] = Value
			end)
		elseif i == "CenterDotSize" then
			Visuals_Crosshair:addSlider(CoreFunctions.SeparateUpper(i), v, 1, 6, function(Value)
				WallHack.Crosshair.Settings[i] = Value
			end)
		elseif stringfind(i, "Thickness") then
			Visuals_Crosshair:addSlider(CoreFunctions.SeparateUpper(i), v, 1, 5, function(Value)
				WallHack.Crosshair.Settings[i] = Value
			end)
		end
	end
end

Visuals_Crosshair:addDropdown("Position ("..WallHack.Crosshair.Settings.Type == 1 and "Mouse" or "Center"..")", {"Mouse", "Center"}, function(Value)
	WallHack.Crosshair.Settings.Type = Value == "Mouse" and 1 or Value == "Center" and 2
end)

local MouseIconConnection = RunService.RenderStepped:Connect(function()
	UserInputService.MouseIconEnabled = UserInputService.MouseIconEnabled
end)

Visuals_Crosshair:addToggle("Mouse Cursor", UserInputService.MouseIconEnabled, function(Value)
	MouseIconConnection:Disconnect()

	MouseIconConnection = RunService.RenderStepped:Connect(function()
		UserInputService.MouseIconEnabled = Value
	end)
end)

local Character = Library:addPage("Character", 12413774668)
local --[[Character_AutoFarm,]] Character_ = --[[Character:addSection("Autofarm"),]] Character:addSection("Character")

-- Autofarm patched 01.03.2023 (DD/MM/YY)

--[[

Character_AutoFarm:addToggle("Enabled", Settings.Character.AutoFarm, function(Value)
	Settings.Character.AutoFarm = Value
end)

Character_AutoFarm:addToggle("Disable Cash Notifications", Settings.Character.DisableCashNotification, function(Value)
	Settings.Character.DisableCashNotification = Value
end)

]]

--[=[
Character_AutoFarm:addDropdown("Autofarm Location (Tumbleweed)", {"Tumbleweed", "Grayridge"}, function(Value)
	Settings.Character.AutoFarmLocation = Value
end)
]=]

Character_:addToggle("Rob Aura (For Cash Registers)", Settings.Character.RobRegisterAura, function(Value)
	Settings.Character.RobRegisterAura = Value
end)

Character_:addToggle("Anti Ragdoll", Settings.Character.AntiRagdoll, Functions.RagdollCallback)

Character_:addToggle("No Fall Damage", Settings.Character.NoFallDamage, function(Value)
	Settings.Character.NoFallDamage = Value
end)

Character_:addToggle("No Jump Cooldown", Settings.Character.NoJumpCooldown, function(Value)
	Settings.Character.NoJumpCooldown = Value; Functions.EditJumpingStamina()
end)

--[[
Character_:addToggle("Infinite Horse Gallop Stamina", Settings.Character.InfiniteGallopStamina, function(Value)
	Settings.Character.InfiniteGallopStamina = Value
end)
]]

Character_:addToggle("Auto Heal", Settings.Character.AutoHeal, function(Value)
	Settings.Character.AutoHeal = Value
end)

Character_:addToggle("Auto Collect (Teleport) Dropped Cash", Settings.Character.CollectCash, function(Value)
	Settings.Character.CollectCash = Value
end)

Character_:addToggle("Auto Break Free (Struggle)", Settings.Character.AutoBreakFree, function(Value)
	Settings.Character.AutoBreakFree = Value; Functions:OnCharacter()
end)

Character_:addToggle("Instant Context Actions (Skin, Rob, Take...)", Settings.Character.InstantContextAction, function(Value)
	Settings.Character.InstantContextAction = Value; Functions:OnCharacter()
end)

Character_:addToggle("Instant Respawn (PATCHED)", Settings.Character.InstantRespawn, function(Value)
	Settings.Character.InstantRespawn = Value
end)

Character_:addSlider("WalkSpeed", LocalPlayer.Character and CharacterValues.WalkSpeed, 13, 250, Functions.ChangeWalkSpeed)

Character_:addSlider("JumpPower", LocalPlayer.Character and CharacterValues.JumpPower or 45, 45, 500, Functions.ChangeJumpPower)

--[=[
Character_:addButton("Sell Inventory", function()
	CoreFunctions.Teleport(Vector3new(1637, 104, -1735))

	repeat wait() until not Teleporting

	GeneralEvents.Inventory:InvokeServer("Sell")
end)

Character_:addButton("Buy Ammo", function()
	CoreFunctions.Teleport(Vector3new(1721, 104, -1821))

	repeat wait() until not Teleporting

	for _, v in next, {"PistolAmmo", "RifleAmmo", "ShotgunAmmo", "SniperAmmo", "Dynamite", "BIG Dynamite"} do
		GeneralEvents.BuyItem:InvokeServer(v, true)
	end
end)
]=]

Character_:addButton("Remove Nametag", function()
	if LocalPlayer.Character then
		LocalPlayer.Character.Head.NameTag:Destroy()
	end
end)

Character_:addButton("Force Respawn", Functions.Respawn)

Character_:addButton("Become Outlaw", function()
	LocalPlayer.Team = Teams.Outlaws
end)

Character_:addButton("Become Cowboy", function()
	LocalPlayer.Team = Teams.Cowboys
end)

local Locations = Library:addPage("Locations", 12413763018)
local Locations_ = Locations:addSection("Locations (PATCHED)")

for i, v in next, LocationsVectors do
	Locations_:addButton(stringgsub(CoreFunctions.SeparateUpper(i), "_SAFE", " (SAFE ZONE)"), function()
		CoreFunctions.Teleport(v)
	end)
end

local Miscellaneous = Library:addPage("Miscellaneous", 12413838306)
local Miscellaneous_ = Miscellaneous:addSection("Miscellaneous")

Miscellaneous_:addToggle("Full Bright", Settings.Miscellaneous.FullBright, Functions.FullBrightCallback)

Miscellaneous_:addColorPicker("Full Bright Ambient Color", Settings.Miscellaneous.AmbientColor, function(Value)
	Settings.Miscellaneous.AmbientColor = Value

	FullBrightValues = {
		FogColor = Settings.Miscellaneous.AmbientColor,
		FogEnd = 1 / 0,
		FogStart = 1 / 0,
		Ambient = Settings.Miscellaneous.AmbientColor,
		Brightness = 5,
		ColorShift_Bottom = Settings.Miscellaneous.AmbientColor,
		ColorShift_Top = Settings.Miscellaneous.AmbientColor,
		OutdoorAmbient = Settings.Miscellaneous.AmbientColor,
		Outlines = true
	}
end)

Miscellaneous_:addToggle("Anti AFK", Settings.Miscellaneous.AntiAFK, function(Value)
	Settings.Miscellaneous.AntiAFK = Value
end)

Miscellaneous_:addToggle("Unfocused Window CPU & GPU Saver", Settings.Miscellaneous.OptimizeUponUnfocus, function(Value)
	Settings.Miscellaneous.OptimizeUponUnfocus = Value
end)

Miscellaneous_:addSlider("FPS Boost", 60, 60, 360, setfpscap)

-- 1.0 Update (10.2.2023) - Developers made the Flying / Floating / Teleporting anticheat kill the suspect upon being detected

Miscellaneous_:addToggle("(PATCHED) Fly Enabled", Settings.Miscellaneous.Fly, function(Value)
	Settings.Miscellaneous.Fly = Value; Flying = false
end)

Miscellaneous_:addSlider("(PATCHED) Fly Speed", Settings.Miscellaneous.FlySpeed, 1, 10, function(Value)
	Settings.Miscellaneous.FlySpeed = Value
end)

Miscellaneous_:addKeybind("(PATCHED) Toggle Fly", Settings.Miscellaneous.FlyKeybind, function()
	if not Typing then
		Flying = not Flying; Functions.Fly()
	end
end, function(Value)
	Settings.Miscellaneous.FlyKeybind = Value
end)

--[=[

Miscellaneous_:addToggle("NoClip", Settings.Miscellaneous.NoClip, function(Value)
	Settings.Miscellaneous.NoClip = Value; NoClipping = false
end); Functions.NoClip()

Miscellaneous_:addKeybind("Toggle NoClip", Settings.Miscellaneous.NoClipKeybind, function()
	if not Typing then
		NoClipping = not NoClipping
	end
end, function(Value)
	Settings.Miscellaneous.NoClipKeybind = Value
end)

]=]

Miscellaneous_:addButton("Rejoin Game", function()
	Library:Notify("westbound.pro", "This function will unload the script, are you sure you want to rejoin the game?", function(Value)
		if Value then
			Library:toggle(); TeleportService:Teleport(game.PlaceId, LocalPlayer)
		end
	end)
end)

local SettingsPage = Library:addPage("Settings", 12413797746)
local Settings_ = SettingsPage:addSection("Settings")

Settings_:addKeybind("Show/Hide GUI", Settings.ToggleKeybind, function()
	if not Typing then
		Library:toggle()
	end
end, function(Value)
	Settings.CloseKeybind = Value
end)

Settings_:addButton("Reset Config", function()
	if not isfile or not isfile("AirTeam/westbound.pro/Config.json") then return end

	Library:Notify("westbound.pro", "This function will unload the script and reset your settings, are you sure you want to continue?", function(Value)
		if Value then
			delfile("AirTeam/westbound.pro/Config.json")
			Library:toggle(); TeleportService:Teleport(game.PlaceId, LocalPlayer)
		end
	end)
end)

local Credits = Library:addPage("Credits", 12413792680)

Credits:addSection("Developed by Exunys"):addButton("Copy GitHub Profile", function()
	setclipboard("https://github.com/Exunys")
end)

Credits:addSection("Help & testing by Rtxyy"):addButton("Copy Discord Username", function()
	setclipboard("rtxyy")
end)

Credits:addSection("westbound.pro - Project by AirTeam"):addButton("Join Discord Server", function()
	((syn and syn.request) or (http and http.request) or http_request or request)({
		Url = "http://127.0.0.1:6463/rpc?v=1",
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json",
			["origin"] = "https://discord.com"
		},
		Body = HttpService:JSONEncode({
			["args"] = {
				["code"] = "Ncz3H3quUZ"
			},
			["cmd"] = "INVITE_BROWSER",
			["nonce"] = "."
		})
	})

	setclipboard("https://discord.gg/Ncz3H3quUZ")
end)

Credits:addSection("Venyx UI Library by GreenDeno"):addButton("Copy GitHub Page", function()
	setclipboard("https://github.com/GreenDeno/Venyx-UI-Library")
end)

Functions:OnCharacter(); LocalPlayer.CharacterAdded:Connect(function(CharacterObj)
	return Functions:OnCharacter(CharacterObj)
end)

UserInputService.TextBoxFocused:Connect(function()
	Typing = true
end)

UserInputService.TextBoxFocusReleased:Connect(function()
	Typing = false
end)

for i, _ in next, FullBrightValues do
	OldLightingValues[i] = Lighting[i]
end

RunService.RenderStepped:Connect(function()
	Functions.FullBrightCallback(Settings.Miscellaneous.FullBright); Functions.RobRegisterAura(); Functions.Triggerbot()--; Functions.AutoFarm_Remote(); Functions:AutoFarm()
end)

LocalPlayer.Idled:Connect(function()
	if Settings.Miscellaneous.AntiAFK then
		VirtualUser:Button2Down(Vector2new(0, 0), Camera.CFrame); wait(); VirtualUser:Button2Up(Vector2new(0, 0), Camera.CFrame)
	end
end)

UserInputService.WindowFocusReleased:Connect(function()
	if Settings.Miscellaneous.OptimizeUponUnfocus then
		RunService:Set3dRenderingEnabled(false); setfpscap(5)
	end
end)

UserInputService.WindowFocused:Connect(function()
	if Settings.Miscellaneous.OptimizeUponUnfocus then
		RunService:Set3dRenderingEnabled(true); setfpscap(360)
	end
end)

workspace.ChildAdded:Connect(function(Object)
	if LocalPlayer.Character and Object.Name == "Cash" and Settings.Character.CollectCash then
		Object.CFrame = LocalPlayer.Character.PrimaryPart.CFrame
	end
end)

Notification = require(LocalPlayer.PlayerScripts.NotificationModule)

Notification("westbound.pro successfully loaded! ("..stringsub(tostring(tick() - Tick), 1, 4).." seconds)", Color3fromRGB(170, 250, 255))
Notification("Made by Exunys", Color3fromRGB(100, 255, 100))
Notification("https://github.com/Exunys", Color3fromRGB(255, 150, 255))

coroutinewrap(function()
	while task.wait(30) do
		getgenv().AirTeam_westboundpro.Settings = Settings
		getgenv().AirTeam_westboundpro.Aimbot = Aimbot
		getgenv().AirTeam_westboundpro.WallHack = WallHack
		ConfigLibrary:SaveConfig("AirTeam/westbound.pro/Config.json", getgenv().AirTeam_westboundpro)
	end
end)()

writefile("AirTeam/westbound.pro/Information.txt", stringformat([=[[================================================================================]

	westbound.pro [%s] by Exunys © CC0 1.0 Universal (2023)
	https://github.com/Exunys

[=========================] Third Party Resources Used [=========================]

	- Exunys' Config Library = https://github.com/Exunys/Config-Library
	- Venyx UI Library = https://github.com/GreenDeno/Venyx-UI-Library

[==================================] License [===================================]

	Creative Commons Legal Code
	
	CC0 1.0 Universal
	
		CREATIVE COMMONS CORPORATION IS NOT A LAW FIRM AND DOES NOT PROVIDE
		LEGAL SERVICES. DISTRIBUTION OF THIS DOCUMENT DOES NOT CREATE AN
		ATTORNEY-CLIENT RELATIONSHIP. CREATIVE COMMONS PROVIDES THIS
		INFORMATION ON AN "AS-IS" BASIS. CREATIVE COMMONS MAKES NO WARRANTIES
		REGARDING THE USE OF THIS DOCUMENT OR THE INFORMATION OR WORKS
		PROVIDED HEREUNDER, AND DISCLAIMS LIABILITY FOR DAMAGES RESULTING FROM
		THE USE OF THIS DOCUMENT OR THE INFORMATION OR WORKS PROVIDED
		HEREUNDER.
	
	Statement of Purpose
	
	The laws of most jurisdictions throughout the world automatically confer
	exclusive Copyright and Related Rights (defined below) upon the creator
	and subsequent owner(s) (each and all, an "owner") of an original work of
	authorship and/or a database (each, a "Work").
	
	Certain owners wish to permanently relinquish those rights to a Work for
	the purpose of contributing to a commons of creative, cultural and
	scientific works ("Commons") that the public can reliably and without fear
	of later claims of infringement build upon, modify, incorporate in other
	works, reuse and redistribute as freely as possible in any form whatsoever
	and for any purposes, including without limitation commercial purposes.
	These owners may contribute to the Commons to promote the ideal of a free
	culture and the further production of creative, cultural and scientific
	works, or to gain reputation or greater distribution for their Work in
	part through the use and efforts of others.
	
	For these and/or other purposes and motivations, and without any
	expectation of additional consideration or compensation, the person
	associating CC0 with a Work (the "Affirmer"), to the extent that he or she
	is an owner of Copyright and Related Rights in the Work, voluntarily
	elects to apply CC0 to the Work and publicly distribute the Work under its
	terms, with knowledge of his or her Copyright and Related Rights in the
	Work and the meaning and intended legal effect of CC0 on those rights.
	
	1. Copyright and Related Rights. A Work made available under CC0 may be
	protected by copyright and related or neighboring rights ("Copyright and
	Related Rights"). Copyright and Related Rights include, but are not
	limited to, the following:
	
	  i. the right to reproduce, adapt, distribute, perform, display,
		 communicate, and translate a Work;
	 ii. moral rights retained by the original author(s) and/or performer(s);
	iii. publicity and privacy rights pertaining to a person's image or
		 likeness depicted in a Work;
	 iv. rights protecting against unfair competition in regards to a Work,
		 subject to the limitations in paragraph 4(a), below;
	  v. rights protecting the extraction, dissemination, use and reuse of data
		 in a Work;
	 vi. database rights (such as those arising under Directive 96/9/EC of the
		 European Parliament and of the Council of 11 March 1996 on the legal
		 protection of databases, and under any national implementation
		 thereof, including any amended or successor version of such
		 directive); and
	vii. other similar, equivalent or corresponding rights throughout the
		 world based on applicable law or treaty, and any national
		 implementations thereof.
	
	2. Waiver. To the greatest extent permitted by, but not in contravention
	of, applicable law, Affirmer hereby overtly, fully, permanently,
	irrevocably and unconditionally waives, abandons, and surrenders all of
	Affirmer's Copyright and Related Rights and associated claims and causes
	of action, whether now known or unknown (including existing as well as
	future claims and causes of action), in the Work (i) in all territories
	worldwide, (ii) for the maximum duration provided by applicable law or
	treaty (including future time extensions), (iii) in any current or future
	medium and for any number of copies, and (iv) for any purpose whatsoever,
	including without limitation commercial, advertising or promotional
	purposes (the "Waiver"). Affirmer makes the Waiver for the benefit of each
	member of the public at large and to the detriment of Affirmer's heirs and
	successors, fully intending that such Waiver shall not be subject to
	revocation, rescission, cancellation, termination, or any other legal or
	equitable action to disrupt the quiet enjoyment of the Work by the public
	as contemplated by Affirmer's express Statement of Purpose.
	
	3. Public License Fallback. Should any part of the Waiver for any reason
	be judged legally invalid or ineffective under applicable law, then the
	Waiver shall be preserved to the maximum extent permitted taking into
	account Affirmer's express Statement of Purpose. In addition, to the
	extent the Waiver is so judged Affirmer hereby grants to each affected
	person a royalty-free, non transferable, non sublicensable, non exclusive,
	irrevocable and unconditional license to exercise Affirmer's Copyright and
	Related Rights in the Work (i) in all territories worldwide, (ii) for the
	maximum duration provided by applicable law or treaty (including future
	time extensions), (iii) in any current or future medium and for any number
	of copies, and (iv) for any purpose whatsoever, including without
	limitation commercial, advertising or promotional purposes (the
	"License"). The License shall be deemed effective as of the date CC0 was
	applied by Affirmer to the Work. Should any part of the License for any
	reason be judged legally invalid or ineffective under applicable law, such
	partial invalidity or ineffectiveness shall not invalidate the remainder
	of the License, and in such case Affirmer hereby affirms that he or she
	will not (i) exercise any of his or her remaining Copyright and Related
	Rights in the Work or (ii) assert any associated claims and causes of
	action with respect to the Work, in either case contrary to Affirmer's
	express Statement of Purpose.
	
	4. Limitations and Disclaimers.
	
	 a. No trademark or patent rights held by Affirmer are waived, abandoned,
		surrendered, licensed or otherwise affected by this document.
	 b. Affirmer offers the Work as-is and makes no representations or
		warranties of any kind concerning the Work, express, implied,
		statutory or otherwise, including without limitation warranties of
		title, merchantability, fitness for a particular purpose, non
		infringement, or the absence of latent or other defects, accuracy, or
		the present or absence of errors, whether or not discoverable, all to
		the greatest extent permissible under applicable law.
	 c. Affirmer disclaims responsibility for clearing rights of other persons
		that may apply to the Work or any use thereof, including without
		limitation any person's Copyright and Related Rights in the Work.
		Further, Affirmer disclaims responsibility for obtaining any necessary
		consents, permissions or other rights required for any use of the
		Work.
	 d. Affirmer understands and acknowledges that Creative Commons is not a
		party to this document and has no duty or obligation with respect to
		this CC0 or use of the Work.

[================================================================================]]=], Version))

-- Exunys <3
