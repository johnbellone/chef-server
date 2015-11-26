(ns chef-server.endpoint.groups
  (:require [compojure.core :refer :all]
            [schema.core :as s]))

(s/defschema Group
  {:id String
   :name String})

(defn groups-endpoint []
  (routes
   (GET "/groups" [])
   (POST "/groups" [])
   (GET "/groups/:group-name" [group-name])
   (PUT "/groups/:group-name" [group-name])
   (DELETE "/groups/:group-name" [group-name])))
