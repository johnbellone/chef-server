CREATE TABLE IF NOT EXISTS org_keys(
       id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
       public_key TEXT NOT NULL,
       created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);
