-- 任务1：创建数据库
drop database if exists car;
create database car;
use car;

-- 任务2：创建数据表及约束
-- 创建车队表 t_team
create table t_team
(
    team_id   int not null auto_increment comment '车队号',
    team_name varchar(50) comment '车队名',
    primary key (team_id)
) comment '车队表';

-- 创建司机表 t_driver
create table t_driver
(
    driver_id   int         not null auto_increment comment '司机编号',
    driver_name varchar(20) not null comment '姓名',
    phone       varchar(20) comment '电话',
    team_id     int         not null comment '车队号',
    primary key (driver_id),
    foreign key (team_id) references t_team (team_id)
) comment '司机表';

-- 创建车辆表 t_car
create table t_car
(
    car_id        char(8) not null comment '车牌号',
    producer_name varchar(50) comment '厂家',
    out_date      datetime comment '出厂日期',
    primary key (car_id)
) comment '车辆表';

-- 创建使用记录表 t_using
create table t_using
(
    driver_id  int      not null comment '司机编号',
    car_id     char(8)  not null comment '车牌号',
    using_date datetime not null comment '使用日期',
    kilometre  decimal(10, 1) comment '公里数',
    primary key (driver_id, car_id, using_date),
    foreign key (driver_id) references t_driver (driver_id),
    foreign key (car_id) references t_car (car_id)
) comment '使用记录表';

-- 任务3：数据库操作
-- (1) 插入测试数据
insert into t_team (team_name)
values ('车队1'),
       ('车队2'),
       ('车队3'),
       ('车队4');
insert into t_team
values (8, '车队8');

insert into t_driver (driver_name, phone, team_id)
values ('张明', '1234567890', 1),
       ('李芳', '0987654321', 2),
       ('王强', '1357924680', 3),
       ('赵丽', '2468135790', 4);

insert into t_car (car_id, producer_name, out_date)
values ('京a12345', '厂家a', '2020-01-01'),
       ('京b67890', '厂家b', '2019-05-15'),
       ('京c24680', '厂家c', '2021-03-20'),
       ('京d13579', '厂家d', '2018-11-30');

insert into t_using (driver_id, car_id, using_date, kilometre)
values (1, '京a12345', '2020-01-10', 150.5),
       (1, '京b67890', '2020-12-31', 200.0),
       (2, '京c24680', '2023-03-20', 100.2),
       (3, '京d13579', '2023-04-25', 300.7);

-- (2) 查询用户张明的车辆信息、使用日期和公里数
select c.car_id, u.using_date, u.kilometre
from t_using u
         join t_driver d on u.driver_id = d.driver_id
         join t_car c on u.car_id = c.car_id
where d.driver_name = '张明';

-- (3) 修改司机张明的车队号为8号车队
update t_driver
set team_id = 8
where driver_name = '张明';

-- (3) 查看
select *
from t_driver
where driver_name = '张明';

-- (4) 查询张明在2020年1月到12月使用的车辆信息
select c.car_id, u.using_date, u.kilometre
from t_using u
         join t_driver d on u.driver_id = d.driver_id
         join t_car c on u.car_id = c.car_id
where d.driver_name = '张明'
  and year(u.using_date) = 2020
  and month(u.using_date) between 1 and 12;

-- (5) 创建视图查询公里数超过100的司机信息
create view high_kilometre_drivers as
select d.driver_name, d.phone, t.team_name, u.kilometre
from t_using u
         join t_driver d on u.driver_id = d.driver_id
         join t_team t on d.team_id = t.team_id
where u.kilometre > 100;

-- (5)查询视图
select *
from high_kilometre_drivers;

# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces car > "d:/projects/idea/jncc/mysql/st-2-1-10/car_back.sql"