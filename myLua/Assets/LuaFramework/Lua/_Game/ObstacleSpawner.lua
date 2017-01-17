local ObstacleSpawner = {}

local _obstacleSpawner
local _obstacle
local intervalTime = 5.5


function ObstacleSpawner:Awake()
	resMgr:LoadPrefab('bg', { 'ObstacleSpawner','Obstacle'}, ObstacleSpawner.OnLoadFinish)
end

function ObstacleSpawner.OnLoadFinish(objs)
	print("loadFinish")
	_obstacleSpawner = UnityEngine.GameObject.Instantiate(objs[0])
	_obstacle = objs[1]

	UpdateBeat:Add(ObstacleSpawner.Update, _obstacleSpawner)
end

function ObstacleSpawner.Update()
	intervalTime = intervalTime - UnityEngine.Time.deltaTime
	if(intervalTime < 0) then
		local pos = Vector3.New(_obstacleSpawner.transform.position.x,math.random(-3.5, 5.0), 0)
		UnityEngine.GameObject.Instantiate(_obstacle,pos, _obstacleSpawner.transform.rotation)
		intervalTime = 1.2
	end
end 

function ObstacleSpawner:New()
	local o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end

return ObstacleSpawner