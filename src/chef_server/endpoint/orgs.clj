(ns chef-server.endpoint.orgs
  (:require [compojure.core :refer :all]
            [schema.core :as s]))

(s/defschema Org
  {:guid String
   :name String
   :full_name String})

(defn orgs-endpoint []
  (routes
   (GET "/orgs" [])
   (POST "/orgs" [])
   (GET "/orgs/:org-name" [org-name])
   (GET "/orgs/:org-name/license" [org-name])
   (DELETE "/orgs/:org-name" [org-name])
   (PUT "/orgs/:org-name" [org-name])))
