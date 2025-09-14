# 任务1：创建数据库
drop database if exists educationmanage;
create database educationmanage;
use educationmanage;

# 任务2：创建数据表及约束
-- 创建员工表 t_employee
create table t_employee
(
    emp_no       int         not null auto_increment comment '员工编号',
    emp_name     varchar(10) not null comment '姓名',
    id_card      varchar(20) not null comment '身份证号',
    emp_age      int         not null comment '年龄',
    emp_birthday datetime    not null comment '出生日期',
    primary key (emp_no),
    unique (id_card)
) comment '员工表';

-- 创建学历表 t_education
create table t_education
(
    id               int         not null auto_increment comment '序号',
    emp_no           int         not null comment '员工编号',
    degree           varchar(10) not null comment '学历',
    major            varchar(40) not null comment '专业',
    register_time    datetime    not null comment '入学时间',
    length_schooling tinyint     not null comment '学制',
    primary key (id),
    foreign key (emp_no) references t_employee (emp_no) on delete cascade on update cascade
) comment '学历表';

# 任务3：数据库操作
-- 插入测试数据
-- 插入员工数据
insert into t_employee (emp_name, id_card, emp_age, emp_birthday)
values ('张三', '123456199001011234', 34, '1990-01-01'),
       ('李四', '123456199102021235', 33, '1991-02-02'),
       ('王五', '123456199203031236', 32, '1992-03-03'),
       ('张老头', '123456920303123619', 61, '1992-03-03');

-- 插入学历数据
insert into t_education (emp_no, degree, major, register_time, length_schooling)
values (1, '大学本科', '计算机科学', '2010-09-01', 4),
       (2, '硕士', '软件工程', '2014-09-01', 3),
       (1, '硕士', '数据科学', '2018-09-01', 2),
       (3, '大专', '计算机软件', '2023-05-01', 3),
       (4, '博士', '软件工程', '2000-01-01', 2),
       (4, '大学本科', '软件工程', '1990-01-01', 2);

-- （2）查询姓名为“张三”所有学历
select e.emp_name, ed.degree, ed.major, ed.register_time, ed.length_schooling
from t_employee e
         join t_education ed on e.emp_no = ed.emp_no
where e.emp_name = '张三';

-- （3）更新 t_employee 表，将所有“张”姓人员变成“王”姓人员
update t_employee
set emp_name = concat('王', substring(emp_name, 2))
where emp_name like '张%';

-- （4）查询出拥有“大学本科”学历的所有人员姓名
select e.emp_name
from t_employee e
         join t_education ed on e.emp_no = ed.emp_no
where ed.degree = '大学本科';

-- （5）删除年龄大于60的员工信息
delete
from t_employee
where emp_age > 60;

# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces educationmanage > "d:/projects/idea/jncc/mysql/st-2-1-4/educationmanage_back.sql"