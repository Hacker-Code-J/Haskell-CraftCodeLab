{-# LANGUAGE GeneralizedNewtypeDeriving #-}

import Control.Monad.Reader
import Control.Monad.State
import Control.Monad.Writer

-- Define a custom configuration type
data AppConfig = AppConfig
    { dbName :: String
    , debugMode :: Bool
    }

-- Define a custom application state type
data AppState = AppState
    { database :: [(String, String)]
    , logMessages :: [String]
    }

-- Define a custom monad stack using ReaderT, StateT, and WriterT
newtype AppM a = AppM
    { runAppM :: ReaderT AppConfig (StateT AppState (WriterT [String] IO)) a
    } deriving (Monad, MonadIO, MonadReader AppConfig, MonadState AppState, MonadWriter [String])

-- Helper function to run our monad stack
runApp :: AppConfig -> AppState -> AppM a -> IO (a, AppState, [String])
runApp config state action = runWriterT (runStateT (runReaderT (runAppM action) config) state)


-- Example 1: Reading configuration and logging

getConfigAndLog :: AppM ()
getConfigAndLog = do
    config <- ask
    logMessage $ "Database Name: " ++ dbName config
    logMessage $ "Debug Mode: " ++ show (debugMode config)

main1 :: IO ()
main1 = do
    let config = AppConfig "my_db" True
    let initialState = AppState [] []
    ((), finalState, logMessages) <- runApp config initialState getConfigAndLog
    putStrLn "Final State:"
    print finalState
    putStrLn "Log Messages:"
    mapM_ putStrLn logMessages

-- Example 2: Modifying state and logging

modifyStateAndLog :: AppM ()
modifyStateAndLog = do
    modify (\s -> s { database = [("key", "value")], logMessages = ["State modified"] })
    logMessage "State modified."

main2 :: IO ()
main2 = do
    let config = AppConfig "my_db" True
    let initialState = AppState [] []
    ((), finalState, logMessages) <- runApp config initialState modifyStateAndLog
    putStrLn "Final State:"
    print finalState
    putStrLn "Log Messages:"
    mapM_ putStrLn logMessages
