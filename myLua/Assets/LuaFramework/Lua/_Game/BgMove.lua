local BgMove = {}

local bg
local bg2

 function BgMove:Awake()
	LuaHelper = LuaFramework.LuaHelper
	resMgr = LuaHelper.GetResManager()
	resMgr:LoadPrefab('bg', { 'bg' }, BgMove.OnLoadFinish)
end

function BgMove.OnLoadFinish(objs)
	bg = UnityEngine.GameObject.Instantiate(objs[0])
	bg2 = UnityEngine.GameObject.Instantiate(objs[0])

	bg2.transform.position = Vector3.New(-20.3, 0, 0)
	FixedUpdateBeat:Add(BgMove.FixedUpdate, bg)
end 



 function BgMove.FixedUpdate()
	if(bg.transform.position.x < 20.3) then
		local x = bg.transform.position.x + 0.05
		bg.transform.position = Vector3.New(x, 0,0)
	else
		bg.transform.position = Vector3.New(0, 0, 0)
	end

	if(bg2.transform.position.x < 0) then
		local x = bg2.transform.position.x + 0.05
		bg2.transform.position = Vector3.New(x, 0,0)
	else
		bg2.transform.position = Vector3.New(-20.3, 0, 0)
	end
end

function BgMove:New()
	local o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end 

return BgMove;