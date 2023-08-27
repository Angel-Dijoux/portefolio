{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE OverloadedStrings #-}

module Routes where

import Types
import UserInstance (getUsers)
import Web.Scotty (ScottyM, get)

routes :: ScottyM ()
routes = do
  get "/users" getUsers