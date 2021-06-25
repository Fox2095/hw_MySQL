-- Агрегация данных
-- 1. Подсчитайте средний возраст пользователей в таблице users

SELECT AVG(age) FROM (SELECT YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) as age FROM profiles) AS Avg_age;

-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT COUNT(*) as stats from (SELECT DAYOFWEEK(CONCAT(YEAR(NOW()),'-', MONTH(birthday),'-', DAYOFMONTH(birthday))) as date from profiles) as stats where date=1;

-- 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы.

SELECT EXP(sum(log(value))) FROM table;


