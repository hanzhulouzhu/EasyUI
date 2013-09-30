--
local CreateAddon = EasyUI["CreateAddon"]
local CreateFrame = EasyUI["CreateFrame"]
local CreateWindow = EasyUI["CreateWindow"]
local CreatePageSet = EasyUI["CreatePageSet"]
local CreateButton = EasyUI["CreateButton"]
local CreateEdit = EasyUI["CreateEdit"]
local CreateCheckBox = EasyUI["CreateCheckBox"]
local CreateComboBox = EasyUI["CreateComboBox"]
local CreateRadioBox = EasyUI["CreateRadioBox"]
local CreateCSlider = EasyUI["CreateCSlider"]
local CreateColorBox = EasyUI["CreateColorBox"]
local CreateScroll = EasyUI["CreateScroll"]
local CreateUICheckBox = EasyUI["CreateUICheckBox"]
local CreateHandle = EasyUI["CreateHandle"]
local CreateText = EasyUI["CreateText"]
local CreateImage = EasyUI["CreateImage"]
local CreateAnimate = EasyUI["CreateAnimate"]
local CreateShadow = EasyUI["CreateShadow"]
local CreateBox = EasyUI["CreateBox"]
--EasyUI.Fetch
EasyManager = CreateAddon("EasyManager")

local tAddonClass = {"���й���", "ս����ǿ", "������ǿ", "����Ŷ�", "��������"}


EasyManager.OnCreate = function()
	this:RegisterEvent("UI_SCALED")
	EasyManager.UpdateAnchor(this)
end

EasyManager.UpdateAnchor = function(frame)
	frame:SetPoint("CENTER", 0, 0, "CENTER", 0, 0)
end

EasyManager.OnEvent = function(event)
	if event == "UI_SCALED" then
		EasyManager.UpdateAnchor(this)
	end
end

EasyManager.Init = function()
	local frame = CreateFrame("EasyManager", {title = "�������", style = "NORMAL"})

	-- Tab BgImage
	local imgTab = CreateImage(frame,"EasyManagerTabImg",{w = 770,h = 33,x =0,y = 50})
    imgTab:SetImage("ui\\Image\\UICommon\\ActivePopularize2.UITex",46)
	imgTab:SetImageType(11)

	-- PageSet
	local hPageSet = CreatePageSet(frame, "EasyManagerPageSet",{x = 0,y = 50,w = 768,h = 400})
	for i = 1, 5 do
		local hBtn = CreateUICheckBox(hPageSet, "EasyManagerTabClass", {x = 50 + 83 * ( i- 1), y = 0, w = 83, h = 30, text = tAddonClass[i], group = "AddonClass"})
		local hWin = CreateWindow(hPageSet, "EasyManagerWindow"..i, {x = 0, y = 50, w = 768,h = 400})
		hPageSet:AddPage(hWin:GetSelf(), hBtn:GetSelf())
		hBtn.OnCheck = function(bCheck)
			if bCheck then
				hPageSet:ActivePage(i-1)
			end
		end
		if i == 1 then
			hBtn:Check(true)
		end
		local hBtnTest = CreateButton(hWin,"button"..i,{text = "����"..i,x = 50 + 83 * (i - 1), y = 0,w = 83,h = 26})
		hBtnTest.OnClick = function()
			Output("���Ա�ǩ"..i)
		end
	end

	return frame
end

EasyManager.OpenPanel = function()
	local frame = EasyUI.Fetch("EasyManager")
	if frame and frame:IsVisible() then
		frame:Destroy()
	else
		frame = EasyManager.Init()
	end
end

local tMenu = {
	{
		szOption = "�������",
		fnAction = function()
			EasyManager.OpenPanel()
		end,
	}
}
TraceButton_AppendAddonMenu(tMenu)
