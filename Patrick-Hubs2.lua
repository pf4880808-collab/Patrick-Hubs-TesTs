
--========================================================
--                  PATRICK-HUBS
--========================================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local BLACK = Color3.fromRGB(0, 0, 0)
local WHITE = Color3.fromRGB(255, 255, 255)
local WIDTH, HEIGHT = 330, 430

local Old = PlayerGui:FindFirstChild("PatrickHubs")
if Old then
    Old:Destroy()
end

local GUI = Instance.new("ScreenGui")
GUI.Name = "PatrickHubs"
GUI.ResetOnSpawn = false
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.Parent = PlayerGui

local function Corner(obj, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = obj
end

local function Stroke(obj, thickness)
    local s = Instance.new("UIStroke")
    s.Color = WHITE
    s.Thickness = thickness
    s.Parent = obj
    return s
end

local function Label(parent, text, size, position, textSize)
    local obj = Instance.new("TextLabel")
    obj.BackgroundTransparency = 1
    obj.Text = text
    obj.Size = size
    obj.Position = position
    obj.TextColor3 = BLACK
    obj.TextStrokeColor3 = WHITE
    obj.TextStrokeTransparency = 0
    obj.Font = Enum.Font.GothamBold
    obj.TextSize = textSize
    obj.Parent = parent
    return obj
end

local function Button(parent, text, size, position)
    local obj = Instance.new("TextButton")
    obj.Size = size
    obj.Position = position
    obj.BackgroundColor3 = BLACK
    obj.BorderSizePixel = 0
    obj.Text = text
    obj.TextColor3 = BLACK
    obj.TextStrokeColor3 = WHITE
    obj.TextStrokeTransparency = 0
    obj.Font = Enum.Font.GothamBold
    obj.TextSize = 14
    obj.AutoButtonColor = false
    obj.Parent = parent
    Corner(obj, 10)
    Stroke(obj, 1.5)
    return obj
end

local function Tween(obj, duration, properties, style)
    local t = TweenService:Create(
        obj,
        TweenInfo.new(
            duration,
            style or Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        ),
        properties
    )
    t:Play()
    return t
end

--========================================================
-- SLOTS PARA OS CÓDIGOS
--========================================================

local ScriptCodes = {
    ["Small Serve"] = [=[
loadstring(game:HttpGet("https://raw.githubusercontent.com/dertonware/scriptasda/refs/heads/main/scriptlua",true))()
]=],

    ["Anti Hit Wzeu"] = [=[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Wzeus-NTH/Wzeusno1/main/Wzeus/nthzz"))()
]=],

    ["Pulse Hub"] = [=[
loadstring(game:HttpGet("https://raw.githubusercontent.com/PulseZax/Loader/refs/heads/main/.lua"))(
]=],

    ["Ajjans Hub"] = [=[
loadstring(game:HttpGet("https://raw.githubusercontent.com/virtuososvisualedits-prog/Ww/refs/heads/main/final-obfuscated.lua"))()
]=],

    ["Miranda Hub"] = [=[
loadstring(game:HttpGet("https://raw.githubusercontent.com/miirandahub/loader/refs/heads/main/afkk"))()
]=],

    ["Fyy Community"] = [=[
loadstring(game:HttpGet("https://FyyCommunity.my.id"))()
]=],

    ["Chilli Hub"] = [=[
loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/Chilli-Hub-Script/refs/heads/main/StealAnEgg"))()
]=],

    ["Night Hub"] = [=[
loadstring(game:HttpGet("https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/StealEggOnly.luau"))()
]=],
}

--========================================================
-- SCRIPTS E CATEGORIAS
--========================================================

local Options = {
    {name = "Small Serve", category = "key", label = "Key"},
    {name = "Anti Hit Wzeu", category = "no", label = "No Key"},
    {name = "Pulse Hub", category = "no", label = "No Key"},
    {name = "Ajjans Hub", category = "key", label = "Key System"},
    {name = "Miranda Hub", category = "no", label = "No Key"},
    {name = "Fyy Community", category = "key", label = "Key System"},
    {name = "Chilli Hub", category = "no", label = "No Key"},
    {name = "Night Hub", category = "no", label = "No Key"},
}

--========================================================
-- LOADING
--========================================================

local Loading = Instance.new("Frame")
Loading.Name = "LoadingScreen"
Loading.AnchorPoint = Vector2.new(0.5, 0.5)
Loading.Position = UDim2.new(0.5, 0, 0.5, 0)
Loading.Size = UDim2.fromOffset(1, 1)
Loading.BackgroundColor3 = BLACK
Loading.BorderSizePixel = 0
Loading.ClipsDescendants = true
Loading.ZIndex = 20
Loading.Parent = GUI
Corner(Loading, 18)
Stroke(Loading, 2)

local LoadingTitle = Label(
    Loading,
    "Patrick-Hubs",
    UDim2.new(1, -20, 0, 40),
    UDim2.new(0, 10, 0.31, 0),
    22
)
LoadingTitle.ZIndex = 21

local LoadingText = Label(
    Loading,
    "Loading Patrick Hub. Please wait...",
    UDim2.new(1, -20, 0, 28),
    UDim2.new(0, 10, 0.49, 0),
    11
)
LoadingText.ZIndex = 21

local BarBack = Instance.new("Frame")
BarBack.Size = UDim2.new(1, -50, 0, 7)
BarBack.Position = UDim2.new(0, 25, 0.65, 0)
BarBack.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
BarBack.BorderSizePixel = 0
BarBack.ZIndex = 21
BarBack.Parent = Loading
Corner(BarBack, 8)

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = WHITE
BarFill.BorderSizePixel = 0
BarFill.ZIndex = 22
BarFill.Parent = BarBack
Corner(BarFill, 8)

--========================================================
-- JANELA
--========================================================

local Main = Instance.new("Frame")
Main.Name = "MainWindow"
Main.Size = UDim2.fromOffset(WIDTH, HEIGHT)
Main.Position = UDim2.new(0.5, -WIDTH / 2, 0.5, -HEIGHT / 2)
Main.BackgroundColor3 = BLACK
Main.BorderSizePixel = 0
Main.Visible = false
Main.Parent = GUI
Corner(Main, 18)
Stroke(Main, 2)

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 54)
Header.BackgroundTransparency = 1
Header.Parent = Main

local Title = Label(
    Header,
    "Patrick-Hubs",
    UDim2.new(1, -105, 1, 0),
    UDim2.fromOffset(14, 0),
    20
)
Title.TextXAlignment = Enum.TextXAlignment.Left

local Minimize = Button(
    Header, "-", UDim2.fromOffset(35, 35),
    UDim2.new(1, -80, 0, 9)
)
Minimize.TextSize = 23

local Close = Button(
    Header, "X", UDim2.fromOffset(35, 35),
    UDim2.new(1, -41, 0, 9)
)

--========================================================
-- ABAS
--========================================================

local TabNoKey = Button(
    Main, "Script No Key",
    UDim2.new(0.5, -16, 0, 36),
    UDim2.fromOffset(10, 56)
)
TabNoKey.TextSize = 12

local TabKey = Button(
    Main, "Script Key System",
    UDim2.new(0.5, -16, 0, 36),
    UDim2.new(0.5, 6, 0, 56)
)
TabKey.TextSize = 12

--========================================================
-- LISTA
--========================================================

local Scroll = Instance.new("ScrollingFrame")
Scroll.Name = "ScriptList"
Scroll.Size = UDim2.new(1, -20, 1, -130)
Scroll.Position = UDim2.fromOffset(10, 100)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
Scroll.ScrollBarImageColor3 = WHITE
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 9)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Scroll

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 3)
Padding.PaddingBottom = UDim.new(0, 6)
Padding.Parent = Scroll

