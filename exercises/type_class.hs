-- Define the IfValue typeclass
class IfValue a where
  boolVal :: a -> Bool

-- Instance for Bool (identity function)
instance IfValue Bool where
  boolVal = id

-- Instance for Maybe
instance IfValue (Maybe a) where
  boolVal (Just _) = True
  boolVal Nothing  = False

-- Instance for Either
instance IfValue (Either l r) where
  boolVal (Right _) = True
  boolVal (Left _)  = False

-- Instance for List (non-empty lists are True, empty lists are False)
instance IfValue [a] where
  boolVal [] = False
  boolVal _  = True


-- Instances for specific numeric types
instance IfValue Int where
  boolVal 0 = False
  boolVal _ = True

instance IfValue Integer where
  boolVal 0 = False
  boolVal _ = True

-- Instance for tuples (If both elements are True, the tuple is True)
instance (IfValue a, IfValue b) => IfValue (a, b) where
  boolVal (x, y) = boolVal x && boolVal y

instance IfValue Float where
  boolVal 0 = False
  boolVal _ = True

instance IfValue Double where
  boolVal 0 = False
  boolVal _ = True

-- Usage
ifExample :: (IfValue a) => a -> String
ifExample cond =
  if boolVal cond
    then "Condition is True"
    else "Condition is False"
