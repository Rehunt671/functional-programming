join :: ([a], [a]) -> [a]
join ([], ys) = ys
join (x:xs, ys) = x : join (xs, ys)

rev [] = []
rev (x:xs) = join (rev xs, [x])



-- how long does join take?
-- given n is size of list 1 , m is size of list 2 
--  เกิดจาก จำนวน function call ที่เกิดจากนำ ตัวหน้าสุด list 1 มาไว้หน้าสุดของ list ใหม่ถูกเรียกเป็นจำนวน n รอบ 
-- และ + เพิ่มอีก m รอบเนื่องจากต้อง copy list 2 จำนวน m element มาต่อ array ใหม่ตอน base case ดังนั้น time complexity ของ join = O(n + m)



-- how long does your rev take to compute the reverse of a list
-- เกิดจาก จำนวน function call rev ที่เกิดจากการนำ ตัวหน้าสุดมาทำเป็น list ไว้ แล้วมาไว้หลังสุดของ list ตัวใหม่ถูกเรียกเป็นจำนวน n ครั้ง
--โดยแต่ละครั้งที่ rev ถูกเรียก join จะถูกเรียกด้วยและ join จะมี time complexity เป็น O(n)(ได้จากข้อที่ 1)  ดังนั้น time complexity ของ rev = O(n^2) 


-- are you satisfied with the running time?
-- ไม่พอใจเท่าไหร่
-- if not, what would you like to do to improve the efficiency?
-- เนื่องจากคิดว่า join ถูกเรียกเยอะเกินไปเราสามารถ join n listโดยสมาชิกแต่ละ list มีเพียง 1 ตัว ตอนท้ายได้ไหมนะ