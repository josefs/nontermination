Various examples of language constructs which causes non-termination
====================================================================

The examples each give a small Haskell program which doesn't
terminate. Just load the file and type `main` and witness the
non-termination in all its glory.

Recursive values
----------------

~~~ {.haskell file="Val.hs"}
x = x

main = x
~~~

Recursive functions
-------------------

If we try to evaluate `x` we will get an infinite loop

~~~ {.haskell file="Fun.hs"}
f x = f x

main = f ()
~~~

Contravariant data types
------------------------

If we try to evaluate `f e` for whatever `e` then we get non-termination

~~~ {.haskell file="Data.hs"}
data A = A (A -> IO ())

foo (A f) = f (A f)

main = foo (A foo)
~~~

Evaluation `foo (A foo)` will result in a loop

Higher order store
------------------

~~~ {.haskell file="Store.hs"}
import Data.IORef

main = do
  r <- newIORef (\() -> return ())
  writeIORef r (\() -> readIORef r >>= \f -> f ())
  f <- readIORef r
  f ()
~~~

Delimited continuations usings prompts and stuff
------------------------------------------------

See: [Simply typed lambda-calculus with a typed-prompt delimited control is not strongly normalizing](http://okmij.org/ftp/continuations/)


Paradoxes in inconsistent type theories
---------------------------------------

* Girard's paradox
* Hurken's paradox
