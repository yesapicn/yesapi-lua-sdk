YesApiLuaSDK = {}

--require('xxtsp')

--TODO: 这里要改成你的接口域名
YesApiLuaSDK.APP_HOST = 'http://api.yesapi.cn/'
--TODO: 这里要改成你的APP_KEY
YesApiLuaSDK.APP_KEY = '**'
--TODO: 这里要改成你的APP_SECRECT
YesApiLuaSDK.APP_SECRECT = '**'

--md5
function md5str(text)
    local sz = require("sz")
    return string.upper(text:md5())
end

--将sign字典排序
function signlist(tables)
	local list={}
	for i in pairs(tables) do
		if i ~= nil then 
			table.insert(list, i)  
		end
	end
	table.sort(list, function(a,b) return (a < b) end)
	local signStr = ''
	for _, fName in pairs(list) do 
		signStr = signStr..tables[fName]
	end
	signStr = signStr..APP_SECRECT
	return signStr
end

-----------请求小白接口
function YesApiLuaSDK.request(service,tables,times)
    local tables = tables or {}
    local times = times or 9
	
	tables.app_key = APP_KEY 			--你的appkey 写在顶上就行了
    tables.sign = ''
	tables.sign = md5str(tables)		--将sign md5加密

	local server = APP_HOST
	local post_data = ''
	for k,v in pairs(tables)do
		post_data = post_data..k..'='..v..'&'
	end
	
    local sz = require("sz")
    local cjson = sz.json
    local http = sz.i82.http
	local safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3)'
	local code, res_headers, body = http.post(server, 15, {
		["User-Agent"] = safari, -- 模拟 safari
	}, post_data)
	if code == 200 then
		data = json.decode(body)
		if data.ret == "200" then
			return data
		end
	end
end


