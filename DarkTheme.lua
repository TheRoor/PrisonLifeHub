
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("PrisonLifeHubV2", "DarkTheme")
local lp = game.Players.LocalPlayer
local cr = lp.Character
local healthreq

----Theme to remember
--1 = Sentinel
--2 = DarkTheme
--3 = Synapse
--4 = Ocean
--5 = Midnight 

_G.Settings = {
Theme = 1
}




if game.PlaceId == 155615604 then



    ----------SAVE
local File = "PrisonHubSettings.txt";

local function Save()
    writefile(File,game:service("HttpService"):JSONEncode(_G.Settings))
    end
       
       local function Load()
        local Http = game:service("HttpService")
        
            _G.SettingS = Http:JSONDecode(readfile(File))
    
       end

       Load()
print(_G.Settings.Theme)
if _G.Settings.Theme == 3 then
print("is3")
print("is3")
end

     ------------------GUNMOD
    local GM = Window:NewTab("GunMod")

       
    local Main = GM:NewSection("Handheld machine gun of doom")
    Main:NewLabel("AK-")
      Main:NewToggle("Ak-47 Handheld machine gun of doom ", "basically makes it a minigun (byapsses dmg anti-cheat)", function(state)

            Save()

        if state then

            if game.Players.LocalPlayer.Backpack["AK-47"] then
            
                local AK = require(game.Players.LocalPlayer.Backpack["AK-47"].GunStates)
                AK["AutoFire"] = true
                AK["FireRate"] = 0.001
                AK["Spread"] = 0
                AK["Range"] = math.huge
                AK["ReloadTime"] = 0.01
        
                elseif  game.Players.LocalPlayer.Character["AK-47"] then
                    
                    local AKWO = require(game.Players.LocalPlayer.Character["AK-47"].GunStates)
                    AKWO["AutoFire"] = true
                    AKWO["FireRate"] = 0.0001
                    AKWO["Spread"] = 0
                    AKWO["Range"] = math.huge
                    AKWO["ReloadTime"] = 0.01
                 end 
         
          else
            
            if workspace[game.Players.LocalPlayer.Name]:FindFirstChild("AK-47") then
                local AKWO = require(workspace[game.Players.LocalPlayer.Name]:FindFirstChild("AK-47").GunStates)
                AKWO["AutoFire"] = true
                AKWO["FireRate"] = 0.1
                AKWO["Spread"] = 14
                AKWO["Damage"] = 11
                AKWO["StoredAmmo"] = 600
                AKWO["CurrentAmmo"] = 30
                AKWO["Range"] = 800
                elseif game.Players.LocalPlayer.Backpack["AK-47"]    then
                    local AK = require(game.Players.LocalPlayer.Backpack["AK-47"].GunStates)
                    AK["AutoFire"] = true
                    AK["FireRate"] = 0.1
                    AK["Spread"] = 14
                    AK["Damage"] = 11
                    AK["StoredAmmo"] = 600
                    AK["CurrentAmmo"] = 30
                    AK["Range"] = 800
            end

        end
    end) -- toggle
    Main:NewLabel("RM-")
    Main:NewToggle("Remington Handheld machine gun of doom ", "basically makes it a minigun (byapsses dmg anti-cheat)", function(state)

            Save()

        if state then
            
           if game.Players.LocalPlayer.Backpack["Remington 870"] then
            
            local AK = require(game.Players.LocalPlayer.Backpack["Remington 870"].GunStates)
            AK["AutoFire"] = true
            AK["FireRate"] = 0.001
            AK["Spread"] = 0
            AK["Range"] = math.huge
            AK["ReloadTime"] = 0.01
           
            elseif  game.Players.LocalPlayer.Character["Remington 870"] then
                
                local AKWO = require(game.Players.LocalPlayer.Character["Remington 870"].GunStates)
                AKWO["AutoFire"] = true
                AKWO["FireRate"] = 0.0001
                AKWO["Spread"] = 0
                AKWO["Damage"] = 15
                AKWO["Range"] = math.huge
                AKWO["ReloadTime"] = 0.01

           end
         
          else
          
         
            if workspace[game.Players.LocalPlayer.Name]["Remington 870"] then
                local AKWO = require(workspace[game.Players.LocalPlayer.Name]["Remington 870"])
                AKWO["AutoFire"] = false
                AKWO["FireRate"] = 0.8
                AKWO["Spread"] = 3
                AKWO["Damage"] = 15
                AKWO["StoredAmmo"] = 600
                AKWO["CurrentAmmo"] = 6
                AKWO["Range"] = 400

                elseif game.Players.LocalPlayer.Backpack["Remington 870"]    then
                    local AK = require(game.Players.LocalPlayer.Backpack["Remington 870"].GunStates)
                    AK["AutoFire"] = false
                    AK["FireRate"] = 0.8
                    AK["Spread"] = 3
                    AK["Damage"] = 15
                    AK["StoredAmmo"] = 600
                    AK["CurrentAmmo"] = 6
                    AK["Range"] = 400
            end

        end
    end) -- toggle

    -------------ITEMS
    local IM = Window:NewTab("Items")
    local MN = IM:NewSection("Get Items")
    
    MN:NewLabel("you can only get weapons in ReplicatedStorage")
    MN:NewButton("Get CKnife", "Uses clone() to get knife", function()
       local clone = game.ReplicatedStorage.Tools["Crude Knife"]:clone()
       clone.Parent = game.Players.LocalPlayer.Backpack
    end)

    MN:NewButton("Get Stick", "Uses clone() to get a stick ig", function()
        local clone = game.ReplicatedStorage.Tools["Sharpened stick"]:clone()
        clone.Parent = game.Players.LocalPlayer.Backpack
     end)

     MN:NewButton("Get Mirror", "Uses clone() to get a mirror????", function()
        local clone = game.ReplicatedStorage.Tools["Extendo mirror"]:clone()
        clone.Parent = game.Players.LocalPlayer.Backpack
     end)
     local AL = IM:NewSection("Get All Items")
     AL:NewButton("Get All", "Uses clone() to get all items", function()
        local clone = game.ReplicatedStorage.Tools["Extendo mirror"]:clone()
        clone.Parent = game.Players.LocalPlayer.Backpack
        local cloneb = game.ReplicatedStorage.Tools["Sharpened stick"]:clone()
        cloneb.Parent = game.Players.LocalPlayer.Backpack
        local clonec = game.ReplicatedStorage.Tools["Crude Knife"]:clone()
        clonec.Parent = game.Players.LocalPlayer.Backpack
     end)

     AL:NewButton("Clear Items [unequip required!]", "deletes items", function()

        for i,v in pairs(lp.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.Name ~= "Remington 870" and v.Name ~= "M9" and v.Name ~= "AK-47" and v.Name ~= "Key card" then
                v:Destroy()
                task.wait(0.1)
            end
        end
     end)

---------------------COMBAT
local CB = Window:NewTab("Combat")
local CL = CB:NewSection("Combat Log")
CL:NewLabel("Combat log TP's u when u low to crim base")


CL:NewSlider("HealthNeeded", "How much health needed before combat logging", 100, 0, function(s) 
    healthreq = s
     Save()
end)

CL:NewLabel(" RE-ENABLE IF USED")




local CL = CL:NewToggle("CombatLog", "Tp's you safely when health matches slider", function(state)
    Save()
    if state then
      
        local Teams = game:GetService("Teams")
        while task.wait() do
            if cr.Humanoid.Health <= healthreq then
                if lp.Team == Teams.Criminals then
                        local loc = CFrame.new(-941.97052, 94.1287613, 2058.86475, 0.0249914099, -9.90610687e-08, -0.999687672, 1.53281086e-08, 1, -9.87088313e-08, 0.999687672, -1.28564484e-08, 0.0249914099)
                        cr.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        cr.HumanoidRootPart.CFrame = loc
                      break
                elseif lp.Team == Teams.Guards then
                    local loc = CFrame.new(833.726746, 101.169716, 2296.53906, -0.990032434, -0.0351344757, 0.136386856, -1.72216208e-09, 0.968383968, 0.249464378, -0.140839651, 0.246977821, -0.958731532)
                    cr.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    cr.HumanoidRootPart.CFrame = loc
                    break
                elseif lp.Team == Teams.Prisoners then
                    local loc = CFrame.new(-941.97052, 94.1287613, 2058.86475, 0.0249914099, -9.90610687e-08, -0.999687672, 1.53281086e-08, 1, -9.87088313e-08, 0.999687672, -1.28564484e-08, 0.0249914099)
                    cr.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    cr.HumanoidRootPart.CFrame = loc
                   break
                end
            end
            task.wait(0.1)
        end
    else
    end
end)

---------------------TP

local AR = CB:NewSection("Anti-Cop")

local Tp =  Window:NewTab("TP's")

local CRM = Tp:NewSection("Criminal")

CRM:NewButton("Criminal Base", "", function()
    local hm = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    local loc = CFrame.new(-941.97052, 94.1287613, 2058.86475, 0.0249914099, -9.90610687e-08, -0.999687672, 1.53281086e-08, 1, -9.87088313e-08, 0.999687672, -1.28564484e-08, 0.0249914099)
  hm:ChangeState(Enum.HumanoidStateType.Jumping)
 game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = loc
end)


CRM:NewButton("Prison", "", function()
    local hm = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    local loc = CFrame.new(450.878265, 103.52356, 2217.83398, 0.0122281685, 0.149986237, -0.988612473, 1.04397069e-08, 0.988686383, 0.149997458, 0.999925256, -0.00183420454, 0.0120898224)
    hm:ChangeState(Enum.HumanoidStateType.Jumping)
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = loc
end)

CRM:NewButton("Guard Guns", "", function()
    local hm = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    local loc = CFrame.new(825.603699, 101.272346, 2258.18726, 0.997823358, 0.000120777666, 0.0659429729, 8.56481464e-09, 0.999998331, -0.00183167367, -0.0659430847, 0.00182768737, 0.997821689)
    hm:ChangeState(Enum.HumanoidStateType.Jumping)
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = loc
end)



local GRD = Tp:NewSection("Guard")

GRD:NewButton("Criminal Base", "", function()
    local hm = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    local loc = CFrame.new(-941.97052, 94.1287613, 2058.86475, 0.0249914099, -9.90610687e-08, -0.999687672, 1.53281086e-08, 1, -9.87088313e-08, 0.999687672, -1.28564484e-08, 0.0249914099)
    hm:ChangeState(Enum.HumanoidStateType.Jumping)
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = loc
end)

GRD:NewButton("Guard Spawn", "", function()
    local hm = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    local loc = CFrame.new(840.280151, 104.085068, 2304.84473, -0.999053419, 0.00171652657, -0.0434665233, -8.80432083e-09, 0.999221146, 0.0394602157, 0.0435004048, 0.0394228622, -0.99827528)
    hm:ChangeState(Enum.HumanoidStateType.Jumping)
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = loc
end)


-------------------FE


local  FE = Window:NewTab("Fe Scripts")
 local All = FE:NewSection("All")
   
 All:NewButton("TheWareAimbot", "Aimbot", function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRoor/TheWareNOTMINE/main/aimbot.lua"))()       
  end)   
  
  All:NewButton("IY", "Inf yield, need to explain?", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() 
     end) 


     All:NewButton("OwlHub LEVEL 7 REQUIRED", " NEED LEVEL 7 OR HIGHER TO EXECUTE", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
         end) 

local TH = Window:NewTab("Themes")
local ThemePick = TH:NewSection("ThemePicker")

ThemePick:NewButton("Synapse", "Changes theme to Synapse", function()
   _G.Settings.Theme = 3
   Save()
end)

ThemePick:NewButton("DarkTheme", "Changes theme to DarkTheme", function()
    _G.Settings.Theme = 2
    Save()
 end)

 ThemePick:NewButton("Sentinel", "Changes theme to Sentinel", function()
    _G.Settings.Theme = 1
    Save()
 end)

 ThemePick:NewButton("Ocean", "Changes theme to Ocean", function()
    _G.Settings.Theme = 4
    Save()
 end)

 ThemePick:NewButton("Midnight", "Changes theme to Midnight", function()
    _G.Settings.Theme = 5
    Save()
 end)

local ThemeLoader = TH:NewSection("Load Themes")

ThemeLoader:NewLabel("Press button below to reload Script/Theme")

ThemeLoader:NewButton("Reload Script for theme", "Reload's the script", function()
 if _G.Settings.Theme == 1 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRoor/PrisonLifeHub/main/Sentinal.lua"))()
elseif _G.Settings.Theme == 2 then
     
elseif _G.Settings.Theme == 3 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRoor/PrisonLifeHub/main/Synapse.lua"))()
 end
      
 end)




else --if no prison Life

local TP = game:GetService("TeleportService")
lp:kick("No prison life")
end -- end of if at top

