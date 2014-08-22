(ns mori.transit
  (:refer-clojure :exclude 
    [])
  (:require 
    [cognitect.transit :as t]))

(def ^:export read t/read)
(def ^:export write t/write)
(def ^:export reader t/reader)
(def ^:export writer t/writer)