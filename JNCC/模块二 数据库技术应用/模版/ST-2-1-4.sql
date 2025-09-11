# 任务1：创建数据库
DROP DATABASE IF EXISTS MealCard;
CREATE DATABASE MealCard;
USE MealCard;

# 任务2：创建数据表及约束
-- 创建就餐卡（饭卡）表 t_card
CREATE TABLE t_card
(
    card_id       INT            NOT NULL AUTO_INCREMENT COMMENT '饭卡编号',
    student_id    INT            NOT NULL COMMENT '学生学号',
    student_name  VARCHAR(10)    NOT NULL COMMENT '学生姓名',
    curr_money    DECIMAL(10, 1) NOT NULL DEFAULT 0 COMMENT '饭卡余额',
    register_date DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '饭卡生成时间',
    PRIMARY KEY (card_id)
) COMMENT '就餐卡（饭卡）表';

-- 创建充值表 t_add_money
CREATE TABLE t_add_money
(
    add_id    INT            NOT NULL AUTO_INCREMENT COMMENT '充值编号',
    card_id   INT            NOT NULL COMMENT '饭卡编号',
    add_money DECIMAL(10, 1) NOT NULL COMMENT '本次充值金额',
    add_date  DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '充值时间',
    PRIMARY KEY (add_id),
    FOREIGN KEY (card_id) REFERENCES t_card (card_id)
) COMMENT '充值表';

-- 创建消费表 t_consume_money
CREATE TABLE t_consume_money
(
    consume_id       INT            NOT NULL AUTO_INCREMENT COMMENT '消费编号',
    card_id          INT            NOT NULL COMMENT '饭卡编号',
    consume_money    DECIMAL(10, 1) NOT NULL COMMENT '本次消费金额',
    consume_datetime DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消费时间',
    PRIMARY KEY (consume_id),
    FOREIGN KEY (card_id) REFERENCES t_card (card_id)
) COMMENT '消费表';

# 任务3：数据库操作
-- 插入测试数据
-- 插入就餐卡数据
INSERT INTO t_card (student_id, student_name)
VALUES (1001, '张三'),
       (1002, '李四'),
       (1003, '王五');

-- 插入充值数据
INSERT INTO t_add_money (card_id, add_money, add_date)
VALUES (1, 100.0, default),
       (2, 200.0, default),
       (1, 50.0, default),
       (3, 1000.0, '2021-4-5'),
(1, 10.0, '2021-4-5');

-- 插入消费数据
INSERT INTO t_consume_money (card_id, consume_money,consume_datetime)
VALUES (1, 30.0,'2008-6-12'),
       (2, 40.0,'2020-2-6'),
       (3, 20.0,'2018-9-10'),
       (1, 50.0,default),
       (3, 80.0,default);

-- 查询所有饭卡信息
SELECT *
FROM t_card;

-- 查询某日所有饭卡的充值金额之和（比如2021年4月5号总共充值金额是多少元）
SELECT SUM(add_money) AS total_add_money
FROM t_add_money
WHERE DATE(add_date) = '2021-04-05';

-- 查询当天消费金额在30元以上的所有学生姓名
SELECT c.student_name
FROM t_card c
         JOIN t_consume_money cm ON c.card_id = cm.card_id
WHERE DATE(cm.consume_datetime) = CURDATE()
  AND cm.consume_money > 30;

-- 删除姓名为“张三”的所有消费记录
DELETE cm
FROM t_consume_money cm
         JOIN t_card c ON cm.card_id = c.card_id
WHERE c.student_name = '张三';

# 任务4：数据库备份
# mysqldump -u root -p --no-tablespaces [表名] > "D:/Projects/Idea/JNCC/mysql/ST-2-1-6/{database}_back.sql"