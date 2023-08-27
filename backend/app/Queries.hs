{-# LANGUAGE OverloadedStrings #-}

module Queries where

import Database.PostgreSQL.Simple (Query)

allUser :: Query
allUser = "SELECT id, username, name FROM user"