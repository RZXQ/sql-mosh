-- Way 1: Change password through query
ALTER USER john IDENTIFIED BY '1234'; -- Change password for specific user
ALTER USER USER() IDENTIFIED BY '1234'; -- Change password for currently logged in user

-- Way 2: Change password through the navigator panel on the right hand side