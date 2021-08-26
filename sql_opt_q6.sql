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

-- 6. List the names of students who have taken all courses offered by department v8 (deptId).
ALTER TABLE `Course` ADD INDEX `course_idx_deptid_crscode` (`deptId`,`crsCode`);
ALTER TABLE `Transcript` ADD INDEX `transcript_idx_studid_crscode` (`studId`,`crsCode`);

SELECT Student.name 
FROM Student, Transcript, Course 
WHERE Transcript.studId = Student.id 
	AND Transcript.crsCode = Course.crsCode 
	AND Course.deptId = @v8 
GROUP BY Transcript.crsCode 
ORDER BY NULL

-- Order by Null suppresses overhead from sorting when using groupby 
-- deactivate sql_mode=only_full_group_by to be able to group by transcript.crsCode