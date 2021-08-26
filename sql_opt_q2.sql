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

-- 2. List the names of students with id in the range of v2 (id) to v3 (inclusive).

ALTER TABLE Student
ADD PRIMARY KEY(id);

EXPLAIN ANALYZE
SELECT name FROM Student WHERE id BETWEEN @v2 AND @v3;

-- Reasoning: 
-- MySQL is row-oriented so using WHERE is preferable
-- BETWEEN keyword is inclusive
-- added a primary key to implement index scan