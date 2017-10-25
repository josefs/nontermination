data A = A (A -> IO ())

foo (A f) = f (A f)

main = foo (A foo)
