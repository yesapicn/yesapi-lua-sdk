![](http://cdn7.okayapi.com/CEE4B8A091578B252AC4C92FB4E893C3_20190304213902_63f85e982adc8419feffd862e883581e.jpeg)

# yesapi-lua-sdk
小白接口（YesApi.cn）Lua SDK包

## 使用示例

```lua
require ("YesApiLuaSDK")

local params = {}
params.name = 'dogstar'

local rs = YesApiLuaSDK.request('App.Hello.World', params)

print(rs)
```
