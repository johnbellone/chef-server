(ns chef-server.system
  (:require [clojure.java.io :as io]
            [com.stuartsierra.component :as component]
            [duct.component.endpoint :refer [endpoint-component]]
            [duct.component.handler :refer [handler-component]]
            [duct.component.hikaricp :refer [hikaricp]]
            [duct.component.ragtime :refer [ragtime]]
            [duct.middleware.not-found :refer [wrap-not-found]]
            [meta-merge.core :refer [meta-merge]]
            [ring.component.jetty :refer [jetty-server]]
            [ring.middleware.defaults :refer [wrap-defaults site-defaults]]
            [ring.middleware.webjars :refer [wrap-webjars]]
            [chef-server.endpoint.status :refer [status-endpoint]]
            [chef-server.endpoint.orgs :refer [orgs-endpoint]]
            [chef-server.endpoint.users :refer [users-endpoint]]
            [chef-server.endpoint.groups :refer [groups-endpoint]]))

(def base-config
  {:app {:middleware [[wrap-not-found :not-found]
                      [wrap-webjars]
                      [wrap-defaults :defaults]]
         :not-found  (io/resource "chef_server/errors/404.html")
         :defaults   (meta-merge site-defaults {:static {:resources "chef_server/public"}})}
   :ragtime {:resource-path "chef_server/migrations"}})

(defn new-system [config]
  (let [config (meta-merge base-config config)]
    (-> (component/system-map
         :app  (handler-component (:app config))
         :http (jetty-server (:http config))
         :db   (hikaricp (:db config))
         :ragtime (ragtime (:ragtime config))
         :status (endpoint-component status-endpoint)
         :orgs (endpoint-component orgs-endpoint)
         :users (endpoint-component users-endpoint)
         :groups (endpoint-component groups-endpoint))
        (component/system-using
         {:http [:app]
          :app  [:status]
          :ragtime [:db]
          :status [:db]
          :orgs [:db]
          :users [:db]
          :groups [:db]}))))
