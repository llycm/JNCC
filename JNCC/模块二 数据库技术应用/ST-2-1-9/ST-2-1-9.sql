# 任务1：创建数据库
drop database if exists shopping;
create database shopping;
use shopping;

# 任务2：创建数据表及约束
-- 创建用户表 t_user
create table t_user
(
    user_id   int         not null auto_increment comment '用户id',
    user_name varchar(20) not null comment '账户',
    password  varchar(20) not null comment '密码',
    sex       enum ('男','女') comment '性别',
    primary key (user_id),
    check ( length(password) >= 6 )
) comment '用户表';

-- 创建分类表 t_category
create table t_category
(
    category_id   int         not null auto_increment comment '分类id',
    category_name varchar(20) not null comment '分类名称',
    primary key (category_id)
) comment '分类表';

-- 创建购物车表 t_shopping
create table t_shopping
(
    shopping_id int not null auto_increment comment '购物车id',
    amount      int not null comment '商品数量',
    user_id     int not null comment '用户id',
    primary key (shopping_id),
    foreign key (user_id) references t_user (user_id)
) comment '购物车表';

-- 创建商品表 t_goods
create table t_goods
(
    goods_id    int            not null auto_increment comment '商品id',
    goods_name  varchar(20)    not null comment '名称',
    price       decimal(10, 1) not null comment '价格',
    state       tinyint        not null comment '状态',
    details     longtext       not null comment '详细介绍',
    img         varchar(100)   not null comment '商品图片',
    category_id int comment '分类id',
    shopping_id int comment '购物车id',
    primary key (goods_id),
    foreign key (category_id) references t_category (category_id),
    foreign key (shopping_id) references t_shopping (shopping_id),
    check ( state in (0, 1))
) comment '商品表';

# 任务3：数据库操作

-- (1) 插入4条测试数据
-- 插入用户数据
insert into t_user (user_name, password, sex)
values ('张明', '123456', '男'),
       ('李芳', 'abcdef', '女'),
       ('王强', '654321', '男'),
       ('赵丽', 'fedcba', '女');

-- 插入分类数据
insert into t_category (category_name)
values ('手机'),
       ('电脑'),
       ('家电'),
       ('服饰');

-- 插入购物车数据
insert into t_shopping (amount, user_id)
values (3, 1),
       (1, 2),
       (3, 3),
       (1, 4);

-- 插入商品数据
insert into t_goods (goods_name, price, state, details, img, category_id, shopping_id)
values ('iphone 13', 5999.0, 1, '最新款苹果手机', 'iphone13.jpg', 1, 1),
       ('macbook pro', 9999.0, 1, '高性能笔记本电脑', 'macbook.jpg', 2, 1),
       ('洗衣机', 2999.0, 1, '全自动洗衣机', 'washer.jpg', 3, 3),
       ('t恤', 99.0, 1, '纯棉t恤', 'tshirt.jpg', 4, 4),
       ('t恤', 99.0, 1, '纯棉t恤', 'tshirt.jpg', 4, 1);

-- (2) 查询用户张明的购物车里的商品信息
select g.*
from t_goods g
         join t_shopping s on g.shopping_id = s.shopping_id
         join t_user u on s.user_id = u.user_id
where u.user_name = '张明';

-- (3) 删除张明购物车里价格大于300的商品信息
delete g
from t_goods g
         join t_shopping s on g.shopping_id = s.shopping_id
         join t_user u on s.user_id = u.user_id
where u.user_name = '张明'
  and g.price > 300;

-- (3) 查询删除后的购物车里的商品信息
select g.*
from t_goods g
         join t_shopping s on g.shopping_id = s.shopping_id
         join t_user u on s.user_id = u.user_id
where u.user_name = '张明';

-- (4) 统计张明购买的500块以上的商品的数量
select count(*) as high_price_count
from t_goods g
         join t_shopping s on g.shopping_id = s.shopping_id
         join t_user u on s.user_id = u.user_id
where u.user_name = '张明'
  and g.price > 500;

-- (5) 创建视图查询买了"手机"的所有用户姓名和性别
create view mobile_buyers as
select u.user_name, u.sex
from t_user u
         join t_shopping s on u.user_id = s.user_id
         join t_goods g on s.shopping_id = g.shopping_id
         join t_category c on g.category_id = c.category_id
where c.category_name = '手机';

-- (5) 查询视图
select *
from mobile_buyers;

# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces shopping > "d:/projects/idea/jncc/mysql/st-2-1-9/shopping_back.sql"