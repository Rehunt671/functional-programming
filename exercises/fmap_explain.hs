-- explain what fmap (*3) (+100) is
-- fmap (*3) (+100) เป็น expression โดย fmap เป็น Functor ซึ่งจากที่ได้เรียนใน Class 
-- function fmap นั้นจะทำการรับ function 2 function แล้วนำ 2 function นั้นมา Composition กันในที่นี้คือ (*3.(+100)) จากนั้นเราจะได้ function ที่นำไปใช้กับ input ได้


-- อธิบายให้ major อื่นฟังง่ายๆคือ expression นี้จะรับ input อีกตัวนึงซึ่งจะนำไปเข้าเรียงจากขวาไปซ้าย +100 => *3