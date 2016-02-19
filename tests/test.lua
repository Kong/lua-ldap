local ldap = require "lua_ldap"
assert(ldap)

-- Connecting to server
local session, err = ldap.open_simple({
  uri = "ldap://127.0.0.1:10389"
})
assert(err == nil)
assert(session)

-- Adding a new user
local ok, err  = session:add("commonName=testuser,dc=example,dc=com", {
  objectClass = { "person", "top" },
  sn = "Hello World",
  userPassword = "secret123"
})()
assert(ok)
assert(err == nil)

-- Search the user
local found
for _, b in session:search { base = "cn=testuser,dc=example,dc=com", scope = "base" } do
  assert(b)
  found = true
end
assert(found)

-- Delete the user
local ok, err = session:delete("cn=testuser,dc=example,dc=com")()
assert(ok)
assert(err == nil)