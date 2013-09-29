local CreateAddon = EasyUI["CreateAddon"]
local CreateFrame = EasyUI["CreateFrame"]

-- �������
EasyTestAddon = CreateAddon("EasyTestAddon")

-- ���崴���ص�
EasyTestAddon.OnCreate = function()
	this:RegisterEvent("DO_SKILL_CAST")
end

-- �¼��ص�
EasyTestAddon.OnScript = function(event)
	if event == "DO_SKILL_CAST" then
		if arg0 == UI_GetClientPlayerID() then
			Output(Table_GetSkillName(arg1, arg2))
		end
	end
end

-- �������ٻص�
EasyTestAddon.OnDestroy = function()
	Output("OnDestroy")
end

-- �����϶��ص�
EasyTestAddon.OnDragEnd = function()
	Output("OnDragEnd")
end

-- ���尴����Ӧ�ص�
EasyTestAddon.OnKeyDown = function()
	Output("OnKeyDown")
end

-- ���洴��
EasyTestAddon.Open = function()
	EasyTestAddon.frame = CreateFrame("EasyTestAddon", {style = "SMALL"})
end