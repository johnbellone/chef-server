(ns chef-server.schema.org
  (:require [schema.core :as s]))

(s/defschema Org
  {:id String
   :name String
   :full_name String})
