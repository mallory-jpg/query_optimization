USE springboardopt;

-- -------------------------------------
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.
-- CREATE INDEX deptId ON Course(deptId);
SELECT Student.name
FROM Student, Transcript, Course
FORCE INDEX (deptId)
WHERE Transcript.crsCode=Course.crsCode
AND Student.id=Transcript.studId 
AND Course.deptId=@v6 
AND NOT Course.deptId=@v7;
