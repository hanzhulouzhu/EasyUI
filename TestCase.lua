
EasyTest  =  EasyTest or {}

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
local CreateTreeLeaf = EasyUI["CreateTreeLeaf"]

function EasyTest.Case()
	--����һ�����
	local frame = CreateFrame("TestFrame1",{title = "�ؼ�����",style = "NORMAL"})

	--����TAB����
	local tab = CreateImage(frame,"image1",{w = 770,h = 33,x =0,y = 50})
    tab:SetImage("ui\\Image\\UICommon\\ActivePopularize2.UITex",46)
	tab:SetImageType(11)

	--������ǩҳ
	local pageset = CreatePageSet(frame, "pageset",{x = 0,y = 50,w = 768,h = 400})

	--����������ť
	local tbtn1 = CreateUICheckBox(frame,"tbtn1",{x = 50,y = 0,w = 83,h = 30,text = "��ǩ1",group = "test",check = true})
	local tbtn2 = CreateUICheckBox(frame,"tbtn2",{x = 133,y = 0,w = 83,h = 30,text = "��ǩ2",group = "test"})

	--�����鴰��
	local window1 = CreateWindow(pageset,"window1",{x = 0,y = 50,w = 768,h = 400})
	local window2 = CreateWindow(pageset,"window2",{x = 0,y = 50,w = 768,h = 400})

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
	local button1 = CreateButton(window1,"button1",{text = "�ر�",x = 50,y = 0,w = 91,h = 26})
	--�󶨰�ť����¼�
	button1.OnClick = function()
		frame:Destroy()
	end
	button1.OnEnter = function() Output("Enter") end
	button1.OnLeave = function() Output("Leave") end

	--����һ����ť
	local button2 = CreateButton(window1,"button2",{text = "��",x = 150,y = 0,w = 91,h = 26})
	button2.OnClick = function()
		EasyTestAddon.Open()
	end

	--����һ���༭��
	local edit = CreateEdit(window1,"edit",{text = "�༭�����",x = 50,y = 50})
	--�󶨱༭������¼�
	edit.OnChange = function(arg0) Output(arg0) end

	--����һ����ѡ��
	local checkbox1 = CreateCheckBox(window1,"checkbox1",{text = "��ѡ��1",x = 50,y = 100,check = true})
	--�󶨸�ѡ��ѡ���¼�
	checkbox1.OnCheck = function(arg0) Output(arg0) end

	local checkbox2 = CreateCheckBox(window1,"checkbox2",{text = "��ѡ��2",x = 150,y = 100,check = true})
	--�󶨸�ѡ��ѡ���¼�
	checkbox2.OnCheck = function(arg0) Output(arg0) end

	--����һ��������
	local combobox1 = CreateComboBox(window1,"combobox1",{text = "���������",x = 50,y = 150})
	--�����������¼�
	combobox1.OnClick = function(m)
		--local m = {}
		table.insert(m,{szOption = "���Բ˵�1"})
		table.insert(m,{szOption = "���Բ˵�2"})
		PopupMenu(m)
	end

	--����������ѡ�򣬲���ѡ���¼�
	local radiobox1 = CreateRadioBox(window1,"radiobox1",{text = "��ѡ��1",x = 50,y = 200,check = true,group = "test1"})
	radiobox1.OnCheck = function(arg0)
		Output(arg0)
	end
	local radiobox2 = CreateRadioBox(window1,"radiobox2",{text = "��ѡ��2",x = 150,y = 200,group = "test1"})
	radiobox2.OnCheck = function(arg0)
		Output(arg0)
	end
	local radiobox3 = CreateRadioBox(window1,"radiobox3",{text = "��ѡ��3",x = 250,y = 200,group = "test1"})
	radiobox3.OnCheck = function(arg0)
		Output(arg0)
	end

	--����һ������
	local cslider1 = CreateCSlider(window1,"cslider1",{x = 50,y = 250,w = 200,min = 0,max = 100,step = 100,value = 20,unit = "%"})
	--�󶨻��黬���¼�
	cslider1.OnChange = function(arg0)
		Output(arg0)
	end

	--����һ����ɫѡ����
	local colorbox1 = CreateColorBox(window1,"colorbox1",{text = "��ɫѡ��������",x = 50,y = 300,w = 100,r = 255,g = 128,b = 255})
	--����ɫѡ��������¼�
	colorbox1.OnChange = function(arg0)
		Output(arg0)
	end

	local text1 = CreateText(window1,"text1",{text = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",x = 50,y = 350,w=300,h=30})
	text1:SetFontSpacing(2)
	text1:SetFontColor(255,125,0)

	--����������
--~ 	local scroll1 = CreateScroll(window2,"ScrollTest",{x = 50,y = 0,w = 200,h = 350})
--~ 	scroll1:ClearHandle()
--~ 	--scroll1:SetHandleStyle(6)
--~ 	for i = 0, 30 do
--~ 		--����Handle
--~ 		local handle = CreateHandle(scroll1,"handle"..i,{w = 175,h = 25,eventid=368})
--~ 		handle:SetPosType(10)
--~ 		handle:SetHandleStyle(3)
--~ 		handle.OnClick = function() Output("Click Scroll Item") end
--~ 		handle.OnEnter = function() Output("Enter Scroll Item") end
--~ 		handle.OnLeave = function() Output("Leave Scroll Item") end
--~ 		--��������
--~ 		CreateText(handle,"txt"..i,{text = "����������Ŀ"..i,w = 175,h = 25})
--~ 	end
--~ 	scroll1:OnUpdateScorllList() --������������ÿ�θ�������Ŀʱ���ô˽ӿ�

	--����ͼ��
	local image1 = CreateImage(frame,"image1",{w = 36,h = 36,x = 5,y = 10})
	image1:SetImage("ui\\Image\\UICommon\\CommonPanel.UITex",13)

	--��������
	local animate1 = CreateAnimate(window1,"animate1",{w = 161,h = 161,x = 240,y = 0,image = "ui/Image/Common/SprintGreenPower1.UITex"})

	--����shadow
	local shadow1 = CreateShadow(window1,"shadow1",{x = 210,y = 290,w = 40,h = 40})
	shadow1:SetColorRGB(0,255,64)

	--����box
	local box1 = CreateBox(window1,"box1",{x = 300,y = 285,w = 45,h = 45})
	box1:SetObject(UI_OBJECT_SKILL, 9003, 4)
	box1:SetObjectIcon(Table_GetSkillIconID(9003, 4))
	box1.OnEnter = function()
		this:SetObjectMouseOver(1)
		local x, y = this:GetAbsPos()
		local w, h = this:GetSize()
		local dwSkilID, dwSkillLevel = this:GetObjectData()
		OutputSkillTip(dwSkilID, dwSkillLevel, {x, y, w, h, 1}, false)
	end
	box1.OnLeave = function()
		this:SetObjectMouseOver(0)
		HideTip()
	end

	--����TreeLeaf
--~ 	local scroll2 = CreateScroll(window2,"ScrollTest2",{x = 300,y = 0,w = 200,h = 350})
--~ 	for i = 0, 30 do
--~ 		local tree = CreateTreeLeaf(scroll2, "treeleaf"..i, {w = 100,h = 25})
--~ 		tree:SetPosType(10)
--~ 		tree:SetIconImage("ui\\Image\\button\\CommonButton_1.UITex", 12, 8)
--~ 		tree:SetNodeIconSize(20, 20)
--~ 		tree.OnClick = function() Output("111") tree:ExpandOrCollapse() tree:FormatAllItemPos() end
--~ 		--tree:AdjustNodeIconPos()
--~ 		CreateText(tree,"treetitle"..i,{text="����"..i,x = 35,w = 60,h = 25})
--~ 		--[[for j = 0, 5 do
--~ 			local tree2 = CreateTreeLeaf(scroll2, "treeleafa"..i, {w = 60,h = 25})
--~ 			tree2:SetPosType(10)
--~ 			tree2:SetIconImage("ui\\Image\\button\\CommonButton_1.UITex", 12, 8)
--~ 			tree2:SetNodeIconSize(20, 20)
--~ 			CreateText(tree2,"treetitlea"..i,{text="����"..i,x = 35,w = 60,h = 25})
--~ 		end]]
--~ 	end
--~ 	scroll2:OnUpdateScorllList()
end
