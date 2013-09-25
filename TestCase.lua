
EasyUI = EasyUI or {}

function EasyUI.TestCase()
	--����һ�����
	local f=EasyUI.CreateFrame("test")

	--����һ����ť
	local b=EasyUI.CreateButton(f,"b1",{text="Click Me",x=50,y=50})
	--�󶨰�ť����¼�
	b:OnClick(function() Output("Click") end)

	--����һ���༭��
	local e=EasyUI.CreateEdit(f,"e1",{text="input words",x=50,y=100})
	--�󶨱༭������¼�
	e:OnChanged(function(arg0) Output(arg0) end)

	--����һ����ѡ��
	local c=EasyUI.CreateCheckBox(f,"c1",{text="Check Me",x=50,y=150,check=true})
	--�󶨸�ѡ��ѡ���¼�
	c:OnCheck(function(arg0) Output(arg0) end)

	--����һ��������
	local d=EasyUI.CreateComboBox(f,"c2",{text="Menu",x=50,y=200})
	--�����������¼�
	d:OnClick(function() local m = {} table.insert(m,{szOption="TEST1"}) table.insert(m,{szOption="TEST2"}) return m end)

	--����������ѡ�򣬲���ѡ���¼�
	local r1=EasyUI.CreateRadioBox(f,"r1",{text="Select1",x=50,y=250,check=true,group="test1"})
	r1:OnCheck(function(arg0) Output(arg0) end)
	local r2=EasyUI.CreateRadioBox(f,"r2",{text="Select2",x=150,y=250,group="test1"})
	r2:OnCheck(function(arg0) Output(arg0) end)
	local r3=EasyUI.CreateRadioBox(f,"r3",{text="Select3",x=250,y=250,group="test1"})
	r3:OnCheck(function(arg0) Output(arg0) end)

	--����һ������
	local s=EasyUI.CreateCSlider(f,"s1",{x=50,y=300,w=200,min=0,max=100,step=100,value=20,unit="%"})
	--�󶨻��黬���¼�
	s:OnChanged(function(arg0) Output(arg0) end)

	--����һ����ɫѡ����
	local c3=EasyUI.CreateColorBox(f,"c3",{text="Color",x=50,y=350,r=255,g=255,b=0})
	--����ɫѡ��������¼�
	c3:OnChanged(function(arg0) Output(arg0) end)
end
