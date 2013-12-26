

-- �������
EasyTestAddon = CreateAddon("EasyTestAddon")

-- ���崴���ص�
function EasyTestAddon:OnCreate()
	Output("Create")
	this:RegisterEvent("DO_SKILL_CAST")
end

-- �¼��ص�
--~ EasyTestAddon.OnEvent = function(event)
--~ 	if event == "DO_SKILL_CAST" then
--~ 		if arg0 == UI_GetClientPlayerID() then
--~ 			Output(Table_GetSkillName(arg1, arg2))
--~ 		end
--~ 	end
--~ end
--/script ReloadUIAddon()
function EasyTestAddon:OnScript(event)
	if event == "DO_SKILL_CAST" then
		if arg0 == UI_GetClientPlayerID() then
			Output(Table_GetSkillName(arg1, arg2))
		end
	end
end

-- ������Ⱦ�ص���ֻ����NONE����Frame�ϲ���Ч
--~ EasyTestAddon.OnRender = function()
--~ 	Output("OnRender")
--~ end

-- ����ˢ�»ص�
--~ EasyTestAddon.OnUpdate = function()
--~ 	Output("OnUpdate")
--~ end

-- �������ٻص�
function EasyTestAddon:OnDestroy()
	Output("OnDestroy")
end

-- �����϶��ص�
function EasyTestAddon:OnDragEnd()
	Output("OnDragEnd")
end

-- ���尴����Ӧ�ص�
--~ EasyTestAddon.OnKeyDown = function()
--~ 	Output("OnKeyDown")
--~ end

-- ���洴��
function EasyTestAddon:Open()
	EasyTestAddon:Append("Frame", "EasyTestAddon", {style = "SMALL"})
end
