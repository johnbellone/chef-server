CREATE TABLE IF NOT EXISTS org_policies(
       id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
       policy_group_id UUID NOT NULL REFERENCES org_policy_groups(id) ON DELETE CASCADE,
       name TEXT NOT NULL,
       created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       UNIQUE(name, policy_group_id)
);
