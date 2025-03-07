pairBimap :: (a -> c) -> (b -> d) -> (a, b) -> (c, d)
pairBimap f g (x, y) = (f x, g y)


Prove
Identity Law
จาก
pairBimap id id (x, y) = (id x, id y)
                        = (x, y)
จะได้ เนื่องจาก apply id to pair 
id (x, y) = (x, y)

ดังนั้น
pairBimap id id = id


Composition Law
 pairBimap (f . g) (h . i) = pairBimap f h . pairBimap g i

 ต้้อง show ว่า
 pairBimap (f . g) (h . i) (x, y) = ((f . g) x, (h . i) y)
                                    = (f (g x), h (i y))

 apply pairBimap เข้าไปจะได้
 (pairBimap f h . pairBimap g i) (x, y)
    = pairBimap f h (pairBimap g i (x, y))
    = pairBimap f h (g x, i y)
    = (f (g x), h (i y))

 จะได้
 pairBimap (f . g) (h . i) (x, y) = (f (g x), h (i y)) = (pairBimap f h . pairBimap g i) (x, y)

 ดังนั้น 
 pairBimap (f . g) (h . i) = pairBimap f h . pairBimap g i เป็นจริง
