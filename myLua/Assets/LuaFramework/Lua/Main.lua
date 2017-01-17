
--主入口函数。从这里开始lua逻辑
function Main()		
	local go = UnityEngine.GameObject("bg")
	local BgMove = require "_Game/BgMove"
	LuaFramework.GameLuaComponent.Add(go, BgMove)

	local player = UnityEngine.GameObject("player")
	local PlayerController = require "_Game/PlayerController"
	LuaFramework.GameLuaComponent.Add(go, PlayerController)

	local Spawner = UnityEngine.GameObject("Spawner")
	local ObstacleSpawner = require "_Game/ObstacleSpawner"
	LuaFramework.GameLuaComponent.Add(Spawner, ObstacleSpawner)
end

--场景切换通知
function OnLevelWasLoaded(level)
	Time.timeSinceLevelLoad = 0
end