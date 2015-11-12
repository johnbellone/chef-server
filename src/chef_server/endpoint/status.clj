(ns chef-server.endpoint.status
  (:require [compojure.core :refer :all]
            [clojure.java.io :as io]))

(def status-page
  (io/resource "chef_server/endpoint/status/index.html"))

(defn status-endpoint []
  (routes
   (GET "/" [] status-page)))
