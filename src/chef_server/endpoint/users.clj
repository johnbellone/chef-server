(ns chef-server.endpoint.users
  (:require [compojure.core :refer :all]
            [schema.core :as s]))

(s/defschema User
  {:id String
   :name String})

(defn users-endpoint []
  (routes
   (GET "/users" [])
   (POST "/users" [])
   (GET "/users/:user-name" [user-name])
   (PUT "/users/:user-name" [user-name])
   (DELETE "/users/:user-name" [user-name])))
