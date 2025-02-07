

foldr_use_foldl :: (a -> b -> b) -> b -> [a] -> b
foldr_use_foldl f z xs = foldl (\g x a -> g (f x a)) id xs z

foldl_use_foldr :: (b -> a -> b) -> b -> [a] -> b
foldl_use_foldr f z xs = foldr (\x g a -> g (f a x)) id xs z

main :: IO ()
main = do
    print $ foldr_use_foldl (+) 0 [1, 2, 3, 4]    -- Expected output: 10
    print $ foldr_use_foldl (*) 1 [1, 2, 3, 4]    -- Expected output: 24
    print $ foldr_use_foldl (:) [] [1, 2, 3, 4]   -- Expected output: [1, 2, 3, 4]
    print $ foldr_use_foldl (&&) True [True, False, True]  -- Expected output: False
    print $ foldr_use_foldl (||) False [False, False, True] -- Expected output: True

    print $ foldl_use_foldr (+) 0 [1, 2, 3, 4]    -- Expected output: 10
    print $ foldl_use_foldr (*) 1 [1, 2, 3, 4]    -- Expected output: 24
    print $ foldl_use_foldr (flip (:)) [] [1, 2, 3, 4] -- Expected output: [4, 3, 2, 1]
    print $ foldl_use_foldr (&&) True [True, False, True]  -- Expected output: False
    print $ foldl_use_foldr (||) False [False, False, True] -- Expected output: True