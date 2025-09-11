# 任务1：创建数据库
drop database if exists computerstore;
create database computerstore;
use computerstore;

# 任务2：创建数据表及约束
-- 创建商品类别表 t_category
create table t_category
(
    category_id   int         not null auto_increment comment '商品类别编号',
    category_name varchar(50) not null comment '商品类别名称',
    primary key (category_id)
) comment '商品类别表';

-- 创建商品表 t_goods
create table t_goods
(
    goods_id    int           not null auto_increment comment '商品编号',
    goods_name  varchar(50)   not null comment '商品名称',
    goods_price decimal(6, 1) not null comment '单价',
    category_id int           not null comment '商品类别编号',
    primary key (goods_id),
    foreign key (category_id) references t_category (category_id),
    check (goods_price between 1 and 1000)
) comment '商品表';

-- 创建仓库表 t_store
create table t_store
(
    store_id     int         not null auto_increment comment '仓库编号',
    store_name   varchar(50) not null comment '仓库名称',
    store_leader varchar(20) not null comment '负责人',
    primary key (store_id)
) comment '仓库表';

-- 创建库存表 t_storage
create table t_storage
(
    store_id                int      not null comment '仓库编号',
    goods_id                int      not null comment '商品编号',
    store_datetime          datetime not null default current_timestamp comment '日期',
    storage_quantity        int      not null comment '库存量',
    safety_storage_quantity int      not null default 100 comment '安全库存量',
    primary key (store_id, goods_id),
    foreign key (store_id) references t_store (store_id),
    foreign key (goods_id) references t_goods (goods_id)
) comment '库存表';

# 任务 3：数据库操作
-- 插入商品类别数据
insert into t_category (category_name)
values ('电子产品'),
       ('办公用品'),
       ('生活用品');

-- 插入商品数据（修正价格以满足 check 约束）
insert into t_goods (goods_name, goods_price, category_id)
values ('笔记本电脑', 500.0, 1),
       ('打印机', 150.0, 1),
       ('笔记本', 10.0, 2),
       ('纸巾', 5.0, 3);

-- 插入仓库数据
insert into t_store (store_name, store_leader)
values ('一号仓库', '张三'),
       ('二号仓库', '李四');

-- 插入库存数据
insert into t_storage (store_id, goods_id, storage_quantity, store_datetime)
values (1, 1, 100, default),
       (1, 2, 50, default),
       (2, 3, 200, '2019-12-18'),
       (2, 4, 300, '2019-01-05');

-- （2）查询某类别下所有商品的商品编号、商品名称、单价
select g.goods_id,g.goods_name,g.goods_price
from t_goods g
         join t_category c on c.category_id = g.category_id
where category_name = '电子产品';

-- （3）查询存储时间在2019年1月到12月之间的商品名称、单价、库存量、仓库名称
select g.goods_name, g.goods_price, s.storage_quantity, st.store_name
from t_storage s
         join t_goods g on s.goods_id = g.goods_id
         join t_store st on s.store_id = st.store_id
where s.store_datetime between '2019-01-01' and '2019-12-31';

-- （4）查询单价在50-200元之间的商品名称、时间、库存量、安全库存量
select g.goods_name, s.store_datetime, s.storage_quantity, s.safety_storage_quantity
from t_storage s
         join t_goods g on s.goods_id = g.goods_id
where g.goods_price between 50 and 200;

-- （5）创建视图，查询库存量低于安全库存量的商品名称、负责人
create view v_low_storage as
select g.goods_name, st.store_leader
from t_storage s
         join t_goods g on s.goods_id = g.goods_id
         join t_store st on s.store_id = st.store_id
where s.storage_quantity < s.safety_storage_quantity;

-- （5）查询视图
select *
from v_low_storage;

# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces computerstore > "d:/projects/idea/jncc/mysql/st-2-1-6/computerstore_back.sql"