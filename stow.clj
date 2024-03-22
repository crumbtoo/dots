#!/usr/bin/env bb

(require '[babashka.process :refer [shell]]
         '[babashka.fs :as fs])

(def dots-dir "dots")
(def home (System/getenv "HOME"))

(defn stow [& packages]
  (apply shell
         "stow -v2"
         "-d" dots-dir
         "-t" home
         "-S" packages))

(if (empty *command-line-args*)
    (stow (map str (fs/glob dots-dir "*")))
    (stow *command-line-args*))

