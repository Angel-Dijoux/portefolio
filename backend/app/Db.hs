module Db where

import Configuration.Dotenv (defaultConfig, loadFile)
import Database.PostgreSQL.Simple
  ( ConnectInfo
      ( connectDatabase,
        connectHost,
        connectPassword,
        connectPort,
        connectUser
      ),
    Connection,
    connect,
    defaultConnectInfo,
  )
import System.Environment (getEnv)

loadDbConfig :: IO ConnectInfo
loadDbConfig = do
  loadFile defaultConfig -- Load the environment variables from .env file
  host <- getEnv "DB_HOST"
  user <- getEnv "DB_USER"
  password <- getEnv "DB_PASSWORD"
  database <- getEnv "DB_NAME"
  -- create the connection info with the loaded environment variables
  let connectInfo =
        defaultConnectInfo
          { connectUser = user,
            connectPassword = password,
            connectDatabase = database,
            connectHost = host
          }
  return connectInfo

connectDb :: IO Connection
connectDb = do
  connectInfo <- loadDbConfig
  connect connectInfo -- connect to the database with the loaded connection info