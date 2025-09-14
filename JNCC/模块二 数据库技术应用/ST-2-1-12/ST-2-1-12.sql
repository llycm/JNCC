-- 任务1：创建数据库
drop database if exists employeesalarymanagement;
create database employeesalarymanagement;
use employeesalarymanagement;

-- 任务2：创建数据表及约束
-- 创建部门表 t_department
create table t_department
(
    id          int         not null auto_increment comment '编号',
    dept_name   varchar(20) not null comment '名称',
    description varchar(100) default null comment '描述',
    manager_id  int comment '部门经理id',
    primary key (id)
) comment '部门表';

-- 创建雇员表 t_employee
create table t_employee
(
    id      int         not null auto_increment comment '编号',
    name    varchar(10) not null comment '姓名',
    level   int         not null comment '级别',
    dept_id int         not null comment '所属部门id',
    primary key (id),
    check (level between 1 and 15)
) comment '雇员表';

-- 创建薪水表 t_salary
create table t_salary
(
    id                 int            not null auto_increment comment '编号',
    basic_salary       decimal(10, 1) not null comment '基本工资',
    performance_salary decimal(10, 1) not null comment '绩效工资',
    salary_date        datetime       not null comment '计薪日期',
    employee_id        int            not null comment '薪酬所属雇员id',
    primary key (id),
    check (basic_salary > 0),
    foreign key (employee_id) references t_employee (id) on delete cascade
) comment '薪水表';

-- 添加外键约束到部门表和雇员表（根据e-r图，部门经理是雇员，所以需要补充外键）
alter table t_department
    add constraint fk_manager
        foreign key (manager_id) references t_employee (id) on delete cascade;

alter table t_employee
    add constraint fk_dept
        foreign key (dept_id) references t_department (id) on delete cascade;

-- 任务3：数据库操作
-- (1) 插入测试数据
insert into t_department (dept_name, description, manager_id)
values ('技术部', '负责技术研发', null),
       ('市场部', '负责市场推广', null),
       ('人事部', '负责人力资源管理', null);

insert into t_employee (name, level, dept_id)
values ('张三', 5, 1),
       ('李四', 7, 1),
       ('王五', 6, 2),
       ('赵六', 8, 3),
       ('钱七', 4, 3),
       ('张飞', 5, 1);

insert into t_salary (basic_salary, performance_salary, salary_date, employee_id)
values (8000.0, 2000.0, '2023-01-15', 1),
       (9000.0, 3000.0, '2023-01-15', 2),
       (7500.0, 2500.0, '2023-01-15', 3),
       (8500.0, 3500.0, '2023-01-15', 4),
       (7000.0, 2000.0, '2023-01-15', 5),
       (7000.0, 2000.0, '2023-01-15', 6);

-- (2) 查询t_employee表中的员工id、员工姓名和部门编号
select id, name, dept_id
from t_employee;

-- (3) 查询员工姓名含“张”的员工id、员工姓名和部门编号
select id, name, dept_id
from t_employee
where name like '%张%';

-- (4) 查询部门的人数和平均工资
select d.dept_name, count(e.id) as employee_count, avg(s.basic_salary + s.performance_salary) as avg_salary
from t_department d
         left join t_employee e on d.id = e.dept_id
         left join t_salary s on e.id = s.employee_id
group by d.id;

-- (5) 删除雇员“张三”的所有信息（包括薪水和部门经理关联）
DELETE
FROM t_employee
WHERE name = '张三';

-- (5) 查询
select id, name, dept_id
from t_employee
where name = '张三';

# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces employeesalarymanagement > "d:/projects/idea/jncc/mysql/st-2-1-12/employeesalarymanagement_back.sql"