local player = game:GetService("Players").LocalPlayer
local screen = Instance.new("ScreenGui")
screen.Parent = player:WaitForChild("PlayerGui")
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 220, 0, 130)
main.Position = UDim2.new(0.5, -110, 0, 20)
main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
main.BorderSizePixel = 0
main.Parent = screen
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = main
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
title.BorderSizePixel = 0
title.Text = "Auto Farm"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.Parent = main
local titlecorner = Instance.new("UICorner")
titlecorner.CornerRadius = UDim.new(0, 8)
titlecorner.Parent = title
local harvestlabel = Instance.new("TextLabel")
harvestlabel.Size = UDim2.new(0, 100, 0, 30)
harvestlabel.Position = UDim2.new(0, 10, 0, 45)
harvestlabel.BackgroundTransparency = 1
harvestlabel.Text = "Harvest"
harvestlabel.TextColor3 = Color3.fromRGB(255, 255, 255)
harvestlabel.Font = Enum.Font.SourceSans
harvestlabel.TextSize = 15
harvestlabel.TextXAlignment = Enum.TextXAlignment.Left
harvestlabel.Parent = main
local harvestback = Instance.new("Frame")
harvestback.Name = "HarvestBack"
harvestback.Size = UDim2.new(0, 50, 0, 24)
harvestback.Position = UDim2.new(1, -60, 0, 48)
harvestback.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
harvestback.BorderSizePixel = 0
harvestback.Parent = main
local harvestbackcorner = Instance.new("UICorner")
harvestbackcorner.CornerRadius = UDim.new(1, 0)
harvestbackcorner.Parent = harvestback
local harvestknob = Instance.new("Frame")
harvestknob.Name = "Knob"
harvestknob.Size = UDim2.new(0, 20, 0, 20)
harvestknob.Position = UDim2.new(0, 2, 0.5, -10)
harvestknob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
harvestknob.BorderSizePixel = 0
harvestknob.Parent = harvestback
local harvestknobcorner = Instance.new("UICorner")
harvestknobcorner.CornerRadius = UDim.new(1, 0)
harvestknobcorner.Parent = harvestknob
local harvestbtn = Instance.new("TextButton")
harvestbtn.Name = "Button"
harvestbtn.Size = UDim2.new(1, 0, 1, 0)
harvestbtn.BackgroundTransparency = 1
harvestbtn.Text = ""
harvestbtn.Parent = harvestback
local selllabel = Instance.new("TextLabel")
selllabel.Size = UDim2.new(0, 100, 0, 30)
selllabel.Position = UDim2.new(0, 10, 0, 85)
selllabel.BackgroundTransparency = 1
selllabel.Text = "Auto Sell"
selllabel.TextColor3 = Color3.fromRGB(255, 255, 255)
selllabel.Font = Enum.Font.SourceSans
selllabel.TextSize = 15
selllabel.TextXAlignment = Enum.TextXAlignment.Left
selllabel.Parent = main
local sellback = Instance.new("Frame")
sellback.Name = "SellBack"
sellback.Size = UDim2.new(0, 50, 0, 24)
sellback.Position = UDim2.new(1, -60, 0, 88)
sellback.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
sellback.BorderSizePixel = 0
sellback.Parent = main
local sellbackcorner = Instance.new("UICorner")
sellbackcorner.CornerRadius = UDim.new(1, 0)
sellbackcorner.Parent = sellback
local sellknob = Instance.new("Frame")
sellknob.Name = "Knob"
sellknob.Size = UDim2.new(0, 20, 0, 20)
sellknob.Position = UDim2.new(0, 2, 0.5, -10)
sellknob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sellknob.BorderSizePixel = 0
sellknob.Parent = sellback
local sellknobcorner = Instance.new("UICorner")
sellknobcorner.CornerRadius = UDim.new(1, 0)
sellknobcorner.Parent = sellknob
local sellbtn = Instance.new("TextButton")
sellbtn.Name = "Button"
sellbtn.Size = UDim2.new(1, 0, 1, 0)
sellbtn.BackgroundTransparency = 1
sellbtn.Text = ""
sellbtn.Parent = sellback

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)