data BinaryTree a = Empty | Node a (BinaryTree a) (BinaryTree a)

height :: BinaryTree a -> Int
height Empty = 0
height (Node _ left right) = 1 + max (height left) (height right)