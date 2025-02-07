validGradeSet :: [String]
validGradeSet = ["A", "B+", "B", "C+", "C", "D+", "D", "F"]

gradeToPoint :: String -> Double
gradeToPoint grade = case grade of
    "A"  -> 4.0
    "B+" -> 3.5
    "B"  -> 3.0
    "C+" -> 2.5
    "C"  -> 2.0
    "D+" -> 1.5
    "D"  -> 1.0
    "F"  -> 0.0
    _    -> 0.0

gpa :: [String] -> Double
gpa grades =
    let validGrades = filter (`elem` validGradeSet) grades  -- Filter out invalid grades
        points = map gradeToPoint validGrades               -- Convert grades to points
    in sum points / fromIntegral (length points)
