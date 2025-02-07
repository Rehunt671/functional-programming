

getEvenCombinationFromTwoList = filter (even . uncurry (+)) (concatMap (\x -> map (x,) [1, 2, 4]) [2, 3, 5])


--Step
-- concatMap (\x -> map (x,) [1, 2, 4]) [2, 3, 5]
-- Result: [(2, 1), (2, 2), (2, 4), (3, 1), (3, 2), (3, 4), (5, 1), (5, 2), (5, 4)]

-- filter (even . uncurry (+))
-- filter จะถูกทำงานโดย loop ไปตาม list ว่า tuple ไหนเข้าเงื่อนไข function ของเรา
--    จาก Composition จะเห็นว่าเราทำ uncurry ของ function (+) จาก (+ x y) จะกลายเป็นฟังชั่นที่รับ (x,y) -> ผลบวก  ก่อน
--    จากนั้นเราจะมาทำ even ต่อหลังจาก unccurry จะเป็นการเช็คผลลัพธ์ของ unccurry ว่าผลบวกนั้นๆ เป็นเลขคู่ไหม
-- Result:จะได้ list ที่ผลบวกของ tuples ทุก combination ระหว่าง list [1, 2, 4] และ [2, 3, 5] ที่เป็นเลขคู่