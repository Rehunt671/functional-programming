data Tree a = Empty | Node a (Tree a) (Tree a)

foldPre :: (a -> b -> b -> b) -> b -> Tree a -> b
foldPre _ z Empty = z
foldPre f z (Node v left right) = f v (foldPre f z left) (foldPre f z right)

foldIn :: (a -> b -> b -> b) -> b -> Tree a -> b
foldIn _ z Empty = z
foldIn f z (Node v left right) = f v (foldIn f z left) (foldIn f z right)

foldPost :: (a -> b -> b -> b) -> b -> Tree a -> b
foldPost _ z Empty = z
foldPost f z (Node v left right) = f v (foldPost f z left) (foldPost f z right)

foldSum :: Tree Int -> Int
foldSum = foldPre (\x l r -> x + l + r) 0