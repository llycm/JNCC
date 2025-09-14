-- 任务1：创建数据库
drop database if exists estatemanagement;
create database estatemanagement;
use estatemanagement;

-- 任务2：创建数据表及约束
-- 创建市民表 t_citizen
create table t_citizen
(
    id      int         not null auto_increment comment '编号',
    id_card varchar(18) not null comment '身份证',
    name    varchar(20) not null comment '姓名',
    address varchar(100) comment '住址',
    primary key (id),
    unique (id_card)
) comment '市民表';

-- 创建小区表 t_community
create table t_community
(
    id      int         not null auto_increment comment '编号',
    name    varchar(20) not null comment '小区名称',
    address varchar(100) comment '小区地址',
    primary key (id)
) comment '小区表';

-- 创建房产表 t_estate
create table t_estate
(
    id              int            not null auto_increment comment '编号',
    house_number    varchar(10)    not null comment '房号',
    building_number varchar(10)    not null comment '栋号',
    value           decimal(10, 2) not null comment '市值',
    citizen_id      int            not null comment '房产所属市民id',
    community_id    int            not null comment '房产所在小区id',
    primary key (id),
    foreign key (citizen_id) references t_citizen (id),
    foreign key (community_id) references t_community (id),
    check (value > 0)
) comment '房产表';

-- 任务3：数据库操作
-- (1) 插入测试数据
insert into t_citizen (id_card, name, address)
values ('110101199001011234', '张三', '北京市朝阳区'),
       ('110102199202022345', '李四', '北京市海淀区'),
       ('110103198503033456', '王五', '北京市丰台区');

insert into t_community (name, address)
values ('阳光小区', '朝阳区阳光路1号'),
       ('明月小区', '海淀区明月街10号'),
       ('星辰小区', '丰台区星辰大道20号');

insert into t_estate (house_number, building_number, value, citizen_id, community_id)
values ('101', 'a栋', 2500000.00, 1, 1),
       ('202', 'b栋', 1800000.00, 1, 1),
       ('303', 'c栋', 3200000.00, 2, 2),
       ('404', 'd栋', 4000000.00, 3, 3);

-- (2) 查询某市民下所有房产信息（包括小区名称、栋号、房号、市值、地址）
select c.name as citizen_name, e.building_number, e.house_number, e.value, com.name as community_name, com.address
from t_estate e
         join t_citizen c on e.citizen_id = c.id
         join t_community com on e.community_id = com.id
where c.name = '张三';

-- (3) 查询某市民下所有房产信息市值总和
select c.name as citizen_name, sum(e.value) as total_value
from t_estate e
         join t_citizen c on e.citizen_id = c.id
where c.name = '张三'
group by c.name;

-- (4) 查询小区名包含“阳光”且市值超过200万的房产信息（包括小区名称、栋号、房号、市值）
select com.name as community_name, e.building_number, e.house_number, e.value
from t_estate e
         join t_community com on e.community_id = com.id
where com.name like '%阳光%'
  and e.value > 2000000;

-- (5) 删除市民“张三”的所有房产
delete
from t_estate
where citizen_id = (select id from t_citizen where name = '张三');

-- (5) 查询
select c.name as citizen_name, sum(e.value) as total_value
from t_estate e
         join t_citizen c on e.citizen_id = c.id
where c.name = '张三'
group by c.name;

# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces estatemanagement > "d:/projects/idea/jncc/mysql/st-2-1-11/estatemanagement_back.sql"