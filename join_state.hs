import Control.Monad.State
-- Implement joinState
joinState :: State s (State s a) -> State s a
joinState m = do
    innerState <- m
    innerState


-- Prove
-- The Functor laws state that:

-- Identity Law: fmap id = id
fmap id (State h) = State (\s -> let (x, s') = h s in (id x, s'))
                    = State (\s -> let (x, s') = h s in (x, s'))
                    = State h  
-- Composition Law: fmap (f . g) = fmap f . fmap g
-- LHS
fmap (f . g) (State h)
= State (\s -> let (x, s') = h s in ((f . g) x, s'))
-- RHS
fmap g (State h)
= State (\s -> let (x, s') = h s in (g x, s'))
fmap f (State (\s -> let (x, s') = h s in (g x, s')))
= State (\s -> let (y, s') = (\s -> let (x, s') = h s in (g x, s')) s in (f y, s'))
= State (\s -> let (x, s') = h s in (f (g x), s'))
