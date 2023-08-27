module Types
  ( User (..),
    Me (..),
    Project (..),
  )
where

data User = User
  { id :: !Int,
    username :: !String,
    name :: !String
  }

data Me = Me
  { meUserId :: !Int,
    bio :: !String,
    lk :: !String
  }

data Project = Project
  { projectUserId :: !Int,
    title :: !String,
    link :: !String,
    explination :: !String
  }
