maybeAp :: Maybe (a -> b) -> Maybe a -> Maybe b
maybeAp Nothing _ = Nothing
maybeAp (Just f) mx = fmap f mx
