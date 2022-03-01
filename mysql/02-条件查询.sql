# 条件查询
/*
语法:
	select
			查询列表
	from
			表名
	where
			筛选条件;

分类:
	1. 按条件表达式筛选
		> < = != <> >= <=
	2.按逻辑表达式筛选
	逻辑运算符
		&& || !
		and or not
	3.模糊查询
		like
		between and
		in
		is null
*/

# 1.按条件表达式筛选
#案例1: 查询工资>12000的员工信息
select
	*
from
	employees
where 
	salary > 12000;

#案例2: 查询部门编号不等于90的员工名和部门编号
select
	last_name,department_id
from 
	employees
where
	department_id != 90;

# 2.按逻辑表达式筛选
#案例1: 查询工资在10000-20000之间的员工、工资以及奖金
select
	last_name,
	salary,
	commission_pct
from 
	employees
where 
	salary >= 10000 and salary <= 20000; 
#案例2: 查询部门编号不是在90-110之间，或者工资高于15000的员工信息、
select 
	*
from 
	employees
where
 not(department_id >= 90 and department_id <=110) or salary > 15000;


# 3.模糊查询
/*
	1.一般和通配符搭配使用
		% 任意多个字符,包含0个字符
		_ 任意一个字符
	
*/
# 1.like
#案例1:查询员工名中包含字符a的员工信息
select
	*
from
	employees
where
	last_name like '%a%';

#案例2: 查询员工名中第三个字符为e,第5个字符为l的员工和工资
select 
	last_name,
	salary
from 
	employees
where last_name like '__n_l%';


#案例3: 查询员工名中第二个字符为_的员工名
# escape 指明转义字符
select
	last_name
from 
	employees
where
	last_name like '_$_%' ESCAPE '$';

# 2.between and
#案例1: 查询员工编号在100到120之间的员工信息

select
	*
from 
	employees
where
	employee_id >= 100 and employee_id <= 120;
# ----------------
select
	*
from 
	employees
where
	employee_id between 100 and 120;


#3.in
/*
	
*/
#案例: 查询员工的工种编号是 IT_PROG、AD_VP、AD_PRES中的一个员工名和工种编号
select 
	last_name,
	job_id
from 
	employees
where
	job_id in ('IT_PROG','AD_VP','AD_PRES');

#4. is null
#案例1: 查询没有奖金的员工名和奖金率
select 
	last_name,
	commission_pct
from 
	employees
where
	commission_pct is null;

#5.<=>安全等于
/*
is null 和 <=>的区别
is null:紧急仅仅可以判断null值
<=>: 即可以判断null值，又可以判断普通的数值
*/

