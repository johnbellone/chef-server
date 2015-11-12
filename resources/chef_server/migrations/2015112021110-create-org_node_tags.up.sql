CREATE TABLE IF NOT EXISTS org_node_tags(
       id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
       node_id UUID NOT NULL REFERENCES org_nodes(id) ON DELETE CASCADE,
       name TEXT NOT NULL,
       created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       UNIQUE(name, node_id)
);
