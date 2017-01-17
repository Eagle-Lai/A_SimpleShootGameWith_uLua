 myTestLua = { name = "myTestLua"}

local go
local cube

function myTestLua:Awake()
	print("Awake  + "..self.name)
	LuaHelper = LuaFramework.LuaHelper;
	resMgr = LuaHelper.GetResManager();
	resMgr:LoadPrefab('mytestpanel', {'myTestPanel', 'Cube'}, OnFinishLoad)
	resMgr:LoadPrefab('cube', {'Cube'}, OnCubeLoadFinish)
	print("Awake  + "..self.name)
end

function OnFinishLoad(objs)

	go = UnityEngine.GameObject.Instantiate(objs[0]);
	local parent = UnityEngine.GameObject.Find("Canvas");
	go.transform.parent = parent.transform;
	go.transform.localScale = Vector3.one;
	go.transform.localPosition = Vector3.zero;

	local btn = go.transform:FindChild("Button").gameObject;
	LuaFramework.TestComponemt.AddButtonClick(btn, OnClick);
end

function OnCubeLoadFinish(objs)
	cube = UnityEngine.GameObject.Instantiate(objs[0])
	print("load finish")
	UpdateBeat:Add(Update, cube)
end

function Update()
	local Input = UnityEngine.Input
	local h = Input.GetAxis("Horizontal")
	local v = Input.GetAxis("Vertical")

	local x = cube.transform.position.x + h
	local y = cube.transform.position.y + v
	cube.transform.position = Vector3.New(x, y, 0)
end

function OnClick()
	local text = go.transform:FindChild("Text").gameObject;
	print("can change text?")
	text:GetComponent(typeof(UnityEngine.UI.Text)).text = "Hello, LuaFramework";
	--LuaFramework.TestComponemt.Text(text, "Hello, LuaFramework");
	print("ok?")
end

function myTestLua:Update()

end

function myTestLua:New(obj)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function testPrint()
	print("hello, LuaFramework  "..self.name)
end


return myTestLua