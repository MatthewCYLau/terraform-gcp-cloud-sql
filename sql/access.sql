REVOKE CONNECT ON DATABASE ecommerce FROM PUBLIC;

GRANT CONNECT
ON DATABASE ecommerce
TO "db-iam-user@open-source-apps-001.iam";

REVOKE ALL
ON ALL TABLES IN SCHEMA public 
FROM PUBLIC;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public 
TO "db-iam-user@open-source-apps-001.iam";