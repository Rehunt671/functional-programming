data NAryTree a = NNode a [NAryTree a]


preOrder :: NAryTree a -> [a]
preOrder (NNode val children) = val : concatMap preOrder children

postOrder :: NAryTree a -> [a]
postOrder (NNode val children) = concatMap postOrder children ++ [val]
