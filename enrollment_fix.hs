type CourseID = Int
type Capacity = Int
type StudentID = Int
data CourseInfo' = Course'
  { cid :: CourseID
  , cap :: Capacity
  , roster :: [StudentID]
  } deriving (Show)

enroll :: CourseInfo' -> StudentID -> Either String CourseInfo'
enroll c sid
  | sid `elem` rs = Left "student already registered"
  | length rs >= seats = Left "course full"
  | otherwise = Right $ Course' (cid c) seats (sid:rs)
  where
    seats = cap c
    rs = roster c

register :: [CourseInfo'] -> CourseID -> StudentID -> Either String [CourseInfo']
register [] _ _ = Left "no such course"
register (c : cs) cid' sid
  | cid c == cid' =
      case enroll c sid of
        Left msg -> Left msg
        Right c' -> Right (c' : cs)  
  | otherwise = do    --  บัคที่เจอคือ กรณีที่ course ที่เราวนลูปหาอยู่ยังไม่ใช่ course ที่นักศึกษาลงทะเบียนfunction นี้จะไม่ return course นั้นออกมาด้วย ดังนั้นเลยต้องให้กรณีนี้เก็บ course ที่นักศึกษาไม่ได้ลงทะเบียนไว้ด้วย สำหรับ return course ทั้งหมดที่มีออกไป
      updatedCourses <- register cs cid' sid
      return (c : updatedCourses) 

course1 = Course' 101 2 [1, 2]  -- Course 101 with capacity 2, and students 1 and 2 enrolled
course2 = Course' 102 3 [3]     -- Course 102 with capacity 3, and student 3 enrolled
courses = [course1, course2 ]

test1 = register courses 101 3
-- Expected Output: Left "course full" (because course 101 is full)

test2 = register courses 102 4
-- Expected Output: Right [Course' 101 2 [1,2], Course' 102 3 [3, 4]]

test3 = register courses 101 1
-- Expected Output: Left "student already registered" (because student 1 is already enrolled in course 101)

test4 = register courses 999 4
-- Expected Output: Left "no such course" (because course 999 doesn't exist in the course list)

main :: IO ()
main = do
  print test1
  print test2
  print test3
  print test4

