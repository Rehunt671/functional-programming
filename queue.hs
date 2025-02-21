import Control.Monad.State

type Queue a = ([a], [a], Int)

-- Get size of the queue
size :: State (Queue a) Int
size = do
    (_, _, n) <- get
    return n

-- Check if the queue is empty
isEmpty :: State (Queue a) Bool
isEmpty = do
    (_, _, n) <- get
    return (n == 0)

-- Ensure the front stack is non-empty
balance :: Queue a -> Queue a
balance ([], back, n) = (reverse back, [], n)
balance q = q

-- Enqueue an element
enqueue :: a -> State (Queue a) ()
enqueue x = do
    (front, back, n) <- get
    put (front, x : back, n + 1)

-- Dequeue an element
dequeue :: State (Queue a) (Maybe a)
dequeue = do
    (front, back, n) <- get
    case front of
        (x:xs) -> put (xs, back, n - 1) >> return (Just x)
        []     -> let (newFront, newBack, newN) = balance ([], back, n)
                  in case newFront of
                      (y:ys) -> put (ys, newBack, newN - 1) >> return (Just y)
                      []     -> return Nothing  -- Return Nothing if empty

-- Create a queue from a list
mkQueue :: [a] -> State (Queue a) ()
mkQueue xs = put (xs, [], length xs)

-- Empty the queue
empty :: State (Queue a) ()
empty = put ([], [], 0)
