import Control.Concurrent
import Control.Monad
import Network.HTTP.Conduit
import qualified Data.ByteString.Lazy as BS

-- Define a list of URLs to download
urls :: [String]
urls =
    [ "https://www.example.com"
    , "https://www.google.com"
    , "https://www.wikipedia.org"
    ]

-- Function to download a web page
downloadPage :: String -> IO BS.ByteString
downloadPage url = simpleHttp url

-- Function to calculate the character count of a ByteString
charCount :: BS.ByteString -> Int
charCount = BS.length

-- Main function
main :: IO ()
main = do
    -- Create a list of threads
    threads <- forM urls $ \url -> forkIO $ do
        page <- downloadPage url
        let count = charCount page
        putStrLn $ url ++ " has " ++ show count ++ " characters."

    -- Wait for all threads to finish
    forM_ threads $ \tid -> do
        _ <- waitForThread tid
        putStrLn $ "Thread " ++ show tid ++ " finished."

-- Utility function to wait for a thread to finish
waitForThread :: ThreadId -> IO ()
waitForThread tid = do
    result <- tryTakeMVar mvar
    case result of
        Nothing -> threadDelay 10000 >> waitForThread tid
        Just _ -> return ()
  where
    mvar = mkMVar tid

-- Utility function to create an MVar from a ThreadId
mkMVar :: ThreadId -> IO (MVar ())
mkMVar tid = do
    mvar <- newEmptyMVar
    forkIO $ putMVar mvar () >> return ()
    return mvar
