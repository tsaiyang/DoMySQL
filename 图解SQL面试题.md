- 查询姓“猴”的学生名单
```
select * from student where 姓名 like "猴%";
```
- 查询姓“孟”老师的个数
```
select count(*) from teacher where 教师姓名="孟%";
```

- 查询课程编号为“0002”的总成绩
```
select sum(成绩) as 总成绩 from score where 课程号='0002';
```

- 查询选了课程的学生人数
```
select count(distinct 学号) from score ;
```

- 查询各科成绩最高和最低的分， 以如下的形式显示：课程号，最高分，最低分
```
select 课程号,max(成绩) as 最高分,min(成绩) as 最低分 from score group by 课程号;
```

- 查询每门课程被选修的学生数
```
select 课程号,count(学号) as 选修人数 from score group by 课程号;
```

- 查询男生、女生人数
```
select 性别,count(*) as 人数 from student group by 性别;
```

- 查询平均成绩大于60分学生的学号和平均成绩
```
select 学号,avg(成绩) as 平均成绩 from score group by 学号 having 平均成绩>60
```

- 查询至少选修两门课程的学生学号
```
select 学号 from score group by 学号 having count(课程号)>=2;
```

- 查询同名同姓学生名单并统计同名人数
```
select 姓名,count(*) as 人数 from student group by 姓名 having count(*)>=2;
```

- 查询不及格的课程并按课程号从大到小排列
```
select 课程号,成绩 from score where 成绩<60 order by 课程号 desc; 
```

- 查询每门课程的平均成绩，结果按平均成绩升序排序，平均成绩相同时，按课程号降序排列
```
select 课程号,avg(成绩) as 平均成绩 from score group by 课程号 order by 平均成绩 asc,课程号 desc;
```

- 检索课程编号为“0004”且分数小于60的学生学号，结果按按分数降序排列
```
select 学号,成绩 from score where 课程号='0004' and 成绩<60 order by 成绩 desc;
```

- 统计每门课程的学生选修人数(超过2人的课程才统计)
```
select 课程号,count(学号) as 选修人数 from score group by 课程号 having count(学号)>2;
```

- 查询两门以上不及格课程的同学的学号及其平均成绩
```
select 学号,avg(成绩) as 平均成绩 from score where 成绩<60 group by 学号 having count(课程号)>=2;
```

- 查询学生的总成绩并进行排名
```
select 学号,sum(成绩) as 总成绩 ,dense_rank() over(order by sum(成绩)) as '排名' from score group by 学号;
```

- 查询平均成绩大于60分的学生的学号和平均成绩
```
select 学号,avg(成绩) as 平均成绩 from score group by 学号  having avg(成绩)>60;
```

- 查询所有课程成绩小于60分学生的学号、姓名
```
select 学号,姓名 from student where 学号 in (select 学号 from score group by 学号 having max(成绩)<60);
```

- 查询没有学全所有课的学生的学号、姓名
```
select 学号,姓名 from student where 学号 in (select 学号 from score group by 学号 having count(课程号)<(select count(distinct 课程号) from score));
```

- 查询出只选修了两门课程的全部学生的学号和姓名
```
select 学号,姓名 from student where 学号 in (select 学号 from score group by 学号 having count(课程号)=2);
```

- 1990年出生的学生名单
```
select * from student where year(出生日期)=1990;
```

- 查询所有学生的学号、姓名、选课数、总成绩
```
select a.学号 as 学号,a.姓名 as 姓名,count(b.课程号) as 选课数,sum(b.成绩) as 总成绩 from student a left join score b on a.学号=b.学号 group by 学号;
```

- 查询平均成绩大于85的所有学生的学号、姓名和平均成绩
```
select a.学号 as 学号,a.姓名 as 姓名,avg(b.成绩) as 平均成绩 from student a left join score b on a.学号=b.学号 group by 学号 having avg(b.成绩)>85;
```

- 查询学生的选课情况：学号，姓名，课程号，课程名称
```
select a.学号 as 学号,a.姓名 as 姓名,c.课程号 as 课程号 ,c.课程名称 as 课程名称 from student a inner join score b on a.学号=b.学号 inner join course c on b.课程号=c.课程号;
```

- 查询课程编号为0003且课程成绩在80分以上的学生的学号和姓名
```
select 学号,姓名 from student where 学号 in (select 学号 from score where 课程号='0003' and 成绩>80);
```

- 检索"0001"课程分数小于60，按分数降序排列的学生信息
```
select from student a inner join score b on a.学号=b.学号 where b.课程号='0001' and b.成绩<60 order by b.成绩 desc;
```

- 查询不同老师所教不同课程平均分从高到低显示
```
select a.教师姓名 as 教师姓名,b.课程名称 as 课程名称,avg(c.成绩) as 平均分 from teacher a inner join course b on a.教师号=b.教师号 inner join score c on b.课程号=c.课程号 group by c.课程号 order by avg(c.课程号) desc;
```

- 查询课程名称为"数学"，且分数低于60的学生姓名和分数
```
select a.姓名 as 姓名,b.成绩 as 分数 from student a inner join score b on a.学号=b.学号 inner join course c on b.课程号=c.课程号 where c.课程名称='数学' and b.成绩<60;
```

- 查询任何一门课程成绩在70分以上的姓名、课程名称和分数
```
select a.姓名 as 姓名 ,c.课程名称 as 课程名称 ,b.成绩 as 成绩 from student a inner join score b on a.学号=b.学号 inner join course c on b.课程号=c.课程号 where b.成绩>70 ;
```

- 查询不同课程名称的平均分
```
select b.课程名称 as 课程名称,avg(a.成绩) as 平均分 from score a inner join course b on a.课程号=b.课程号 group by b.课程名称 order by avg(a.成绩) desc;
```

- 查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩
```
select a.学号 as 学号,a.姓名 as 姓名,avg(b.成绩) as 平均成绩 from student a inner join score b on a.学号=b.学号 where b.成绩<60 group by 学号 having count(课程号)>=2
```

- 查询学生平均成绩及其名次
```
select 学号,avg(成绩) as 平均成绩,dense_rank() over(order by avg(成绩) desc) as '排名' from score group by 学号
```

- 按各科成绩进行排序，并显示排名
```
select *,row_number() over(partition by 课程号 order by 成绩) as '排名' from score  
```

- 查询每门功成绩最好的前两名学生姓名
```
select a.课程号,b.姓名,a.ranking from student as b
inner join
(select 学号,课程号,row_number() over(partition by 课程号 order by 成绩) as ranking from score) as a
on b.学号=a.学号
where a.ranking<3
order by a.课程号;
```