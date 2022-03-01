# 基础查询
/*
	select 查询列表 from 表明

	1.查询列表可以是: 表中的字段、常量值、表达式、函数
	2.查询的结果是一个虚拟的表格
	
*/

# 1.查询表中的单个字段

select last_name from employees;

# 2.查询表中的所有字段
select last_name,email,salary from employees;

# 3.查询表中的所有字段
select * from employees;

# 4.查询常量值
select 100;

# 5.查询表达式
select 100 * 5;

# 6.查询函数
select version();

# 7.起别名
/*
	1.便于理解
	2.如果要查询的字段有起别名的情况，使用别名可以区分开来
*/

# 方式一: 使用as
select last_name as 姓,first_name as 名 from employees;
# 方式二: 使用空格
select last_name 姓,first_name 名 from employees;

# 8.去重
# 案例: 查询员工表中涉及到的所有的部门编号
select distinct department_id from employees;

# 9.+号的作用
/*
	select '123' + 123; 只要一方为字符型，试图将字符型数值转换成数值型
											如果转换成功，则继续做加法运算
											如果转换失败，则将字符型数值转为0

	select null + 10; 只要一方为null,则结果一定为null
*/

# 
select concat(last_name, first_name) as 姓名 from employees;