local Notice = Label(
    Main,
    "",
    UDim2.new(1, -20, 0, 20),
    UDim2.new(0, 10, 1, -25),
    10
)
Notice.Visible = false

local activeCategory = "no"
local scriptButtons = {}

local function ShowCategory(category)
    activeCategory = category

    Tween(TabNoKey, 0.12, {
        BackgroundColor3 = category == "no"
            and Color3.fromRGB(38, 38, 38) or BLACK
    })

    Tween(TabKey, 0.12, {
        BackgroundColor3 = category == "key"
            and Color3.fromRGB(38, 38, 38) or BLACK
    })

    for _, item in ipairs(scriptButtons) do
        item.button.Visible = item.data.category == category
    end

    Scroll.CanvasPosition = Vector2.new(0, 0)
    Notice.Visible = false
end

TabNoKey.Activated:Connect(function()
    ShowCategory("no")
end)

TabKey.Activated:Connect(function()
    ShowCategory("key")
end)

--========================================================
-- CARTÕES
--========================================================

for index, data in ipairs(Options) do
    local Card = Instance.new("TextButton")
    Card.Name = data.name:gsub("%s+", "")
    Card.Size = UDim2.new(1, -8, 0, 65)
    Card.BackgroundColor3 = BLACK
    Card.BorderSizePixel = 0
    Card.Text = ""
    Card.AutoButtonColor = false
    Card.LayoutOrder = index
    Card.Visible = false
    Card.Parent = Scroll
    Corner(Card, 12)

    local Outline = Stroke(Card, 1.5)

    local Name = Label(
        Card,
        data.name,
        UDim2.new(1, -18, 0, 29),
        UDim2.fromOffset(10, 4),
        16
    )
    Name.TextXAlignment = Enum.TextXAlignment.Left

    local Description = Label(
        Card,
        data.label,
        UDim2.new(1, -18, 0, 20),
        UDim2.fromOffset(10, 35),
        11
    )
    Description.TextXAlignment = Enum.TextXAlignment.Left

    Card.Activated:Connect(function()
        Tween(Card, 0.08, {
            BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        })
        Tween(Outline, 0.08, {Thickness = 3})

        task.delay(0.12, function()
            if Card.Parent then
                Tween(Card, 0.12, {
                    BackgroundColor3 = BLACK
                })
                Tween(Outline, 0.12, {
                    Thickness = 1.5
                })

                -- Corrige o desaparecimento do cartão.
                Card.Visible = data.category == activeCategory
            end
        end)

        local code = ScriptCodes[data.name] or ""

        if code:match("%S") and not code:find("COLE AQUI", 1, true) then
            Notice.Text = data.name .. ": código preenchido"
        else
            Notice.Text = data.name .. ": cole o código no campo correspondente"
        end

        Notice.Visible = true
    end)

    table.insert(scriptButtons, {
        button = Card,
        data = data
    })
