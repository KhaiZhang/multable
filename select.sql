# 1.查询同时存在1课程和2课程的情况
	SELECT s1.studentId,s1.courseId,s2.courseId 
	FROM student_course s1,student_course s2
	WHERE s1.studentId=s2.studentId AND s1.courseId='1' AND s2.courseId='2';
# 2.查询同时存在1课程和2课程的情况
	SELECT s1.studentId,s1.courseId,s2.courseId
	FROM student_course s1,student_course s2
	WHERE s1.studentId=s2.studentId AND s1.courseId='1' AND s2.courseId='2';
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
	SELECT id,NAME,AVG(score) AS avgscore
	FROM  student INNER JOIN student_course ON student.id=student_course.studentId
	GROUP BY id,NAME
	HAVING AVG(score)>60;
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
	SELECT *
	FROM  student
	WHERE id NOT IN(SELECT studentId FROM student_course)
# 5.查询所有有成绩的SQL
	SELECT *
	FROM  student
	WHERE id IN(SELECT studentId FROM student_course)
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
	SELECT *
	FROM student
	WHERE id IN(SELECT s1.studentId
	FROM student_course s1,student_course s2
	WHERE s1.studentId=s2.studentId AND s1.courseId='1' AND s2.courseId='2')
# 7.检索1课程分数小于60，按分数降序排列的学生信息
	SELECT *
	FROM student INNER JOIN student_course ON id=studentId
	WHERE courseId='1' AND score<60
	ORDER BY score DESC;
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
	SELECT courseId,AVG(score) AS score_avg
	FROM student_course
	GROUP BY courseId
	ORDER BY score_avg DESC,courseId ASC;
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
	SELECT NAME ,score
	FROM student INNER JOIN student_course ON id=studentId
	WHERE courseId IN(SELECT id FROM course WHERE NAME='数学') AND score<60;