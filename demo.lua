require ("YesApiLuaSDK")

local params = {}
params.name = 'dogstar'

local rs = YesApiLuaSDK.request('App.Hello.World', params)

print(rs)

