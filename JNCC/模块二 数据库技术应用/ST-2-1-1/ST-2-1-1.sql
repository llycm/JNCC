# 任务1：创建数据库
drop database if exists onlineshopping;
create database onlineshopping;
use onlineshopping;

# 任务2：创建数据表及约束
-- 创建商品类别表 t_category
create table t_category
(
    category_id   int          not null auto_increment comment '商品类别id',
    category_name varchar(100) not null comment '商品类别名称',
    primary key (category_id)
) comment '商品类别表';

-- 创建商品表 t_product
create table t_product
(
    product_id              int            not null auto_increment comment '商品编号',
    product_name            varchar(100)   not null comment '商品名称',
    product_price           decimal(10, 1) not null comment '商品价格',
    product_desc            varchar(400)   not null comment '商品描述',
    product_online_datetime datetime       not null default current_timestamp comment '商品上架时间',
    category_id             int            not null comment '商品类别id',
    primary key (product_id),
    foreign key (category_id) references t_category (category_id),
    check (product_price between 1 and 1000)
) comment '商品表';

-- 创建商品评价表 t_product_review
create table t_product_review
(
    product_review_id       int          not null auto_increment comment '评论编号',
    product_id              int          not null comment '商品编号',
    product_review_review   varchar(200) not null comment '评论内容',
    product_review_datetime datetime     not null default current_timestamp comment '评论时间',
    primary key (product_review_id),
    foreign key (product_id) references t_product (product_id)
) comment '商品评价表';

# 任务3：数据库操作
-- 插入商品类别数据
insert into t_category (category_name)
values ('电子产品'),
       ('服装'),
       ('食品');

-- 插入商品数据
insert into t_product (product_name, product_price, product_desc, category_id)
values ('手机', 999.0, '高性能智能手机', 1),
       ('t恤', 99.0, '纯棉舒适t恤', 2),
       ('巧克力', 50.0, '美味巧克力', 3);

-- 插入商品评价数据
insert into t_product_review (product_id, product_review_review)
values (1, '这款手机非常好用'),
       (1, '性价比很高'),
       (2, 't恤质量不错'), -- 修正：补全了缺失的 product_id
       (3, '巧克力味道很好'),
       (3, '有点贵');

-- 查询某类别下所有商品（假设查询电子产品类别，category_id为1）
select p.product_id, p.product_name, p.product_price
from t_product p
         join t_category c on p.category_id = c.category_id
where c.category_id = 1;

-- 查询上线时间在2020年1月到12月之间的商品
select *
from t_product
where year(product_online_datetime) = 2020;

-- 查询商品价格在90-200元之间的所有评论
select pr.product_review_review
from t_product_review pr
         join t_product p on pr.product_id = p.product_id
where p.product_price between 90 and 200;

-- 查询评论数在3条以上的所有商品信息
select p.*, count(pr.product_review_id) as review_count
from t_product p
         left join t_product_review pr on p.product_id = pr.product_id
group by p.product_id
having review_count > 3;

select product_id,count(*)
from t_product
group by product_id
having count(*) > 3;

# todo:
-- 删除评论数为1的所有评论和商品


# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces onlineshopping > "D:/Projects/Idea/JNCC/mysql/ST-2-1-6/onlineshopping_back.sql"