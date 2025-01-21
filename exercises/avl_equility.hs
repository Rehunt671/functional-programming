-- Binary Trees
-- Definition of Equality: Two binary trees are equal if:
  -- Their structures are identical
  -- Corresponding nodes contain the same values.
-- When Are Two Binary Trees Equal?:
  -- Both trees are empty, or
  -- Both trees have the same root value, and their left subtrees and right subtrees are recursively equal

-- Lists
  -- Definition of Equality: Two lists are equal if
  -- Corresponding elements are equal.
-- When Are Two Lists Equal?:
  -- Both lists are empty, or
  -- The first elements of both lists are equal, and the rest of the lists are recursively equal.



-- Pair
-- Definition of Equality: Two pairs are equal if:
   -- Their first elements are equal.
   -- Their second elements are equal.
-- When Are Two Pairs Equal?:
   -- (a1,b1) and (a2,b2) and equal if a1 = a2 and b1 = b2

-- Maybe
-- Definition of Equality: Two Maybe values are equal if:
  -- Both are Nothing, or
  -- Both are Just and the contained values are equal.
-- When Are Two Maybes Equal?
  -- Nothing equals Nothing , or
  -- Just(x) equals Just(y) if x = y
