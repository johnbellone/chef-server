CREATE TABLE IF NOT EXISTS org_nodes(
       id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
       org_id UUID NOT NULL REFERENCES orgs(id) ON DELETE CASCADE,
       key_id UUID NOT NULL REFERENCES keys(id) ON DELETE CASCADE,
       environment_id UUID NOT NULL REFERENCES org_environments(id) ON DELETE CASCADE,
       policy_name TEXT NOT NULL,
       policy_group TEXT NOT NULL,
       name TEXT NOT NULL,
       created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       UNIQUE(name, org_id)
);
