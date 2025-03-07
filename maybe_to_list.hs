maybeToList :: Maybe a -> [a]
maybeToList Nothing  = []
maybeToList (Just x) = [x]




fmap f . maybeToList = maybeToList . fmap f

Left-hand side:
apply maybeToList ก่อน แล้วค่อย fmap ทีหลัง
fmap f (maybeToList x) = fmap f (case x of
                                    Nothing  -> []
                                    Just a   -> [a])

Result:
หลังจาก apply maybeToList แล้ว fmap แล้วจะได้ดังนี้
fmap f (maybeToList x) = case x of
                          Nothing -> []
                          Just a  -> [f a]

Right-hand side:
apply fmap ก่อน แล้วค่อย maybeToList ทีหลัง
maybeToList (fmap f x) = case x of
                          Nothing -> []
                          Just a  -> [f a]

Left = Right 
fmap f . maybeToList = maybeToList . fmap f เป็นจริง


