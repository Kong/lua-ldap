package="lua_ldap"
version="1.0.0-1"
source = {
   url = "https://github.com/mashape/lua-ldap/archive/1.0.0.tar.gz",
   tag = "1.0.0"
}
description = {
   summary = "Simple interface from Lua to an LDAP Client",
   detailed = [[
      Simple interface from Lua to an LDAP client.
   ]],
   homepage = "https://github.com/mashape/lua-ldap",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1, < 5.3"
}
external_dependencies = {
   LIBLDAP = {
      header = "ldap.h",
      library = "ldap",
   }
}
build = {
   type = "builtin",
   modules = {
      lualdap = {
         sources = "src/lualdap.c",
         libdirs = "$(LIBLDAP_LIBDIR)",
         incdirs = "$(LIBLDAP_INCDIR)",
         libraries = "ldap",
      },
   }
}
