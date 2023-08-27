{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE OverloadedStrings #-}

module UserInstance
  ( getUsers,
  )
where

import Control.Monad.IO.Class (liftIO)
import Data.Aeson (KeyValue ((.=)), ToJSON (toJSON), Value, encode, object, (.=))
import Database.PostgreSQL.Simple (Connection, query_)
import Database.PostgreSQL.Simple.FromRow (FromRow (..), RowParser, field)
import Db (connectDb)
import Queries (allUser)
import Types
import Web.Scotty (ActionM)
import qualified Web.Scotty as S

instance FromRow User where
  fromRow :: RowParser User
  fromRow = User <$> field <*> field <*> field

instance ToJSON User where
  toJSON (User id username name) =
    object
      [ "id" .= id,
        "username" .= username,
        "name" .= name
      ]

getUsers :: ActionM ()
getUsers = do
  conn <- liftIO connectDb
  users <- (liftIO $ query_ conn allUser) :: ActionM [User]
  S.json users