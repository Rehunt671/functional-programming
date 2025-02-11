eitherJoin :: Either r (Either r a) -> Either r a
eitherJoin (Right (Right x)) = Right x
eitherJoin (Right (Left r))  = Left r
eitherJoin (Left r)          = Left r
