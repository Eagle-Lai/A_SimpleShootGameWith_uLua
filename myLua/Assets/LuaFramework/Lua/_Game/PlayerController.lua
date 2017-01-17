	

local PlayerController = {}

local player
local bullet
local Input = UnityEngine.Input
local intervalTime = 0.8
--local fireStep = 0.5

function PlayerController:Awake()
	resMgr:LoadPrefab('bg', { 'player', 'bullet'}, PlayerController.OnPlayerLoadFinish)
end

function PlayerController.OnPlayerLoadFinish(objs)
	player = UnityEngine.GameObject.Instantiate(objs[0])
	bullet = objs[1]
	FixedUpdateBeat:Add(PlayerController.FixedUpdate, player)
	UpdateBeat:Add(PlayerController.Update, player)
end



function PlayerController.Update(objs)
	intervalTime = intervalTime - UnityEngine.Time.deltaTime 
	if(Input.GetMouseButton(0) and intervalTime < 0 ) then
		UnityEngine.GameObject.Instantiate(bullet, player.transform.position, player.transform.rotation)	
		intervalTime = 0.8
	end
	
end



function PlayerController.FixedUpdate()

	local h = Input.GetAxis("Horizontal")
	local v = Input.GetAxis("Vertical")

	local x = player.transform.position.x + h / 5
	local y = player.transform.position.y + v / 5

	if y > 5.5 then y = 5.5 end
	if y < -3.5 then y = -3.5 end

	if x > 8 then x = 8 end
	if x < -8 then x = -8 end

	player.transform.position = Vector3.New(x, y, 0)
end

function PlayerController:New()
	local o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end


return PlayerController