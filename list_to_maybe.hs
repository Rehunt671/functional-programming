listToMaybe :: [a] -> Maybe a
listToMaybe []    = Nothing
listToMaybe (x:_) = Just x


ต้องการรู้ว่า
fmap f . listToMaybe = listToMaybe . fmap f


Left-hand side:
fmap f (listToMaybe xs) = fmap f (case xs of
                                    []    -> Nothing
                                    (x:_) -> Just x)

Result:
สำหรับ empty xs return Nothing
fmap f (listToMaybe xs) = case xs of
                           []    -> Nothing
                           (x:_) -> Just (f x)

Right-hand side:
listToMaybe (fmap f xs) = case fmap f xs of
                           []    -> Nothing
                           (x:_) -> Just x
Result:
สำหรับ empty xs return Nothing
สำหรับ non empty xs return Just(f x)
listToMaybe (fmap f xs) = case xs of
                           []    -> Nothing
                           (x:_) -> Just (f x)

Left = Right
ดังนั้น fmap f . listToMaybe = listToMaybe . fmap f และ fmap f . listToMaybe = listToMaybe . fmap f เป็นจริง