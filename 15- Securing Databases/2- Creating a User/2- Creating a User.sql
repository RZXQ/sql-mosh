-- 1. Create user with host restrictions
CREATE USER ruizhi@127.0.0.1; -- Only local IP connections
CREATE USER ruizhi@localhost; -- Only localhost connections
CREATE USER ruizhi@'%.codewithmosh.com'; -- Any subdomain of codewithmosh.com

-- 2. Create user with password
CREATE USER ruizhi IDENTIFIED BY '1234';