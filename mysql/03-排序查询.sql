# 排序查询
/*
	语法:
		select 查询列表
		from 表
		[where 筛选条件]
		order by 排序列表 [asc|desc] 
		特点:
		1. asc 升序 desc 降序(默认是升序)
		2. order by 子句中可以支持单个字段、多个字段、表达式、函数、别名
		3. order by 字句一般是放在查询语句的最后面，limit字句除外
	
*/


#案例1: 查询员工信息,要求工资从高到低排序
select * from employees order by salary desc;

#案例2: 查询部门编号>=90的员工信息，按入职时间的先后进行排序
select * 
from employees
where department_id >= 90
order by hiredate asc;

#案例3: 按年薪的高低显示员工的信息和年薪[按表达式排序]
select *,salary * 12 * (1 + ifnull(commission_pct,0)) 年薪
from employees
order by salary * 12 *(1 + ifnull(commission_pct,0)) desc;

#案例4: 按年薪的高低显示员工的信息和年薪[按别名排序]
select *,salary * 12 * (1 + ifnull(commission_pct,0)) 年薪
from employees
order by	年薪 desc;

#案例5: 按姓名的长度显示员工的姓名和工资[按函数排序]
select length(last_name) 字节长度, last_name, salary
from employees
order by length(last_name) desc;

#案例6: 查询员工信息,要求先按工资升序，再按员工编号降序
select *
from employees
order by salary asc,department_id desc;


# 练习

#1.查询员工的姓名和部门号和年薪，按年薪降序 按姓名升序
select last_name,department_id,salary * 12 * (1 + ifnull(commission_pct,0)) 年薪
from employees
order by 年薪 desc,last_name asc;


#2.选择工资不在8000-17000的员工的姓名和工资，按工资降序
select last_name,salary from employees
where salary not between 8000 and 17000
order by salary desc;

#3.查询邮箱中包含e的员工信息，并先按邮箱的字节数降序，再按部门号升序
select * from employees
where email like '%e%'
order by length(email) desc, department_id asc;
