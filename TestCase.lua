
EasyUI  =  EasyUI or {}

function EasyUI.TestCase()
	--����һ�����
	local frame = EasyUI.CreateFrame("TestFrame1",{title = "�ؼ�����",style = "NORMAL"})

	--����һ����ť
	local button1 = EasyUI.CreateButton(frame,"button1",{text = "�ر�",x = 50,y = 50,w = 91,h = 26})
	--�󶨰�ť����¼�
	button1:OnClick(function()
		Output("Click")
		f:Remove()
	end)

	--����һ����ť
	local button2 = EasyUI.CreateButton(frame,"button2",{text = "����",x = 150,y = 50,w = 91,h = 26,enable = false})

	--����һ���༭��
	local edit = EasyUI.CreateEdit(frame,"edit",{text = "�༭�����",x = 50,y = 100})
	--�󶨱༭������¼�
	edit:OnChange(function(arg0)
		Output(arg0)
	end)

	--����һ����ѡ��
	local checkbox1 = EasyUI.CreateCheckBox(frame,"checkbox1",{text = "��ѡ��1",x = 50,y = 150,check = true})
	--�󶨸�ѡ��ѡ���¼�
	checkbox1:OnCheck(function(arg0)
		Output(arg0)
	end)
	local checkbox2 = EasyUI.CreateCheckBox(frame,"checkbox2",{text = "��ѡ��2",x = 150,y = 150,check = true})
	--�󶨸�ѡ��ѡ���¼�
	checkbox2:OnCheck(function(arg0)
		Output(arg0)
	end)

	--����һ��������
	local combobox1 = EasyUI.CreateComboBox(frame,"combobox1",{text = "���������",x = 50,y = 200})
	--�����������¼�
	combobox1:OnClick(function()
		local m = {}
		table.insert(m,{szOption = "���Բ˵�1"})
		table.insert(m,{szOption = "���Բ˵�2"})
		return m
	end)

	--����������ѡ�򣬲���ѡ���¼�
	local radiobox1 = EasyUI.CreateRadioBox(frame,"radiobox1",{text = "��ѡ��1",x = 50,y = 250,check = true,group = "test1"})
	radiobox1:OnCheck(function(arg0)
		Output(arg0)
	end)
	local radiobox2 = EasyUI.CreateRadioBox(frame,"radiobox2",{text = "��ѡ��2",x = 150,y = 250,group = "test1"})
	radiobox2:OnCheck(function(arg0)
		Output(arg0)
	end)
	local radiobox3 = EasyUI.CreateRadioBox(frame,"radiobox3",{text = "��ѡ��3",x = 250,y = 250,group = "test1"})
	radiobox3:OnCheck(function(arg0)
		Output(arg0)
	end)

	--����һ������
	local cslider1 = EasyUI.CreateCSlider(frame,"cslider1",{x = 50,y = 300,w = 200,min = 0,max = 100,step = 100,value = 20,unit = "%"})
	--�󶨻��黬���¼�
	cslider1:OnChange(function(arg0)
		Output(arg0)
	end)

	--����һ����ɫѡ����
	local colorbox1 = EasyUI.CreateColorBox(frame,"colorbox1",{text = "��ɫѡ��������",x = 50,y = 350,r = 255,g = 128,b = 255})
	--����ɫѡ��������¼�
	colorbox1:OnChange(function(arg0)
		Output(arg0)
	end)

	--local w2 = EasyUI.CreateWindow(frame,"w1",{x = 50,y = 400,w = 300,h = 50})
	local text1 = EasyUI.CreateText(frame,"text1",{text = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",x = 50,y = 400,})
	text1:SetFontSpacing(5)
	text1:SetFontColor(255,125,0)

	--����������
	local scroll1 = EasyUI.CreateScroll(frame,"ScrollTest",{x = 400,y = 50,w = 130,h = 200})
	for i = 0, 20 do
		--����Handle
		local handle = EasyUI.CreateHandle(scroll1,"handle"..i,{x = 0,y = i*20,w = 60,h = 20})
		--��������
		EasyUI.CreateText(handle,"txt"..i,{text = "����������Ŀ"..i})
	end
	scroll1:OnUpdateScorllList()

	--����ͼ��
	local image1 = EasyUI.CreateImage(frame,"image1",{w = 36,h = 36,x = 5,y = 10})
	image1:SetImage("ui\\Image\\UICommon\\CommonPanel.UITex",13)

	--��������
	local animate1 = EasyUI.CreateAnimate(frame,"animate1",{w = 161,h = 161,x = 240,y = 50,image = "ui/Image/Common/SprintGreenPower1.UITex"})

	--����shadow
	local shadow1 = EasyUI.CreateShadow(frame,"shadow1",{x = 330,y = 300,w = 55,h = 55})
	shadow1:SetColorRGB(0,255,64)

	--����box
	local box1 = EasyUI.CreateBox(frame,"box1",{x = 420,y = 290,w = 80,h = 80})
	box1:SetObject(UI_OBJECT_SKILL, 9003, 4)
	box1:SetObjectIcon(Table_GetSkillIconID(9003, 4))
end