end

--========================================================
-- ARRASTAR
--========================================================

local function MakeDraggable(object, handle)
    local dragging = false
    local dragInput
    local dragStart
    local startPosition

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPosition = object.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            object.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
        end
    end)
end

MakeDraggable(Main, Header)

--========================================================
-- BOLHA PH
--========================================================

local Bubble = Instance.new("TextButton")
Bubble.Name = "PHBubble"
Bubble.Size = UDim2.fromOffset(58, 58)
Bubble.Position = UDim2.new(0.5, -29, 0.5, -29)
Bubble.BackgroundColor3 = BLACK
Bubble.BackgroundTransparency = 0.3
Bubble.BorderSizePixel = 0
Bubble.Text = "PH"
Bubble.TextColor3 = BLACK
Bubble.TextStrokeColor3 = WHITE
Bubble.TextStrokeTransparency = 0
Bubble.Font = Enum.Font.GothamBold
Bubble.TextSize = 19
Bubble.Visible = false
Bubble.AutoButtonColor = false
Bubble.Parent = GUI
Corner(Bubble, 999)
Stroke(Bubble, 2)

MakeDraggable(Bubble, Bubble)

Minimize.Activated:Connect(function()
    Main.Visible = false
    Bubble.Visible = true
    Bubble.Size = UDim2.fromOffset(1, 1)

    Tween(Bubble, 0.2, {
        Size = UDim2.fromOffset(58, 58)
    }, Enum.EasingStyle.Back)
end)

Bubble.Activated:Connect(function()
    Bubble.Visible = false
    Main.Visible = true
    Main.Size = UDim2.fromOffset(1, 1)

    Tween(Main, 0.22, {
        Size = UDim2.fromOffset(WIDTH, HEIGHT)
    }, Enum.EasingStyle.Back)
end)

Close.Activated:Connect(function()
    Tween(Main, 0.15, {
        Size = UDim2.fromOffset(1, 1)
    })

    task.delay(0.17, function()
        if GUI.Parent then
            GUI:Destroy()
        end
    end)
end)

--========================================================
-- INICIALIZAÇÃO
--========================================================

ShowCategory("no")

task.spawn(function()
    Tween(Loading, 2.7, {
        Size = UDim2.fromOffset(WIDTH, HEIGHT)
    }, Enum.EasingStyle.Back)

    Tween(BarFill, 2.7, {
        Size = UDim2.new(1, 0, 1, 0)
    })

    task.wait(2.8)

    if not GUI.Parent then return end

    Tween(Loading, 0.18, {
        Size = UDim2.fromOffset(1, 1)
    })

    task.wait(0.2)

    Loading:Destroy()
    Main.Visible = true
    Main.Size = UDim2.fromOffset(1, 1)

    Tween(Main, 0.3, {
        Size = UDim2.fromOffset(WIDTH, HEIGHT)
    }, Enum.EasingStyle.Back)
end)

print("Patrick-Hubs carregado!")
