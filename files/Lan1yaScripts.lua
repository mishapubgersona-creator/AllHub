local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

if CoreGui:FindFirstChild("RouteAutofarmUI") then
    CoreGui.RouteAutofarmUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RouteAutofarmUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 340, 0, 220)
MainFrame.Position = UDim2.new(0.5, -170, 0.35, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 15, 30)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local Shadow = Instance.new("Frame")
Shadow.Size = UDim2.new(1, 6, 1, 6)
Shadow.Position = UDim2.new(0, -3, 0, -3)
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.5
Shadow.BorderSizePixel = 0
Shadow.Parent = MainFrame

local ShadowCorner = Instance.new("UICorner")
ShadowCorner.CornerRadius = UDim.new(0, 14)
ShadowCorner.Parent = Shadow

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Position = UDim2.new(0, 0, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "Lan1yaScripts"
Title.TextColor3 = Color3.fromRGB(150, 200, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextScaled = false
Title.Parent = MainFrame

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(0.9, 0, 0, 1)
Divider.Position = UDim2.new(0.05, 0, 0, 45)
Divider.BackgroundColor3 = Color3.fromRGB(40, 60, 120)
Divider.BackgroundTransparency = 0.5
Divider.Parent = MainFrame

-- AutoFarm Toggle
local AutoFarmContainer = Instance.new("Frame")
AutoFarmContainer.Size = UDim2.new(1, 0, 0, 50)
AutoFarmContainer.Position = UDim2.new(0, 0, 0, 55)
AutoFarmContainer.BackgroundTransparency = 1
AutoFarmContainer.Parent = MainFrame

local AutoFarmLabel = Instance.new("TextLabel")
AutoFarmLabel.Size = UDim2.new(0, 120, 0, 30)
AutoFarmLabel.Position = UDim2.new(0, 20, 0.5, -15)
AutoFarmLabel.BackgroundTransparency = 1
AutoFarmLabel.Text = "AutoFarm"
AutoFarmLabel.TextColor3 = Color3.fromRGB(200, 220, 255)
AutoFarmLabel.Font = Enum.Font.GothamBold
AutoFarmLabel.TextSize = 18
AutoFarmLabel.TextXAlignment = Enum.TextXAlignment.Left
AutoFarmLabel.Parent = AutoFarmContainer

local ToggleButton = Instance.new("Frame")
ToggleButton.Size = UDim2.new(0, 60, 0, 30)
ToggleButton.Position = UDim2.new(1, -80, 0.5, -15)
ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ToggleButton.BackgroundTransparency = 0.3
ToggleButton.BorderSizePixel = 0
ToggleButton.Parent = AutoFarmContainer

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleButton

local ToggleCircle = Instance.new("Frame")
ToggleCircle.Size = UDim2.new(0, 26, 0, 26)
ToggleCircle.Position = UDim2.new(0, 2, 0.5, -13)
ToggleCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ToggleCircle.BackgroundTransparency = 0
ToggleCircle.BorderSizePixel = 0
ToggleCircle.Parent = ToggleButton

local ToggleCircleCorner = Instance.new("UICorner")
ToggleCircleCorner.CornerRadius = UDim.new(1, 0)
ToggleCircleCorner.Parent = ToggleCircle

local ToggleGlow = Instance.new("Frame")
ToggleGlow.Size = UDim2.new(1, 10, 1, 10)
ToggleGlow.Position = UDim2.new(0.5, -5, 0.5, -5)
ToggleGlow.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ToggleGlow.BackgroundTransparency = 0.8
ToggleGlow.BorderSizePixel = 0
ToggleGlow.Parent = ToggleCircle

local ToggleGlowCorner = Instance.new("UICorner")
ToggleGlowCorner.CornerRadius = UDim.new(1, 0)
ToggleGlowCorner.Parent = ToggleGlow

-- ESP Toggle
local ESPContainer = Instance.new("Frame")
ESPContainer.Size = UDim2.new(1, 0, 0, 50)
ESPContainer.Position = UDim2.new(0, 0, 0, 110)
ESPContainer.BackgroundTransparency = 1
ESPContainer.Parent = MainFrame

local ESPLabel = Instance.new("TextLabel")
ESPLabel.Size = UDim2.new(0, 120, 0, 30)
ESPLabel.Position = UDim2.new(0, 20, 0.5, -15)
ESPLabel.BackgroundTransparency = 1
ESPLabel.Text = "ESP"
ESPLabel.TextColor3 = Color3.fromRGB(200, 220, 255)
ESPLabel.Font = Enum.Font.GothamBold
ESPLabel.TextSize = 18
ESPLabel.TextXAlignment = Enum.TextXAlignment.Left
ESPLabel.Parent = ESPContainer

local ESPToggle = Instance.new("Frame")
ESPToggle.Size = UDim2.new(0, 60, 0, 30)
ESPToggle.Position = UDim2.new(1, -80, 0.5, -15)
ESPToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ESPToggle.BackgroundTransparency = 0.3
ESPToggle.BorderSizePixel = 0
ESPToggle.Parent = ESPContainer

local ESPToggleCorner = Instance.new("UICorner")
ESPToggleCorner.CornerRadius = UDim.new(1, 0)
ESPToggleCorner.Parent = ESPToggle

local ESPToggleCircle = Instance.new("Frame")
ESPToggleCircle.Size = UDim2.new(0, 26, 0, 26)
ESPToggleCircle.Position = UDim2.new(0, 2, 0.5, -13)
ESPToggleCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ESPToggleCircle.BackgroundTransparency = 0
ESPToggleCircle.BorderSizePixel = 0
ESPToggleCircle.Parent = ESPToggle

local ESPToggleCircleCorner = Instance.new("UICorner")
ESPToggleCircleCorner.CornerRadius = UDim.new(1, 0)
ESPToggleCircleCorner.Parent = ESPToggleCircle

local ESPToggleGlow = Instance.new("Frame")
ESPToggleGlow.Size = UDim2.new(1, 10, 1, 10)
ESPToggleGlow.Position = UDim2.new(0.5, -5, 0.5, -5)
ESPToggleGlow.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ESPToggleGlow.BackgroundTransparency = 0.8
ESPToggleGlow.BorderSizePixel = 0
ESPToggleGlow.Parent = ESPToggleCircle

local ESPToggleGlowCorner = Instance.new("UICorner")
ESPToggleGlowCorner.CornerRadius = UDim.new(1, 0)
ESPToggleGlowCorner.Parent = ESPToggleGlow

local Divider2 = Instance.new("Frame")
Divider2.Size = UDim2.new(0.9, 0, 0, 1)
Divider2.Position = UDim2.new(0.05, 0, 0, 165)
Divider2.BackgroundColor3 = Color3.fromRGB(40, 60, 120)
Divider2.BackgroundTransparency = 0.5
Divider2.Parent = MainFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Position = UDim2.new(0, 0, 0, 175)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Статус: Остановлен"
StatusLabel.TextColor3 = Color3.fromRGB(150, 200, 255)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 13
StatusLabel.TextScaled = false
StatusLabel.Parent = MainFrame

-- Переменные
local isFarmRunning = false
local isESPActive = false
local isToggleOn = false
local isUIVisible = true
local speed = 27

-- ESP переменные
local espObjects = {}
local espConnections = {}

-- Функции обновления тумблеров
local function updateFarmToggle()
    if isToggleOn then
        TweenService:Create(ToggleButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 150, 0)}):Play()
        TweenService:Create(ToggleCircle, TweenInfo.new(0.3), {Position = UDim2.new(1, -28, 0.5, -13)}):Play()
        TweenService:Create(ToggleCircle, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 255, 0)}):Play()
        TweenService:Create(ToggleGlow, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 255, 0)}):Play()
        AutoFarmLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        StatusLabel.Text = "Статус: Активен"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    else
        TweenService:Create(ToggleButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
        TweenService:Create(ToggleCircle, TweenInfo.new(0.3), {Position = UDim2.new(0, 2, 0.5, -13)}):Play()
        TweenService:Create(ToggleCircle, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(200, 200, 200)}):Play()
        TweenService:Create(ToggleGlow, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play()
        AutoFarmLabel.TextColor3 = Color3.fromRGB(200, 220, 255)
        StatusLabel.Text = "Статус: Остановлен"
        StatusLabel.TextColor3 = Color3.fromRGB(150, 200, 255)
    end
end

local function updateESPToggle()
    if isESPActive then
        TweenService:Create(ESPToggle, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 150, 0)}):Play()
        TweenService:Create(ESPToggleCircle, TweenInfo.new(0.3), {Position = UDim2.new(1, -28, 0.5, -13)}):Play()
        TweenService:Create(ESPToggleCircle, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 255, 0)}):Play()
        TweenService:Create(ESPToggleGlow, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 255, 0)}):Play()
        ESPLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    else
        TweenService:Create(ESPToggle, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
        TweenService:Create(ESPToggleCircle, TweenInfo.new(0.3), {Position = UDim2.new(0, 2, 0.5, -13)}):Play()
        TweenService:Create(ESPToggleCircle, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(200, 200, 200)}):Play()
        TweenService:Create(ESPToggleGlow, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play()
        ESPLabel.TextColor3 = Color3.fromRGB(200, 220, 255)
    end
end

-- ========== ESP ИЗ ВАШЕГО КОДА ==========
local function createESP()
    -- Функция создания ESP для игрока
    local function addESP(targetPlayer)
        if targetPlayer == player then return end
        
        local character = targetPlayer.Character
        if not character then return end
        
        local head = character:FindFirstChild("Head")
        if not head then return end
        
        -- Создаем билборд для отображения имени
        local billboard = Instance.new("BillboardGui")
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.Adornee = head
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.Parent = head
        
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = targetPlayer.Name
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.GothamBold
        textLabel.Parent = billboard
        
        -- Создаем рамку вокруг игрока
        local box = Instance.new("BoxHandleAdornment")
        box.Size = Vector3.new(4, 6, 2)
        box.Color3 = Color3.fromRGB(0, 255, 0)
        box.Transparency = 0.5
        box.AlwaysOnTop = true
        box.Adornee = character
        box.ZIndex = 10
        box.Parent = character
        
        espObjects[targetPlayer] = {billboard, box}
    end
    
    -- Функция удаления ESP для игрока
    local function removeESP(targetPlayer)
        if espObjects[targetPlayer] then
            for _, obj in pairs(espObjects[targetPlayer]) do
                obj:Destroy()
            end
            espObjects[targetPlayer] = nil
        end
    end
    
    -- Функция включения/выключения ESP
    local function toggleESP()
        isESPActive = not isESPActive
        updateESPToggle()
        
        if isESPActive then
            -- Добавляем ESP для всех игроков
            for _, plr in pairs(Players:GetPlayers()) do
                addESP(plr)
            end
        else
            -- Удаляем все ESP
            for plr in pairs(espObjects) do
                removeESP(plr)
            end
        end
    end
    
    -- Подписываемся на события
    espConnections.PlayerAdded = Players.PlayerAdded:Connect(addESP)
    espConnections.PlayerRemoving = Players.PlayerRemoving:Connect(removeESP)
    
    return toggleESP
end

-- Создаем ESP
local toggleESPFunction = createESP()

-- ========== АВТОФАРМ ==========
local p1 = Vector3.new(6820.65, 17.39, 21.51)
local p2 = Vector3.new(6818.39, 17.19, 149.32)
local p3 = Vector3.new(198.06, 17.19, 149.16)
local p4 = Vector3.new(29.4, 17.19, 367.16)
local p5 = Vector3.new(-82.38, 49.22, 431.76)
local p6 = Vector3.new(6805.63, 17.41, -34.47)
local p7 = Vector3.new(6844.71, 17.39, -49.4) 
local p8 = Vector3.new(6839.92, 17.19, 22.33) 
local p4_1 = Vector3.new(-7.52, 27.80, 388.48) 
local p4_2 = Vector3.new(-45.08, 38.41, 410.16)

local route1 = {p1, p2, p3, p4, p4_1, p4_2, p5}
local route2 = {p5, p4, p3, p2, p1, p8, p7, p6}
local route3 = {p6, p7, p8, p1}

local currentRoute = route1
local currentPointIndex = 1
local currentRouteNumber = 1 
local movementAllowed = true
local isFirstStart = true
local isResetting = false

local DEVIATION_THRESHOLD = 20
local MAX_STUCK_TIME = 60
local MAX_NO_PROGRESS_TIME = 180
local deviationStartTime = 0
local lastProgressTime = 0

local beamAtt0 = Instance.new("Attachment")
beamAtt0.Parent = workspace.Terrain
local beamAtt1 = Instance.new("Attachment")
beamAtt1.Parent = workspace.Terrain
local routeBeam = Instance.new("Beam")
routeBeam.Attachment0 = beamAtt0
routeBeam.Attachment1 = beamAtt1
routeBeam.Width0 = 1
routeBeam.Width1 = 1
routeBeam.Color = ColorSequence.new(Color3.fromRGB(0, 100, 255))
routeBeam.FaceCamera = true
routeBeam.Parent = workspace.Terrain
routeBeam.Enabled = false

getgenv().NoclipParts = getgenv().NoclipParts or {}

if getgenv().routeConnection then getgenv().routeConnection:Disconnect() end
if getgenv().noclippingConnection then getgenv().noclippingConnection:Disconnect() end

local function enableAntiAfk()
    if getconnections then
        for _, connection in pairs(getconnections(player.Idled)) do
            if connection["Disable"] then
                connection["Disable"](connection)
            elseif connection["Disconnect"] then
                connection["Disconnect"](connection)
            end
        end
    else
        local VirtualUser = game:GetService("VirtualUser")
        player.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end

local function safeFire(prompt)
    if prompt and prompt:IsA("ProximityPrompt") and fireproximityprompt then
        fireproximityprompt(prompt)
    end
end

local function smoothMoveTo(rootPart, targetPos)
    if not rootPart then return end
    local distance = (targetPos - rootPart.Position).Magnitude
    while distance > 0.1 do
        if not isFarmRunning or isResetting then return end
        local delta = RunService.Heartbeat:Wait()
        local moveDist = math.min(speed * delta * 10, distance)
        rootPart.CFrame = rootPart.CFrame + (targetPos - rootPart.Position).Unit * moveDist
        distance = (targetPos - rootPart.Position).Magnitude
    end
end

local function getClosestPointOnSegment(point, segStart, segEnd)
    local segmentVec = segEnd - segStart
    local pointVec = point - segStart
    local segLengthSquared = segmentVec.Magnitude^2
    if segLengthSquared == 0 then return segStart end
    local t = math.clamp(pointVec:Dot(segmentVec) / segLengthSquared, 0, 1)
    return segStart + segmentVec * t
end

local function stopFarm()
    isFarmRunning = false
    isToggleOn = false
    movementAllowed = false
    isResetting = false
    deviationStartTime = 0
    lastProgressTime = 0
    routeBeam.Enabled = false
    updateFarmToggle()
    
    if getgenv().routeConnection then getgenv().routeConnection:Disconnect() end
    if getgenv().noclippingConnection then getgenv().noclippingConnection:Disconnect() end
    
    task.wait(0.1)
    for child, _ in pairs(getgenv().NoclipParts) do
        if typeof(child) == "Instance" and child:IsA("BasePart") and child.Parent then
            child.CanCollide = true
        end
    end
    getgenv().NoclipParts = {}
end

local function resetFarm()
    if isResetting then return end
    isResetting = true
    movementAllowed = false
    deviationStartTime = 0
    lastProgressTime = os.clock()
    
    local character = player.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        smoothMoveTo(rootPart, p1)
    end
    
    currentRoute = route1
    currentRouteNumber = 1
    currentPointIndex = 1
    isFirstStart = false 
    isResetting = false
    movementAllowed = true
end

local function startFarm()
    isFarmRunning = true
    isToggleOn = true
    movementAllowed = false
    isFirstStart = true 
    currentRoute = route1
    currentPointIndex = 1
    currentRouteNumber = 1
    routeBeam.Enabled = true
    lastProgressTime = os.clock()
    updateFarmToggle()
    enableAntiAfk()
    
    getgenv().noclippingConnection = RunService.Stepped:Connect(function()
        if isFarmRunning and player.Character then
            for _, child in pairs(player.Character:GetDescendants()) do
                if child:IsA("BasePart") and child.CanCollide == true then
                    child.CanCollide = false
                    getgenv().NoclipParts[child] = true
                end
            end
        end
    end)

    task.spawn(function()
        while isFarmRunning do
            if isResetting then
                task.wait(0.5)
                continue
            end

            if os.clock() - lastProgressTime > MAX_NO_PROGRESS_TIME then
                task.spawn(resetFarm)
                task.wait(1)
                continue
            end

            local character = player.Character
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")
            
            if rootPart then
                local targetPosition = currentRoute[currentPointIndex]
                local distance = (targetPosition - rootPart.Position).Magnitude
                
                if distance < 4 or (isFirstStart and currentRouteNumber == 1 and currentPointIndex == 1) then
                    lastProgressTime = os.clock()
                    
                    if currentRouteNumber == 1 then
                        if currentPointIndex == 1 then
                            if isFirstStart then
                                isFirstStart = false
                                if distance > 4 then
                                    smoothMoveTo(rootPart, targetPosition)
                                end
                            end
                            
                            movementAllowed = false
                            rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            
                            for i = 1, 5 do
                                if not isFarmRunning then break end
                                local buyPrompt = workspace.WorldBuyableItems["Fake Diamond Ring"].Handle.PromptAttachment.ProximityPrompt
                                safeFire(buyPrompt)
                                task.wait(0.5)
                            end
                            
                            if isFarmRunning then
                                currentPointIndex = 2
                                movementAllowed = true
                            end
                            
                        elseif currentPointIndex == #route1 then
                            movementAllowed = false
                            rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            local finishPoint = currentRoute[currentPointIndex]
                            
                            task.wait(0.75)
                            if isFarmRunning then
                                local sellPrompt = workspace.NPC.Seller2.HumanoidRootPart.SellSmuggledGoodsPrompt
                                local isTriggered = false
                                local conn
                                if sellPrompt then
                                    conn = sellPrompt.Triggered:Connect(function(plr)
                                        if plr == player then isTriggered = true end
                                    end)
                                end
                                
                                safeFire(sellPrompt)
                                task.wait(0.1)
                                
                                if not isTriggered and isFarmRunning then
                                    smoothMoveTo(rootPart, finishPoint)
                                    safeFire(sellPrompt)
                                end
                                if conn then conn:Disconnect() end
                            end
                            
                            task.wait(0.65)
                            if isFarmRunning then
                                currentRoute = route2
                                currentRouteNumber = 2
                                currentPointIndex = 2 
                                movementAllowed = true
                            end
                            
                        elseif currentPointIndex == 5 or currentPointIndex == 6 then
                            movementAllowed = false
                            rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            task.wait(0.5)
                            if isFarmRunning then
                                currentPointIndex = currentPointIndex + 1
                                movementAllowed = true
                            end
                        else
                            currentPointIndex = currentPointIndex + 1
                        end
                        
                    elseif currentRouteNumber == 2 then
                        if currentPointIndex == #route2 then
                            movementAllowed = false
                            rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            local finishPoint = currentRoute[currentPointIndex]
                            
                            task.wait(0.75)
                            if isFarmRunning then
                                local launderPrompt = workspace.LaunderPrompts.LaunderTrigger.PromptPart.LaunderBriefcasePrompt
                                local isTriggered = false
                                local conn
                                if launderPrompt then
                                    conn = launderPrompt.Triggered:Connect(function(plr)
                                        if plr == player then isTriggered = true end
                                    end)
                                end
                                
                                safeFire(launderPrompt)
                                task.wait(0.1)
                                
                                if not isTriggered and isFarmRunning then
                                    smoothMoveTo(rootPart, finishPoint)
                                    safeFire(launderPrompt)
                                end
                                if conn then conn:Disconnect() end
                            end
                            
                            task.wait(0.65)
                            if isFarmRunning then
                                currentRoute = route3
                                currentRouteNumber = 3
                                currentPointIndex = 2 
                                movementAllowed = true
                            end
                        else
                            currentPointIndex = currentPointIndex + 1
                        end
                        
                    elseif currentRouteNumber == 3 then
                        if currentPointIndex == #route3 then
                            currentRoute = route1
                            currentRouteNumber = 1
                            currentPointIndex = 1
                            movementAllowed = true
                        else
                            currentPointIndex = currentPointIndex + 1
                        end
                    end
                end
            end
            task.wait()
        end
    end)

    getgenv().routeConnection = RunService.Heartbeat:Connect(function(delta)
        if not isFarmRunning or isResetting then return end
        
        local character = player.Character
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        local targetPosition = currentRoute[currentPointIndex]
        local startPosition = (currentPointIndex > 1 and currentRoute[currentPointIndex - 1]) or rootPart.Position
        
        beamAtt0.WorldPosition = startPosition
        beamAtt1.WorldPosition = targetPosition
        
        if movementAllowed then
            local closestPoint = getClosestPointOnSegment(rootPart.Position, startPosition, targetPosition)
            local distToLine = (rootPart.Position - closestPoint).Magnitude
            
            if distToLine > DEVIATION_THRESHOLD then
                if deviationStartTime == 0 then
                    deviationStartTime = os.clock()
                end
                
                if os.clock() - deviationStartTime > MAX_STUCK_TIME then
                    task.spawn(resetFarm)
                    return
                end
                
                local direction = (closestPoint - rootPart.Position)
                if direction.Magnitude > 0.1 then
                    character:TranslateBy(direction.Unit * speed * delta * 10)
                end
            else
                deviationStartTime = 0
                local direction = (targetPosition - rootPart.Position)
                character:TranslateBy(direction.Unit * speed * delta * 10)
            end
        end
    end)
end

-- ========== ОБРАБОТКА КЛИКОВ ==========
ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if isFarmRunning then stopFarm() else startFarm() end
    end
end)

