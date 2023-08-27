{-# LANGUAGE OverloadedStrings #-}

import Network.HTTP.Types (status200)
import Network.HTTP.Types.Header (hContentType)
import Network.Wai.Handler.Warp (run)
import Network.Wai.Middleware.Static
import Routes (routes)
import Web.Scotty

main :: IO ()
main = do
  let port = 8001
  putStrLn $ "Listening on port " ++ show port
  scotty port $ do
    middleware $ staticPolicy (noDots >-> addBase "static")
    routes
