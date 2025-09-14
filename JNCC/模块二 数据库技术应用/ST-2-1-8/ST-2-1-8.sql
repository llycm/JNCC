# 任务1：创建数据库
drop database if exists student;
create database student;
use student;

# 任务2：创建数据表及约束
-- 创建学生表 t_student
create table t_student
(
    student_id   char(10)          not null comment '学号',
    student_name varchar(100)      not null comment '姓名',
    sex          enum ('男', '女') not null comment '性别',
    birth        datetime          not null comment '出生日期',
    entry_date   datetime          not null comment '入学年份',
    primary key (student_id)
) comment '学生表';

-- 创建课程表 t_course
create table t_course
(
    course_id   char(8)        not null comment '课程编号',
    course_name varchar(100)   not null comment '课程名称',
    credit      tinyint        not null comment '学分',
    class_hour  decimal(10, 1) not null comment '课时',
    primary key (course_id),
    check ( credit between 1 and 10)
) comment '课程表';

-- 创建成绩表 t_score
create table t_score
(
    student_id char(10) not null comment '学号',
    course_id  char(8)  not null comment '课程编号',
    score      tinyint  not null comment '成绩',
    primary key (student_id, course_id),
    foreign key (student_id) references t_student (student_id),
    foreign key (course_id) references t_course (course_id),
    check ( score between 0 and 100)
) comment '成绩表';

# 任务3：数据库操作
-- 插入学生表数据
insert into t_student (student_id, student_name, sex, birth, entry_date)
values ('s00008', '张三', '男', '1990-1-1', '2018-9-1'),
       ('s00009', '李四', '女', '1995-12-31', '2023-9-1'),
       ('s00010', '王五', '男', '2000-3-1', '2018-9-1'),
       ('s00011', '赵六', '女', '2000-4-1', '2018-9-1'),
       ('s00012', '钱七', '男', '2000-5-1', '2018-9-1');

-- 插入课程表数据
insert into t_course (course_id, course_name, credit, class_hour)
values ('1', '数据结构', 3, 48.0),
       ('2', 'java 程序设计', 4, 64.0),
       ('3', 'C#', 3, 48.0),
       ('4', 'Python', 2, 32.0);

-- 插入成绩表数据
insert into t_score (student_id, course_id, score)
values ('s00008', '1', 85),
       ('s00008', '2', 90),
       ('s00008', '3', 78),
       ('s00009', '1', 88),
       ('s00009', '2', 92),
       ('s00010', '2', 75),
       ('s00010', '3', 80),
       ('s00011', '1', 95),
       ('s00011', '4', 89),
       ('s00012', '3', 70),
       ('s00012', '4', 60);

-- （2）查询出生年份在 1990 年-1995 年的所有学生信息。
select *
from t_student
where year(birth) between 1990 and 1995;

-- （3）查询所有学生的课程成绩，包括学号、姓名、课程名称、成绩。
select s.student_id,
       s.student_name,
       c.course_name,
       sc.score
from t_student s
         join t_score sc on s.student_id = sc.student_id
         join t_course c on sc.course_id = c.course_id;

-- （4）删除学号为“s00008”的学生的所有成绩。
delete
from t_score
where student_id = 's00008';

-- (4) 查询删除后的成绩表.
select s.student_id,
       s.student_name,
       c.course_name,
       sc.score
from t_student s
         join t_score sc on s.student_id = sc.student_id
         join t_course c on sc.course_id = c.course_id;

-- （5）创建视图查询选修了“java 程序设计”的学生姓名、成绩。
drop view if exists v_java_students;
create view v_java_students as
select s.student_name as '姓名',
       sc.score       as '成绩'
from t_student s
         join t_score sc on s.student_id = sc.student_id
         join t_course c on sc.course_id = c.course_id
where c.course_name = 'java 程序设计';

-- (5) 查询视图.
select *
from v_java_students;

# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces student > "d:/projects/idea/jncc/mysql/st-2-1-8/student_back.sql"