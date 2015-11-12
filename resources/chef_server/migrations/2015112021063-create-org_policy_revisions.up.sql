CREATE TABLE IF NOT EXISTS org_policy_revisions(
       id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
       org_id UUID NOT NULL REFERENCES orgs(id) ON DELETE CASCADE,
       name TEXT NOT NULL,
       created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       UNIQUE(policy_group_id, org_id)
);
