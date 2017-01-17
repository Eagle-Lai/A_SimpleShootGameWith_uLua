using UnityEngine;
using System.Collections;
using LuaInterface;
using LuaFramework;
using UnityEngine.UI;

namespace LuaFramework
{
    public class TestComponemt : MonoBehaviour
    {
        //public LuaTable table;

        ////添加监听
        //public static void AddButtonClick(GameObject go, LuaFunction luafunc)
        //{
        //    if (go == null || luafunc == null)
        //        return;

        //    Button btn = go.GetComponent<Button>();
        //    if (btn == null)
        //        return;

        //    btn.onClick.AddListener
        //    (
        //           delegate()
        //           {
        //               luafunc.Call(go);
        //           }
        //    );
        //}


        //public static void Text(GameObject go, string str)
        //{
        //    if (go == null || str == null) return;

        //    Text txt = go.GetComponent<Text>();

        //    if (txt == null) return;

        //    txt.text = str;
        //}

        ////清除监听
        //public static void ClearButtonClick(GameObject go)
        //{
        //    if (go == null)
        //        return;
        //    Button btn = go.GetComponent<Button>();
        //    if (btn == null)
        //        return;
        //    btn.onClick.RemoveAllListeners();

        //}

        //public static LuaTable Add(GameObject go, LuaTable tableClass)
        //{
        //    LuaFunction fun = tableClass.GetLuaFunction("New");

        //    if (fun == null)
        //        return null;

        //    object[] rets = fun.Call(tableClass);
        //    if (rets.Length != 1) return null;

        //    TestComponemt cmp = go.AddComponent<TestComponemt>();
        //    cmp.table = (LuaTable)rets[0];
        //    cmp.CallAwake();
        //    return cmp.table;
        //}

        //public static LuaTable Get(GameObject go, LuaTable table)
        //{
        //    TestComponemt[] cmps = go.GetComponents<TestComponemt>();
        //    foreach (TestComponemt item in cmps)
        //    {
        //        string mat1 = table.ToString();
        //        string mat2 = item.table.GetMetaTable().ToString();

        //        if (mat1 == mat2)
        //        {
        //            return item.table;
        //        }
        //    }
        //    return null;
        //}

        //void CallAwake()
        //{
        //    LuaFunction fun = table.GetLuaFunction("Awake");
        //    if (fun != null)
        //        fun.Call(table, gameObject);
        //}


        //void Start()
        //{
        //    LuaFunction fun = table.GetLuaFunction("Start");
        //    if (fun != null)
        //        fun.Call(table, gameObject);
        //}


        //void Update()
        //{
        //    //效率问题有待测试和优化
        //    //可在lua中调用UpdateBeat替代
        //    LuaFunction fun = table.GetLuaFunction("Update");
        //    if (fun != null)
        //        fun.Call(table, gameObject);
        //}

    }
}