import Data.IORef

main = do
  r <- newIORef (\() -> return ())
  writeIORef r (\() -> readIORef r >>= \f -> f ())
  f <- readIORef r
  f ()
