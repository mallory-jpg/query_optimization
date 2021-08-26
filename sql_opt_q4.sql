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

-- 4. List the names of students who have taken a course taught by professor v5 (name).

EXPLAIN ANALYZE
SELECT Student.name
FROM Student, Transcript, Teaching, Professor
WHERE Transcript.crsCode=Teaching.crsCode 
	AND Student.id=Transcript.studId
	AND Teaching.profID=Professor.ID
	AND Professor.name=@v5;

-- Reasoning: 
-- single row index lookup on Student primary key and filter on professor name were never executed originally
-- implemented WHERE filters to limit the number of records