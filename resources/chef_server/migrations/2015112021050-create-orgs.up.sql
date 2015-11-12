CREATE TABLE IF NOT EXISTS orgs(
       id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
       name TEXT NOT NULL UNIQUE,
       full_name TEXT NOT NULL,
       created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
);
