local key = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zxyn0/key/main/ro2j47dhOW209iropws.txt"))()
local material = loadstring(game:HttpGet("https://pastebin.com/raw/AT1Tj9V8"))()
local window = material.Load({
    Title = "AS Fucker V0.1 Login",
    Style = 1,
    Theme = "Dark",
    SizeX = 260,
    SizeY = 150
})

local box = window.new({
    Title="Key System"
})

local k = ""

local txt = box.TextField({
    Text = "Key here",
    Callback = function(val)
        k = val
    end,
})

local btn = box.Button({
    Text = "Login",
    Callback = function()
        if not k then return end
        if key:lower() == k:lower() then
            
        else
            window.Banner({
                Text = "Invalid Key!"
            })
        end
    end,
})
