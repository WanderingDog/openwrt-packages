local a,t,e
local m, s
local o=require"nixio.fs"

local o={
"false",
"true",
}

a= Map("trojan_go", translate("Trojan Go Server Config"))
a.description = translate("Trojan Go Server is a fork of the Trojan Go project, claimed to be superior in terms of security and stability")

a:section(SimpleSection).template  = "trojan_go/trojan_go_status"

t=a:section(TypedSection,"server",translate(""))
t.anonymous=true
t.addremove=false

e=t:option(Flag,"enable",translate("Enable"))
e.rmempty=false

e=t:option(Value,"server_port",translate("Trojan Listen Port"))
e.datatype="port"
e.rmempty=false
e.default=443

e=t:option(Value,"ssl_key_path",translate("SSL Key File Path"))
e.rmempty=false

e=t:option(Value,"ssl_cert_path",translate("SSL Cert File Path"))
e.rmempty=false

e=t:option(Value,"password",translate("Password"))
e.password=true
e.rmempty=false

e=t:option(Value,"remote_server_address",translate("Remote Http Server Address"))
e.rmempty=false

e=t:option(Value,"remote_server_port",translate("Remote Http Server Port"))
e.datatype="port"
e.rmempty=false
e.default=80

return a
