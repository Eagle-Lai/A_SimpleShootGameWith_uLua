using UnityEngine;
using System.Collections;
using LuaFramework;
using LuaInterface;

namespace LuaFramework
{
    public class GameLuaComponent : MonoBehaviour
    {
        public LuaTable table;
        public static LuaTable Add(GameObject go, LuaTable tableClass)
        {
            LuaFunction fun = tableClass.GetLuaFunction("New");

            if (fun == null) return null;

            object[] rets = fun.Call(tableClass);
            if (rets.Length != 1) return null;

            GameLuaComponent cmp = go.AddComponent<GameLuaComponent>();
            cmp.table = (LuaTable)rets[0];
            print("???");
            cmp.CallAwake();
            return cmp.table;
        }

        public static LuaTable Get(GameObject go, LuaTable table)
        {
            GameLuaComponent[] cmps = go.GetComponents<GameLuaComponent>();
            foreach (GameLuaComponent item in cmps)
            {
                string mat1 = table.ToString();
                string mat2 = item.table.GetMetaTable().ToString();

                if (mat1 == mat2)
                {
                    return item.table;
                }
            }
           
            return null;
        }

        void CallAwake()
        {
            LuaFunction fun = table.GetLuaFunction("Awake");
            if (fun != null)
                fun.Call(table, gameObject);
        }

        void Start()
        {
            
            LuaFunction fun = table.GetLuaFunction("Start");
            if (fun != null)
                fun.Call(table, gameObject);
        }

        void Update()
        {
            LuaFunction fun = table.GetLuaFunction("Update");
            if (fun != null)
                fun.Call(table, gameObject);
        }
    }
}