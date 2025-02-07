

-- what is it for?
-- ไว้ใช้สำหรับประกาศว่าค่านั้นๆสามารถ Compare ได้
-- how many constructors are there?
-- 3 constructor ได้แก่ LT   (less than) | EQ  (equal) | GT  (greater than)
-- how many ways can we pattern-match an Ordering value?
-- เนื่องจากมี ได้ 3 constructor เราสามารถมี pattern matching ได้ 3 ทาง


describeOrdering :: Ordering -> String
describeOrdering LT = "Less than"
describeOrdering EQ = "Equal"
describeOrdering GT = "Greater than"
