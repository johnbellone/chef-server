CREATE TABLE IF NOT EXISTS org_clients(
       id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
       org_id UUID NOT NULL REFERENCES orgs(id) ON DELETE CASCADE,
       key_id UUID NOT NULL REFERENCES keys(id) ON DELETE CASCADE,
       name TEXT NOT NULL,
       validator BOOLEAN NOT NULL DEFAULT FALSE,
       created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       UNIQUE(name, org_id, key_id)
);
