CREATE TABLE IF NOT EXISTS org_users_keys(
       user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
       org_id UUID NOT NULL REFERENCES orgs(id) ON DELETE CASCADE,
       key_id UUID NOT NULL REFERENCES keys(id) ON DELETE CASCADE,
       name TEXT NOT NULL,
       PRIMARY KEY(user_id, org_id, key_id)
       created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);
