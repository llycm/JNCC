# 任务1：创建数据库
drop database if exists scoremanage;
create database scoremanage;
use scoremanage;

# 任务2：创建数据表及约束
-- 创建学生信息表 t_student_info
create table t_student_info
(
    student_no   int               not null auto_increment comment '学号',
    student_name varchar(10)       not null comment '姓名',
    sex          enum ('男', '女') not null comment '性别',
    birth        datetime          not null comment '出生年月',
    enter_date   datetime          not null comment '入学年份',
    primary key (student_no)
) comment '学生信息表';

-- 创建课程信息表 t_course_info
create table t_course_info
(
    course_no   int         not null auto_increment comment '课程编号',
    course_name varchar(10) not null comment '课程名',
    credit      tinyint     not null comment '学分',
    classhour   tinyint     not null comment '学时',
    primary key (course_no),
    check (credit >= 1 and classhour >= 1)
) comment '课程信息表';

-- 创建成绩表 t_student_score
create table t_student_score
(
    student_no      int           not null comment '学号',
    course_no       int           not null comment '课程编号',
    ordinary_scores decimal(8, 2) not null default 0 comment '平时成绩',
    end_scores      decimal(8, 2) not null default 0 comment '期末成绩',
    total_scores    decimal(8, 2) not null default 0 comment '总评成绩',
    primary key (student_no, course_no),
    foreign key (student_no) references t_student_info (student_no) on delete cascade ,
    foreign key (course_no) references t_course_info (course_no) on delete cascade
) comment '成绩表';

# 任务3：数据库操作
-- 插入测试数据
-- 插入学生信息
insert into t_student_info (student_name, sex, birth, enter_date)
values ('张三', '男', '2000-05-10', '2018-09-01'),
       ('李四', '女', '2001-03-15', '2019-09-01'),
       ('王五', '男', '2000-11-20', '2018-09-01');

-- 插入课程信息
insert into t_course_info (course_name, credit, classhour)
values ('数学', 4, 64),
       ('英语', 3, 48),
       ('计算机基础', 3, 48),
       ('数据结构', 4, 48);

-- 插入成绩数据
insert into t_student_score (student_no, course_no, ordinary_scores, end_scores, total_scores)
values (1, 1, 80.00, 85.00, 83.00),
       (1, 2, 75.00, 80.00, 77.50),
       (2, 1, 90.00, 92.00, 91.00),
       (2, 3, 88.00, 90.00, 89.00),
       (3, 2, 70.00, 75.00, 72.50),
       (3, 3, 85.00, 88.00, 86.50),
       (1, 4, 90.00, 95.00, 92.50),
       (3, 4, 95.00, 98.00, 96.50);

-- （2）查询出2000年出生的学生信息
select *
from t_student_info
where year(birth) = 2000;

-- （3）查询选修了“数据结构”的学生姓名、平时成绩、期末成绩、总评成绩
select s.student_name, c.course_name, ss.ordinary_scores, ss.end_scores, ss.total_scores
from t_student_score ss
         join t_student_info s on ss.student_no = s.student_no
         join t_course_info c on ss.course_no = c.course_no
where c.course_no in
      (select course_no
       from t_course_info
       where course_name = '数据结构');

-- （4）创建视图查询学生的学号、姓名、课程名、总评成绩
create view v_student_score_info as
select s.student_no as '学号', s.student_name as '姓名', c.course_name as '课程名', ss.total_scores  as '总评成绩'
from t_student_score ss
         join t_student_info s on ss.student_no = s.student_no
         join t_course_info c on ss.course_no = c.course_no;

-- （4）查询视图
select *
from v_student_score_info;

-- （5）删除姓名为“张三”的学生信息及相关成绩记录
delete
from t_student_info
where student_name = '张三';

# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces scoremanage > "d:/projects/idea/jncc/mysql/st-2-1-6/scoremanage_back.sql"