module("luci.controller.trojan_go",package.seeall)

function index()
if not nixio.fs.access("/etc/config/trojan_go")then
  return
end

entry({"admin", "vpn"}, firstchild(), "VPN", 45).dependent = false
	
local page

entry({"admin","vpn","trojan_go"},cbi("trojan_go"),_("Trojan Go Server"),4).dependent=true
entry({"admin","vpn","trojan_go","status"},call("act_status")).leaf=true
end

function act_status()
  local e={}
  e.running=luci.sys.call("busybox ps -w | grep trojan_go |grep -v grep >/dev/null") == 0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
