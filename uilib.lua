local lib1 = {}
function lib1:Create(name)
	local ScreenGui = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local Container = Instance.new("Frame")
	local Sidebar = Instance.new("ScrollingFrame")
	
	local UIListLayout = Instance.new("UIListLayout")
	local JustThing = Instance.new("Frame")
	local Pages = Instance.new("Folder")
	
	name = name or "Uilib"
	
	
	local remove = Instance.new("ImageButton")
	local close = Instance.new("ImageButton")

	CurrentPage = nil
	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Name = math.random(1, 1204041)
	Main.Name = "Main"
	Main.Parent = ScreenGui
	Main.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.336250901, 0, 0.277571261, 0)
	Main.Size = UDim2.new(0, 449, 0, 28)

	TextLabel.Parent = Main
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0.0222717151, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 136, 0, 28)
	TextLabel.Font = Enum.Font.GothamMedium
	TextLabel.Text = name
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 18.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	Container.Name = "Container"
	Container.Parent = Main
	Container.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(-5.19274618e-05, 0, 0.990839303, 0)
	Container.Size = UDim2.new(0, 449, 0, 294)

	Sidebar.Name = "Sidebar"
	Sidebar.Parent = Container
	Sidebar.Active = true
	Sidebar.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	Sidebar.BorderSizePixel = 0
	Sidebar.Position = UDim2.new(0, 0, 0.0374149643, 0)
	Sidebar.Size = UDim2.new(0, 118, 0, 282)
	Sidebar.ScrollBarThickness = 0

	

	UIListLayout.Parent = Sidebar
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 3)

	JustThing.Name = "JustThing"
	JustThing.Parent = Container
	JustThing.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	JustThing.BorderSizePixel = 0
	JustThing.Size = UDim2.new(0, 118, 0, 11)

	Pages.Name = "Pages"
	Pages.Parent = Container

	
	

	
	
	

	remove.Name = "remove"
	remove.Parent = Main
	remove.BackgroundTransparency = 1.000
	remove.LayoutOrder = 6
	remove.Position = UDim2.new(0.869710445, 0, 0.0357142985, 0)
	remove.Size = UDim2.new(0, 25, 0, 25)
	remove.ZIndex = 2
	remove.Image = "rbxassetid://3926307971"
	remove.ImageRectOffset = Vector2.new(884, 284)
	remove.ImageRectSize = Vector2.new(36, 36)

	close.Name = "close"
	close.Parent = Main
	close.BackgroundTransparency = 1.000
	close.Position = UDim2.new(0.925389767, 0, 0.0357142985, 0)
	close.Size = UDim2.new(0, 25, 0, 25)
	close.ZIndex = 2
	close.Image = "rbxassetid://3926305904"
	close.ImageRectOffset = Vector2.new(284, 4)
	close.ImageRectSize = Vector2.new(24, 24)
	local minimized = false
	remove.MouseButton1Click:Connect(function()
		if minimized == false then
			minimized = true
			Container:TweenSize(UDim2.new(0, 449, 0, 0), 'Out', 'Quint', 0.3)

			for i,v in next, Container:GetChildren() do
				if v:IsA("Frame") then
					v.Visible = false
				end
			end

			for i,v in next, Container:GetChildren() do
				if v:IsA("ScrollingFrame") then
					v.Visible = false
				end
			end

			for i,v in next, Pages:GetChildren() do
				if v:IsA("ScrollingFrame") then
					v.Visible = false
				end
			end

		else
			if minimized == true then
				minimized = false
				Container:TweenSize(UDim2.new(0, 449, 0, 294), 'Out', 'Quint', 0.3)

				for i,v in next, Container:GetChildren() do
					if v:IsA("Frame") then
						v.Visible = true
					end
				end

				for i,v in next, Container:GetChildren() do
					if v:IsA("ScrollingFrame") then
						v.Visible = true
					end
				end
				for i,v in next, Pages:GetChildren() do
					if v:IsA("ScrollingFrame") then
						if v.Name == tostring(CurrentPage) then
							v.Visible = true
						else
							if CurrentPage == nil then

							end
						end

					end
				end


			end
		end
	end)
	
	
	close.MouseButton1Click:Connect(function()
		Main:Destroy()
	end)
	local UIS = game:GetService("UserInputService")
	function dragify(Frame)
		dragToggle = nil
		dragSpeed = 0.15
		dragInput = nil
		dragStart = nil
		dragPos = nil
		function updateInput(input)
			Delta = input.Position - dragStart
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.15), {Position = Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end
	dragify(Main)
	
	
	local Tabs = {}
	function Tabs:Tab(tabname)
		local UiLibPage = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		tabname = tabname or "NoName"
		UiLibPage.Name = tabname
		UiLibPage.Parent = Pages
		UiLibPage.Active = true
		UiLibPage.Visible = false
		UiLibPage.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		UiLibPage.BorderSizePixel = 0
		UiLibPage.Position = UDim2.new(0.262806237, 0, 0.0374150686, 0)
		UiLibPage.Size = UDim2.new(0, 331, 0, 281)
		UiLibPage.ScrollBarThickness = 0
		
		UIListLayout_2.Parent = UiLibPage
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 3)
		local SideBarTabButton = Instance.new("TextButton")
		SideBarTabButton.Parent = Sidebar
		SideBarTabButton.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
		SideBarTabButton.BorderSizePixel = 0
		SideBarTabButton.Position = UDim2.new(0.220536575, 0, -0.00170057197, 0)
		SideBarTabButton.Size = UDim2.new(0, 102, 0, 28)
		SideBarTabButton.Font = Enum.Font.GothamMedium
		SideBarTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		SideBarTabButton.TextSize = 14.000
		SideBarTabButton.Text = tabname
		
		SideBarTabButton.MouseButton1Click:Connect(function()
			for i,v in next, Pages:GetChildren() do -- We get all the pages that we added
				v.Visible = false   -- then we make them invisible 
			end 
			UiLibPage.Visible = true  -- We make current page visible but not others
			CurrentPage = UiLibPage


		end)
		local etc = {}
		function etc:Button(name, callback)
			local UiButton = Instance.new("TextButton")
			name = name or "ButtonWithnoName"
			callback = callback or function() end
			UiButton.Name = name
			UiButton.Parent = UiLibPage
			UiButton.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			UiButton.BorderSizePixel = 0
			UiButton.Position = UDim2.new(0.1978852, 0, 0, 0)
			UiButton.Size = UDim2.new(0, 307, 0, 28)
			UiButton.Font = Enum.Font.GothamBold
			UiButton.Text = name
			UiButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			UiButton.TextSize = 14.000
			UiButton.MouseButton1Click:Connect(callback)
		end
		function etc:Toggle(name, callback)
			
		
			local Toggle = Instance.new("TextLabel")
			local TextButton_2 = Instance.new("TextButton")
			name = name or "Unnamed Toggle"
			callback = callback or function() end
			Toggle.Name = name
			Toggle.Parent = UiLibPage
			Toggle.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			Toggle.BorderSizePixel = 0
			Toggle.Position = UDim2.new(0.1978852, 0, 0.120996438, 0)
			Toggle.Size = UDim2.new(0, 307, 0, 28)
			Toggle.Font = Enum.Font.GothamBold
			Toggle.Text = " "..name
			Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.TextSize = 14.000
			Toggle.TextXAlignment = Enum.TextXAlignment.Left

			TextButton_2.Parent = Toggle
			TextButton_2.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
			TextButton_2.BorderSizePixel = 0
			TextButton_2.Position = UDim2.new(0.890955448, 0, 0.107142806, 0)
			TextButton_2.Size = UDim2.new(0, 24, 0, 21)
			TextButton_2.Font = Enum.Font.SourceSans
			TextButton_2.Text = ""
			TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_2.TextSize = 14.000
			
			local tog = false

			TextButton_2.MouseButton1Click:Connect(function()
				tog = not tog
				callback = callback or function() end   

				callback(tog) 
				if tog then 
					game.TweenService:Create(TextButton_2, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					}):Play()

				else
					game.TweenService:Create(TextButton_2, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(16, 16, 16)
					}):Play()

				end
			end)
		end
		function etc:Label(lablname)
			local LabelFunc = Instance.new("TextLabel")
			lablname = lablname or "NoName"
			
			LabelFunc.Name = lablname
			LabelFunc.Parent = UiLibPage
			LabelFunc.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			LabelFunc.BorderSizePixel = 0
			LabelFunc.Position = UDim2.new(0.0362537764, 0, 0.22064057, 0)
			LabelFunc.Size = UDim2.new(0, 307, 0, 17)
			LabelFunc.Font = Enum.Font.GothamBold
			LabelFunc.Text = " "..lablname
			LabelFunc.TextColor3 = Color3.fromRGB(255, 255, 255)
			LabelFunc.TextSize = 14.000
		end
		
		return etc
	end
	return Tabs
end
return lib1
