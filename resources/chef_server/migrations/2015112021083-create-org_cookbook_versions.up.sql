CREATE TABLE IF NOT EXISTS org_cookbook_versions(
       id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
       org_cookbook_id NOT NULL REFERENCES org_cookbooks(id) ON DELETE RESTRICT,
       version TEXT NOT NULL,
       frozen BOOLEAN NOT NULL DEFAULT FALSE,
       created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       UNIQUE(version, org_cookbook_id)
);