ToggleCircle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if isFarmRunning then stopFarm() else startFarm() end
    end
end)

ESPToggle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        toggleESPFunction()
    end
end)

ESPToggleCircle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        toggleESPFunction()
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.LeftAlt then
        isUIVisible = not isUIVisible
        MainFrame.Visible = isUIVisible
    end
end)

print("[Lan1yaScripts] Интерфейс загружен! Нажмите LeftAlt для скрытия/показа")

-- ========== NOCLIP С GUI ==========
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- Переменные
local isNoClipActive = false
local isUIVisible = true
local noclipConnections = {}

-- Создаем GUI
local function createGUI()
    -- Удаляем старый GUI если есть
    if CoreGui:FindFirstChild("NoClipUI") then
        CoreGui.NoClipUI:Destroy()
    end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NoClipUI"
    ScreenGui.Parent = CoreGui
    ScreenGui.ResetOnSpawn = false
    
    -- Главное окно
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 300, 0, 120)
    MainFrame.Position = UDim2.new(0.5, -150, 0.4, -60)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 15, 30)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    -- Тень
    local Shadow = Instance.new("Frame")
    Shadow.Size = UDim2.new(1, 6, 1, 6)
    Shadow.Position = UDim2.new(0, -3, 0, -3)
    Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.BackgroundTransparency = 0.5
    Shadow.BorderSizePixel = 0
    Shadow.Parent = MainFrame
    
    local ShadowCorner = Instance.new("UICorner")
    ShadowCorner.CornerRadius = UDim.new(0, 14)
    ShadowCorner.Parent = Shadow
    
    -- Заголовок
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 35)
    Title.Position = UDim2.new(0, 0, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = "NoClip"
    Title.TextColor3 = Color3.fromRGB(150, 200, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 20
    Title.Parent = MainFrame
    
    -- Разделитель
    local Divider = Instance.new("Frame")
    Divider.Size = UDim2.new(0.9, 0, 0, 1)
    Divider.Position = UDim2.new(0.05, 0, 0, 45)
    Divider.BackgroundColor3 = Color3.fromRGB(40, 60, 120)
    Divider.BackgroundTransparency = 0.5
    Divider.Parent = MainFrame
    
    -- Контейнер для тумблера
    local ToggleContainer = Instance.new("Frame")
    ToggleContainer.Size = UDim2.new(1, 0, 0, 50)
    ToggleContainer.Position = UDim2.new(0, 0, 0, 55)
    ToggleContainer.BackgroundTransparency = 1
    ToggleContainer.Parent = MainFrame
    
    -- Текст NoClip
    local NoClipLabel = Instance.new("TextLabel")
    NoClipLabel.Size = UDim2.new(0, 120, 0, 30)
    NoClipLabel.Position = UDim2.new(0, 20, 0.5, -15)
    NoClipLabel.BackgroundTransparency = 1
    NoClipLabel.Text = "NoClip"
    NoClipLabel.TextColor3 = Color3.fromRGB(200, 220, 255)
    NoClipLabel.Font = Enum.Font.GothamBold
    NoClipLabel.TextSize = 18
    NoClipLabel.TextXAlignment = Enum.TextXAlignment.Left
    NoClipLabel.Parent = ToggleContainer
    
    -- Тумблер
    local ToggleButton = Instance.new("Frame")
    ToggleButton.Size = UDim2.new(0, 60, 0, 30)
    ToggleButton.Position = UDim2.new(1, -80, 0.5, -15)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    ToggleButton.BackgroundTransparency = 0.3
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Parent = ToggleContainer
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = ToggleButton
    
    -- Круглая часть тумблера
    local ToggleCircle = Instance.new("Frame")
    ToggleCircle.Size = UDim2.new(0, 26, 0, 26)
    ToggleCircle.Position = UDim2.new(0, 2, 0.5, -13)
    ToggleCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    ToggleCircle.BackgroundTransparency = 0
    ToggleCircle.BorderSizePixel = 0
    ToggleCircle.Parent = ToggleButton
    
    local ToggleCircleCorner = Instance.new("UICorner")
    ToggleCircleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCircleCorner.Parent = ToggleCircle
    
    -- Свечение
    local ToggleGlow = Instance.new("Frame")
    ToggleGlow.Size = UDim2.new(1, 10, 1, 10)
    ToggleGlow.Position = UDim2.new(0.5, -5, 0.5, -5)
    ToggleGlow.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    ToggleGlow.BackgroundTransparency = 0.8
    ToggleGlow.BorderSizePixel = 0
    ToggleGlow.Parent = ToggleCircle
    
    local ToggleGlowCorner = Instance.new("UICorner")
    ToggleGlowCorner.CornerRadius = UDim.new(1, 0)
    ToggleGlowCorner.Parent = ToggleGlow
    
    -- Статус
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(1, 0, 0, 20)
    StatusLabel.Position = UDim2.new(0, 0, 0, 85)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = "Статус: Выключен"
    StatusLabel.TextColor3 = Color3.fromRGB(150, 200, 255)
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.TextSize = 13
    StatusLabel.Parent = MainFrame
    
    -- Функция обновления тумблера
    local function updateToggle()
        if isNoClipActive then
            TweenService:Create(ToggleButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 150, 0)}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.3), {Position = UDim2.new(1, -28, 0.5, -13)}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 255, 0)}):Play()
            TweenService:Create(ToggleGlow, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 255, 0)}):Play()
            NoClipLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            StatusLabel.Text = "Статус: Включен"
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            TweenService:Create(ToggleButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.3), {Position = UDim2.new(0, 2, 0.5, -13)}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(200, 200, 200)}):Play()
            TweenService:Create(ToggleGlow, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play()
            NoClipLabel.TextColor3 = Color3.fromRGB(200, 220, 255)
            StatusLabel.Text = "Статус: Выключен"
            StatusLabel.TextColor3 = Color3.fromRGB(150, 200, 255)
        end
    end
    
    -- ========== ФУНКЦИЯ NOCLIP ==========
    local function toggleNoClip()
        isNoClipActive = not isNoClipActive
        updateToggle()
        
        if isNoClipActive then
            local function applyNoClip()
                local character = player.Character
                if character then
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end
            
            applyNoClip()
            
            noclipConnections.CharacterAdded = player.CharacterAdded:Connect(function()
                task.wait(0.5)
                applyNoClip()
            end)
            
            noclipConnections.Stepped = RunService.Stepped:Connect(function()
                local character = player.Character
                if character then
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide == true then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            
            print("[NoClip] Включен")
        else
            local character = player.Character
            if character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
            
            if noclipConnections.CharacterAdded then
                noclipConnections.CharacterAdded:Disconnect()
                noclipConnections.CharacterAdded = nil
            end
            if noclipConnections.Stepped then
                noclipConnections.Stepped:Disconnect()
                noclipConnections.Stepped = nil
            end
            
            print("[NoClip] Выключен")
        end
    end
    
    -- ========== ОБРАБОТКА КЛИКОВ ==========
    ToggleButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            toggleNoClip()
        end
    end)
    
    ToggleCircle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            toggleNoClip()
        end
    end)
    
    -- ========== СКРЫТИЕ ПО LEFTALT ==========
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.LeftAlt then
            isUIVisible = not isUIVisible
            MainFrame.Visible = isUIVisible
        end
    end)
    
    print("[NoClip] GUI загружен! Нажмите LeftAlt для скрытия/показа")
end

-- Запускаем
createGUI()