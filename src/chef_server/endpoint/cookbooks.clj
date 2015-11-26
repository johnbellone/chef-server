(ns chef-server.endpoint.cookbooks
  (:require [compojure.core :refer :all]
            [schema.core :as s]))

(defn cookbooks-endpoint []
  (routes
   (GET "/universe" [])))
