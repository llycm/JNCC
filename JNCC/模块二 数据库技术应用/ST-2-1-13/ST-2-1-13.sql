-- 任务1：创建数据库
drop database if exists floweronlinestore;
create database floweronlinestore;
use floweronlinestore;

-- 任务2：创建数据表及约束
-- 创建用户表 t_user
create table t_user
(
    id       int         not null auto_increment comment '编号',
    username varchar(18) not null comment '用户名',
    phone    varchar(11) not null comment '电话',
    password varchar(25) not null comment '密码',
    primary key (id),
    unique (username),
    check (length(phone) = 11),
    check (length(password) >= 8)
) comment '用户表';

-- 创建订单表 t_order
create table t_order
(
    id         int                     not null auto_increment comment '编号',
    status     tinyint                 not null comment '状态',
    amount     decimal(10, 1)          not null comment '金额',
    pay_method enum ('支付宝', '微信') not null comment '支付方式',
    user_id    int                     not null comment '用户id',
    primary key (id),
    check (status between 1 and 15),
    foreign key (user_id) references t_user (id) on delete cascade
) comment '订单表';

-- 创建鲜花表 t_flower
create table t_flower
(
    id    int            not null auto_increment comment '编号',
    price decimal(10, 1) not null comment '单价',
    name  varchar(50)    not null comment '名称',
    primary key (id)
) comment '鲜花表';

-- 创建订单详情表 t_order_detail
create table t_order_detail
(
    id        int not null auto_increment comment '编号',
    flower_id int not null comment '鲜花id',
    order_id  int not null comment '订单id',
    count     int not null comment '数量',
    primary key (id),
    foreign key (flower_id) references t_flower (id) on delete cascade,
    foreign key (order_id) references t_order (id) on delete cascade
) comment '订单详情表';

-- 任务3：数据库操作
-- (1) 插入测试数据
insert into t_user (username, phone, password)
values ('张三', '13800138000', 'password123'),
       ('李四', '13900139000', 'password456'),
       ('王五', '13700137000', 'password789'),
       ('张飞', '12345678901', '12345678');

insert into t_flower (price, name)
values (50.0, '玫瑰'),
       (30.0, '百合'),
       (20.0, '康乃馨');

insert into t_order (status, amount, pay_method, user_id)
values (1, 150.0, '支付宝', 1),
       (1, 150.0, '支付宝', 1),
       (2, 90.0, '微信', 1),
       (3, 40.0, '支付宝', 2),
       (3, 400.0, '支付宝', 4);

insert into t_order_detail (flower_id, order_id, count)
values (1, 1, 2),
       (2, 1, 1),
       (3, 2, 3),
       (1, 3, 2);

-- (2) 查询订单表中，金额最多的订单
select *
from t_order
order by amount desc
limit 1;

-- (3) 查询用户姓名含“张”的所有订单金额总和
select sum(o.amount) as total_amount
from t_order o
         join t_user u on o.user_id = u.id
where u.username like '%张%';

-- (4) 查询哪个花被订的次数最多
select f.name, sum(od.count) as total_count
from t_order_detail od
         join t_flower f on od.flower_id = f.id
group by f.id
order by total_count desc
limit 1;

-- (5) 删除用户“张三”的所有订单信息
delete o
from t_order o
         join t_user u on u.id = o.user_id
where u.username = '张三';

-- (5)查询
select *
from t_order

# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces floweronlinestore > "d:/projects/idea/jncc/mysql/st-2-1-13/floweronlinestore_back.sql"