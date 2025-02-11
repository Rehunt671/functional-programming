maybeJoin :: Maybe (Maybe a) -> Maybe a
maybeJoin (Just (Just x)) = Just x
maybeJoin (Just Nothing)  = Nothing
maybeJoin Nothing         = Nothing
