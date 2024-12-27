data BinaryTree a = Empty | Node a (BinaryTree a) (BinaryTree a)

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Empty = Empty
mapTree f (Node val left right) = Node (f val) (mapTree f left) (mapTree f right)