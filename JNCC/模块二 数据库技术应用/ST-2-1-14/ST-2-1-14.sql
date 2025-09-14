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
    check (char_length(phone) = 11),
    check (char_length(password) >= 8)
) comment '用户表';

-- 创建鲜花表 t_flower
create table t_flower
(
    id    int            not null auto_increment comment '编号',
    price decimal(10, 1) not null comment '单价',
    name  varchar(20)    not null comment '名称',
    primary key (id),
    check (price between 1 and 100)
) comment '鲜花表';

-- 创建评论表 t_comment
create table t_comment
(
    id           int          not null auto_increment comment '编号',
    comment      varchar(200) not null comment '内容',
    comment_date datetime     not null comment '发布日期',
    user_id      int          not null comment '用户id',
    flower_id    int          not null comment '鲜花id',
    primary key (id),
    foreign key (user_id) references t_user (id) on delete cascade,
    foreign key (flower_id) references t_flower (id) on delete cascade
) comment '评论表';

-- 任务3：数据库操作
-- (1) 插入测试数据
insert into t_user (username, phone, password)
values ('张三', '13800138000', 'password123'),
       ('李四', '13900139000', 'password456'),
       ('王五', '13700137000', 'password789');

insert into t_flower (price, name)
values (50.0, '玫瑰'),
       (30.0, '百合'),
       (20.0, '康乃馨');

insert into t_comment (comment, comment_date, user_id, flower_id)
values ('这朵玫瑰好漂亮！', '2023-01-10 10:00:00', 1, 1),
       ('这朵玫真漂亮！', '2023-01-10 10:00:00', 1, 1),
       ('百合的香味很清新。', '2023-01-11 11:00:00', 2, 2),
       ('康乃馨送妈妈很不错。', '2023-01-12 12:00:00', 3, 3),
       ('玫瑰好贵。', '2023-01-13 13:00:00', 1, 1),
       ('百合的价格很合理。', '2023-01-14 14:00:00', 2, 2);

-- (2) 查询评论表中，包含‘好’的评论
select *
from t_comment
where comment like '%好%';

-- (3) 查询用户姓名含‘张’的所有评论
select c.*
from t_comment c
         join t_user u on c.user_id = u.id
where u.username like '%张%';

-- (4) 查询哪个花被评论次数最多
select f.name, count(c.id) as comment_count
from t_comment c
         join t_flower f on c.flower_id = f.id
group by f.id
order by comment_count desc
limit 1;

-- (5) 删除用户‘张三’的所有关于‘玫瑰’的评论
delete c
from t_comment c
         join t_user u on u.id = c.user_id
where u.username = '张三'
  and c.comment like '%玫瑰%';

-- (5) 查询
select *
from t_comment;

# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces floweronlinestore > "d:/projects/idea/jncc/mysql/st-2-1-14/floweronlinestore_back.sql"