# 试题 2-2：数据库设计与操作

# 任务 1：创建数据库
drop database if exists customercredit;
create database customercredit;
use customercredit;

# 任务 2：创建数据表及约束
-- 创建客户基本信息表 t_customer_info
create table if not exists t_customer_info
(
    cust_id     int         not null auto_increment comment '客户编号',
    cust_name   varchar(50) not null comment '客户名称',
    legal_name  varchar(10) not null comment '法人代表',
    reg_address varchar(60) not null comment '注册地址',
    post_code   char(6)     not null comment '邮政编码',
    primary key (cust_id),
    CONSTRAINT chk_post_code CHECK (post_code REGEXP '^[0-9]{6}$')
) comment '客户基本信息表';

-- 创建客户信用等级表 t_cust_credit_level
create table if not exists t_cust_credit_level
(
    cust_id      int      not null comment '客户编号',
    credit_level tinyint  not null comment '信用级别',
    begin_date   datetime not null comment '评级有效起始日期',
    end_date     datetime not null comment '评级有效终止日期',
    primary key (cust_id),
    constraint fk_cust_id foreign key (cust_id) references t_customer_info (cust_id)
) comment '客户信用等级表';

-- 创建客户信用等级历史表 t_his_cust_credit_level
create table if not exists t_his_cust_credit_level
(
    id           int      not null auto_increment comment '序号',
    cust_id      int      not null comment '客户编号',
    credit_level tinyint  not null comment '信用级别',
    begin_date   datetime not null comment '评级有效起始日期',
    end_date     datetime not null comment '评级有效终止日期',
    primary key (id),
    constraint fk_his_cust_id foreign key (cust_id) references t_customer_info (cust_id)
) comment '客户信用等级历史表';

# 任务 3：数据库操作
-- (1) 插入测试数据
-- 向 t_customer_info 表插入3条数据
insert into t_customer_info (cust_name, legal_name, reg_address, post_code)
values ('母公司', '张三', '北京市朝阳区', '100000'),
       ('子公司', '李四', '上海市浦东新区', '200000'),
       ('个人营业者', '王五', '广州市天河区', '510000');

-- 向 t_cust_credit_level 表插入3条数据
insert into t_cust_credit_level (cust_id, credit_level, begin_date, end_date)
values (1, 5, '2023-01-01', '2023-12-31'),
       (2, 4, '2023-02-01', '2024-01-31'),
       (3, 3, '2023-03-01', '2024-02-28');

-- 向 t_his_cust_credit_level 表插入3条数据
insert into t_his_cust_credit_level (cust_id, credit_level, begin_date, end_date)
values (1, 4, '2022-01-01', '2022-12-31'),
       (2, 3, '2022-02-01', '2023-01-31'),
       (3, 2, '2022-03-01', '2023-02-28');

-- (2) 查询客户名称为“xx 公司”的信用等级
select tci.cust_name,
       tcl.credit_level,
       tcl.begin_date,
       tcl.end_date
from t_customer_info tci
         join
     t_cust_credit_level tcl on tci.cust_id = tcl.cust_id
where tci.cust_name like '%公司';

-- (3) 创建视图 v_his_cust_credit_level
create view v_his_cust_credit_level as
select tci.cust_name     as '客户名称',
       thcl.credit_level as '信用级别',
       thcl.begin_date   as '评级有效起始日期',
       thcl.end_date     as '评级有效中止日期'
from t_his_cust_credit_level thcl
         join
     t_customer_info tci on thcl.cust_id = tci.cust_id;

-- (3) 查询视图
select *
from v_his_cust_credit_level;

-- (4) 查询法人代表名为“张三”的信用级别
select tci.legal_name,
       tcl.credit_level
from t_customer_info tci
         join
     t_cust_credit_level tcl on tci.cust_id = tcl.cust_id
where tci.legal_name = '张三';

-- (5) 创建带输入参数的存储过程 p_cust_credit_level创建带输入参数的存储过程 P_cust_credit_level，
-- 根据输入参数更新客户信用等级表，并将更新前的记录插入到客户信用等级历史表。
delimiter //
create procedure p_cust_credit_level(
    in p_cust_id int,
    in p_credit_level tinyint,
    in p_begin_date datetime,
    in p_end_date datetime
)
begin
    -- 将更新前的记录插入到历史表
    insert into t_his_cust_credit_level (cust_id, credit_level, begin_date, end_date)
    select cust_id, credit_level, begin_date, end_date
    from t_cust_credit_level
    where cust_id = p_cust_id;

    -- 更新客户信用等级表
    update t_cust_credit_level
    set credit_level = p_credit_level,
        begin_date   = p_begin_date,
        end_date     = p_end_date
    where cust_id = p_cust_id;
end //
delimiter ;

-- 调用存储过程
call p_cust_credit_level(1, 6, '2024-01-01', '2024-12-31');

# 任务 4：数据库备份
# mysqldump -u root -p --no-tablespaces customercredit > "D:/Projects/Idea/JNCC/mysql/ST-2-1-6/customercredit_back.sql"