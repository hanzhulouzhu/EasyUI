
EasyTest  =  CreateAddon("EasyTest")

function GetLuaFrameInfo()
	local tLayer =
	{
		"Lowest",
		"Lowest1",
		"Lowest2",
		"Normal",
		"Normal1",
		"Normal2",
		"Topmost",
		"Topmost1",
		"Topmost2",
	}

	local nTotal = 0;
	local nAddonCount = 0
	local fnCount = function(frame)
		local hBorther = frame
		while hBorther do
			if hBorther:IsAddOn() then
				nAddonCount = nAddonCount + 1
				--Trace("addon", hBorther:GetName(), hBorther:GetType(), nAddonCount)
			end
			nTotal = nTotal + 1
			hBorther = hBorther:GetNext()
		end
	end

	for _, v in pairs(tLayer) do
		local hRoot = Station.Lookup(v)
		local frame = hRoot:GetFirstChild()
		if frame then
			fnCount(frame)
		end
	end

	local szTip = string.format("addonWindow(%d) TotalWindow(%d)", nAddonCount, nTotal)
	szTip = szTip .. "\nlua mem:"..collectgarbage("count")
	return szTip
end

function EasyTest.Case()
	--����һ�����
	local frame = EasyTest:Append("Frame", "TestFrame1",{title = "�ؼ�����",style = "NORMAL"})

	--����TAB����
	local tab = EasyTest:Append("Image", frame,"image1",{w = 770,h = 33,x =0,y = 50})
    tab:SetImage("ui\\Image\\UICommon\\ActivePopularize2.UITex",46)
	tab:SetImageType(11)

	--������ǩҳ
	local pageset = EasyTest:Append("PageSet", frame, "pageset",{x = 0,y = 50,w = 768,h = 400})

	--����������ť
	local tbtn1 = EasyTest:Append("UICheckBox", frame,"tbtn1",{x = 50,y = 0,w = 83,h = 30,text = "��ǩ1",group = "test",check = true})
	local tbtn2 = EasyTest:Append("UICheckBox", frame,"tbtn2",{x = 133,y = 0,w = 83,h = 30,text = "��ǩ2",group = "test"})

	--�����鴰��
	local window1 = EasyTest:Append("Window", pageset,"window1",{x = 0,y = 50,w = 768,h = 400})
	local window2 = EasyTest:Append("Window", pageset,"window2",{x = 0,y = 50,w = 768,h = 400})

	--����������ǩҳ�����������Ȼ�ȡ�䱾�� GetSelf()
	pageset:AddPage(window1:GetSelf(), tbtn1:GetSelf())
	pageset:AddPage(window2:GetSelf(), tbtn2:GetSelf())

	--�󶨵�����ť����¼����л���ǩ����0Ϊ��ʼ�±�
	tbtn1.OnCheck = function(arg0)
		if arg0 then
			pageset:ActivePage(0)
		end
	end
	tbtn2.OnCheck = function(arg0)
		if arg0 then
			pageset:ActivePage(1)
		end
	end

	--����һ����ť
	local button1 = EasyTest:Append("Button", window1,"button1",{text = "�ر�",x = 50,y = 0,w = 91,h = 26})
	--�󶨰�ť����¼�
	button1.OnClick = function()
		EasyTest:Remove("TestFrame1")
	end

	--����һ����ť
	local button2 = EasyTest:Append("Button", window1,"button2",{text = "��",x = 150,y = 0,w = 91,h = 26})
	button2.OnClick = function()
		Output(GetLuaFrameInfo())
		--frame:SetAlpha(30)
		--EasyTestAddon.Open()
	end

	--����һ���༭��
	local edit = EasyTest:Append("Edit", window1,"edit",{text = "�༭�����",x = 50,y = 50})
	--�󶨱༭������¼�
	edit.OnChange = function(arg0) Output(arg0) end

	--����һ����ѡ��
	local checkbox1 = EasyTest:Append("CheckBox", window1,"checkbox1",{text = "��ѡ��1",x = 50,y = 100,check = true})
	--�󶨸�ѡ��ѡ���¼�
	checkbox1.OnCheck = function(arg0) Output(arg0) end

	local checkbox2 = EasyTest:Append("CheckBox", window1,"checkbox2",{text = "��ѡ��2",x = 150,y = 100,check = true, enable=false})
	--�󶨸�ѡ��ѡ���¼�
	checkbox2.OnCheck = function(arg0) Output(arg0) end

	--����һ��������
	local combobox1 = EasyTest:Append("ComboBox", window1,"combobox1",{text = "���������",x = 50,y = 150})
	--�����������¼�
	combobox1.OnClick = function(m)
		--local m = {}
		table.insert(m,{szOption = "���Բ˵�1"})
		table.insert(m,{szOption = "���Բ˵�2"})
		PopupMenu(m)
	end

	--����������ѡ�򣬲���ѡ���¼�
	local radiobox1 = EasyTest:Append("RadioBox", window1,"radiobox1",{text = "��ѡ��1",x = 50,y = 200,check = true,group = "test1"})
	radiobox1.OnCheck = function(arg0)
		Output(arg0)
	end
	local radiobox2 = EasyTest:Append("RadioBox", window1,"radiobox2",{text = "��ѡ��2",x = 150,y = 200,group = "test1"})
	radiobox2.OnCheck = function(arg0)
		Output(arg0)
	end
	local radiobox3 = EasyTest:Append("RadioBox", window1,"radiobox3",{text = "��ѡ��3",x = 250,y = 200,group = "test1"})
	radiobox3.OnCheck = function(arg0)
		Output(arg0)
	end

	--����һ������
	local cslider1 = EasyTest:Append("CSlider", window1,"cslider1",{x = 50,y = 250,w = 200,min = 0,max = 100,step = 100,value = 20,unit = "%"})
	--�󶨻��黬���¼�
	cslider1.OnChange = function(arg0)
		Output(arg0)
	end

	--����һ����ɫѡ����
	local colorbox1 = EasyTest:Append("ColorBox", window1,"colorbox1",{text = "��ɫѡ��������",x = 50,y = 300,w = 100,r = 255,g = 128,b = 255})
	--����ɫѡ��������¼�
	colorbox1.OnChange = function(arg0)
		Output(arg0)
	end

	local text1 = EasyTest:Append("Text", window1,"text1",{text = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",x = 50,y = 350,w=300,h=30})
	text1:SetFontSpacing(2)
	text1:SetFontColor(255,125,0)

	--����������
--~ 	local scroll1 = EasyTest:CreateScroll(window2,"ScrollTest",{x = 50,y = 0,w = 200,h = 350})
--~ 	for i = 0, 30 do
--~ 		local item = scroll1:AddItem(i)
--~ 		item:SetSize(180, 25)
--~ 		item:SetText("����������Ŀ"..i)
--~ 		item:SetFontColor(255, 128, 255 - i*5)
--~ 		item.OnClick = function()
--~ 			Output("Test")
--~ 		end
--~ 	end
--~ 	scroll1:OnUpdateScorllList() --������������ÿ�θ�������Ŀʱ���ô˽ӿ�

	--����ͼ��
	local image1 = EasyTest:Append("Image", frame,"image1",{w = 36,h = 36,x = 5,y = 10})
	image1:SetImage("ui\\Image\\UICommon\\CommonPanel.UITex",13)

	--��������
	local animate1 = EasyTest:Append("Animate", window1,"animate1",{w = 161,h = 161,x = 240,y = 0,image = "ui/Image/Common/SprintGreenPower1.UITex"})

	--����shadow
	local shadow1 = EasyTest:Append("Shadow", window1,"shadow1",{x = 210,y = 290,w = 40,h = 40})
	shadow1:SetColorRGB(0,255,64)

	--����box
	--hBox:OnLClick(function() Output("111") end)
	local box1 = EasyTest:Append("Box", window1,"box1",{x = 300,y = 295,w = 45,h = 45})
	box1:SetObject(UI_OBJECT_SKILL, 9003, 4)
	box1:SetObjectIcon(Table_GetSkillIconID(9003, 4))
	box1.OnEnter = function()
		this:SetObjectMouseOver(1)
		local x, y = box1:GetAbsPos()
		local w, h = box1:GetSize()
		local dwSkilID, dwSkillLevel = box1:GetObjectData()
		OutputSkillTip(dwSkilID, dwSkillLevel, {x, y, w, h, 1}, false)
	end
	box1.OnLeave = function()
		this:SetObjectMouseOver(0)
		HideTip()
	end

	local scroll2 = EasyTest:Append("Scroll", window2,"ScrollTest2",{x = 50,y = 0,w = 200,h = 350})
	for i = 0, 20 do
		local h = EasyTest:Append("Handle", scroll2, "h"..i, {w=180,h=22,postype=8})
		h.OnClick = function()
			Output("Test")
		end
		local img = EasyTest:Append("Image", h, "img"..i,{w=160,h=22,image="ui\\Image\\Common\\TextShadow.UITex",frame=2,lockshowhide=1})
		local txt = EasyTest:Append("Text", h, "txt"..i, {w=180,h=22,text="11111111"})

		h.OnEnter = function() img:Show() end
		h.OnLeave = function() img:Hide() end
	end
	scroll2:OnUpdateScorllList()

	--����TreeLeaf
--~ 	local scroll2 = EasyTest:CreateScroll(window2,"ScrollTest2",{x = 300,y = 0,w = 200,h = 350})
--~ 	for i = 0, 30 do
--~ 		local tree = EasyTest:CreateTreeLeaf(scroll2, "treeleaf"..i, {w = 100,h = 25})
--~ 		tree:SetPosType(10)
--~ 		tree:SetIconImage("ui\\Image\\button\\CommonButton_1.UITex", 12, 8)
--~ 		tree:SetNodeIconSize(20, 20)
--~ 		tree.OnClick = function() Output("111") tree:ExpandOrCollapse() tree:FormatAllItemPos() end
--~ 		--tree:AdjustNodeIconPos()
--~ 		EasyTest:CreateText(tree,"treetitle"..i,{text="����"..i,x = 35,w = 60,h = 25})
--~ 		--[[for j = 0, 5 do
--~ 			local tree2 = EasyTest:CreateTreeLeaf(scroll2, "treeleafa"..i, {w = 60,h = 25})
--~ 			tree2:SetPosType(10)
--~ 			tree2:SetIconImage("ui\\Image\\button\\CommonButton_1.UITex", 12, 8)
--~ 			tree2:SetNodeIconSize(20, 20)
--~ 			EasyTest:CreateText(tree2,"treetitlea"..i,{text="����"..i,x = 35,w = 60,h = 25})
--~ 		end]]
--~ 	end
--~ 	scroll2:OnUpdateScorllList()
end
