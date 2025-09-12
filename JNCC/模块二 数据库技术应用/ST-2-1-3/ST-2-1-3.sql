# 任务1：创建数据库
drop database if exists mealcard;
create database mealcard;
use mealcard;

# 任务2：创建数据表及约束
-- 创建就餐卡（饭卡）表 t_card
create table t_card
(
    card_id       int            not null auto_increment comment '饭卡编号',
    student_id    int            not null comment '学生学号',
    student_name  varchar(10)    not null comment '学生姓名',
    curr_money    decimal(10, 1) not null default 0 comment '饭卡余额',
    register_date datetime       not null default current_timestamp comment '饭卡生成时间',
    primary key (card_id)
) comment '就餐卡（饭卡）表';

-- 创建充值表 t_add_money
create table t_add_money
(
    add_id    int            not null auto_increment comment '充值编号',
    card_id   int            not null comment '饭卡编号',
    add_money decimal(10, 1) not null comment '本次充值金额',
    add_date  datetime       not null default current_timestamp comment '充值时间',
    primary key (add_id),
    foreign key (card_id) references t_card (card_id)
) comment '充值表';

-- 创建消费表 t_consume_money
create table t_consume_money
(
    consume_id       int            not null auto_increment comment '消费编号',
    card_id          int            not null comment '饭卡编号',
    consume_money    decimal(10, 1) not null comment '本次消费金额',
    consume_datetime datetime       not null default current_timestamp comment '消费时间',
    primary key (consume_id),
    foreign key (card_id) references t_card (card_id)
) comment '消费表';

# 任务3：数据库操作
-- 插入测试数据
-- 插入就餐卡数据
insert into t_card (student_id, student_name)
values (1001, '张三'),
       (1002, '李四'),
       (1003, '王五');

-- 插入充值数据
insert into t_add_money (card_id, add_money, add_date)
values (1, 100.0, default),
       (2, 200.0, default),
       (1, 50.0, default),
       (3, 1000.0, '2021-4-5'),
       (1, 10.0, '2021-4-5');

-- 插入消费数据
insert into t_consume_money (card_id, consume_money, consume_datetime)
values (1, 30.0, '2008-6-12'),
       (2, 40.0, '2020-2-6'),
       (3, 20.0, '2018-9-10'),
       (1, 50.0, default),
       (3, 80.0, default);

-- （2）查询所有饭卡信息
select *
from t_card;

-- （3）查询某日所有饭卡的充值金额之和（比如2021年4月5号总共充值金额是多少元）
select sum(add_money) as total_add_money
from t_add_money
where date(add_date) = '2021-04-05';

-- （4）查询当天消费金额在30元以上的所有学生姓名
select student_name
from t_card c
         join
     (select card_id
      from t_consume_money
      where date(consume_datetime) = curdate()
      group by card_id, consume_datetime
      having sum(consume_money) > 30) cm
     on c.card_id = cm.card_id;

-- （5）删除姓名为“张三”的所有消费记录
delete cm
from t_consume_money cm
         join t_card c on cm.card_id = c.card_id
where c.student_name = '张三';

# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces mealcard > "d:/projects/idea/jncc/mysql/st-2-1-6/mealcard_back.sql"