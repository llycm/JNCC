# 任务1：创建数据库
drop database if exists factory;
create database factory;
use factory;

# 任务2：创建数据表及约束
-- 创建工厂表 t_factory
create table t_factory
(
    factory_id      int          not null auto_increment comment '工厂编号',
    factory_name    varchar(50)  not null comment '工厂名称',
    factory_address varchar(100) not null comment '地址',
    primary key (factory_id)
) comment '工厂表';

-- 创建职工表 t_worker
create table t_worker
(
    worker_id   int            not null auto_increment comment '职工编号',
    worker_name varchar(100)   not null comment '姓名',
    level       tinyint                 default 10 comment '技术等级',
    salary      decimal(10, 1) not null comment '工资',
    employ_date datetime       not null default current_timestamp comment '聘期',
    factory_id  int            not null comment '工厂编号',
    primary key (worker_id),
    foreign key (factory_id) references t_factory (factory_id)
) comment '职工表';

-- 创建产品表 t_product
create table t_product
(
    product_id   int         not null auto_increment comment '产品编号',
    product_name varchar(50) not null comment '产品名称',
    product_spec int         not null comment '产品规格',
    primary key (product_id)
) comment '产品表';

-- 创建生产表 t_produce
create table t_produce
(
    factory_id   int      not null comment '工厂编号',
    product_id   int      not null comment '产品编号',
    produce_date datetime not null default current_timestamp comment '生产日期',
    primary key (factory_id, product_id),
    foreign key (factory_id) references t_factory (factory_id),
    foreign key (product_id) references t_product (product_id)
) comment '生产表';

# 任务3：数据库操作
-- 插入工厂表数据
insert into t_factory (factory_name, factory_address)
values ('一厂', '北京市朝阳区'),
       ('二厂', '上海市浦东新区'),
       ('三厂', '广州市天河区');

-- 插入职工表数据
insert into t_worker (worker_name, level, salary, employ_date, factory_id)
values ('张三', 10, 5000.0, '2020-1-1', 1),
       ('李四', 10, 6000.0, '2020-12-1', 2),
       ('王五', 20, 7000.0, '2018-3-1', 1),
       ('赵六', 20, 8000.0, '2020-12-31', 1),
       ('钱七', 30, 5100.0, '2020-1-1', 2),
       ('孙八', 40, 4000.0, '2016-9-1', 3),
       ('周九', 50, 3000.0, '2019-5-1', 1);

-- 插入产品表数据
insert into t_product (product_name, product_spec)
values ('产品a', 100),
       ('产品b', 200),
       ('产品c', 300),
       ('产品d', 400),
       ('产品e', 500);

-- 插入生产表数据
insert into t_produce (factory_id, product_id, produce_date)
values (1, 1, '2021-1-1'),
       (1, 2, '2021-2-1'),
       (2, 3, '2021-3-1'),
       (2, 4, '2021-4-1'),
       (3, 1, '2021-5-1'),
       (3, 2, '2021-6-1'),
       (3, 3, '2021-6-1'),
       (3, 4, '2021-6-1'),
       (3, 5, '2021-6-1');

-- （2）查询工资在 5000 以上且聘期为 2020 年 12 月的职工编号、职工姓名、技术等级、工厂名称。
select worker_id, worker_name, level, factory_name, employ_date
from t_worker w
         join t_factory f on w.factory_id = f.factory_id
where salary > 5000
  and date_format(employ_date, '%Y-%m') = '2020-12';

-- （3）查询产品的生产信息，包括工厂名称、产品名称、产品规格、生产日期。
select factory_name, product_name, product_spec, produce_date
from t_product p
         join t_produce pr on p.product_id = pr.product_id
         join t_factory f on pr.factory_id = f.factory_id;

-- （4）创建视图，统计生产产品总数量在 1000 以上的工厂编号、工厂名称、地址。
-- 根据生产表的记录统计数量total，修改规模条件为3
drop view if exists v_factory_produce;
create view v_factory_produce as
select f.factory_id      as '工厂编号',
       f.factory_name    as '工厂名称',
       f.factory_address as '地址'
from t_factory f
         join
     t_produce pr on f.factory_id = pr.factory_id
group by f.factory_id, f.factory_name, f.factory_address
having count(*) > 3;

-- （4）查询视图。
select *
from v_factory_produce;

-- （5）创建存储过程，统计每个工厂，各技术等级的职工数量。
drop procedure if exists proc_factory_worker_count;
delimiter //
create procedure proc_factory_worker_count()
begin
    select f.factory_id   as '工厂编号',
           f.factory_name as '工厂名称',
           w.level        as '技术等级',
           count(*)       as '职工数量'
    from t_factory f
             join t_worker w on f.factory_id = w.factory_id
    group by f.factory_id, f.factory_name, w.level;
end //
delimiter ;

-- （5）执行存储过程
call proc_factory_worker_count();
# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces factory > "d:/projects/idea/jncc/mysql/st-2-1-7/factory_back.sql"