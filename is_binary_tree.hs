data BinaryTree a = Empty | Node a (BinaryTree a) (BinaryTree a)

isBST :: (Ord a) => BinaryTree a -> Bool
isBST tree = isBSTHelper tree Nothing Nothing

isBSTHelper :: (Ord a) => BinaryTree a -> Maybe a -> Maybe a -> Bool
isBSTHelper Empty _ _ = True
isBSTHelper (Node val left right) minB maxB =
  withinBounds val minB maxB &&
  isBSTHelper left minB (Just val) &&
  isBSTHelper right (Just val) maxB

withinBounds :: (Ord a) => a -> Maybe a -> Maybe a -> Bool
withinBounds val minB maxB =
  maybe True (val >) minB && maybe True (val <) maxB

