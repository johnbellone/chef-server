CREATE TABLE IF NOT EXISTS org_data_bag_items(
       id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
       org_data_bag_id UUID NOT NULL REFERENCES org_data_bags(id) ON DELETE CASCADE,
       name TEXT NOT NULL,
       created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       UNIQUE(name, org_data_bag_id)
);
