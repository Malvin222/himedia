select count(*) cnt from student_info where userid='';

insert into student_info(userid,name,school,birthday,gender) values ('','','','','');

update student_info set name='',school ='', birthday='',gender='' where userid='';

delete from studnet_info where userid='';

delete from student_score where userid='';

Select userid,name,school,to_char(birthday,'yyyy-mm-dd') birthday,gender from Student_info ;

Select i.userid userid
      ,i.name name
      ,i.school school
      ,s.grade grade
      ,s.hakgi hakgi
      ,s.eng eng
      ,s.kor kor
      ,s.math math
      ,(s.eng+s.kor+s.math) hap
      ,round((s.eng+s.kor+s.math)/3) avg
        from student_info i,student_score s
        where i.userid=s.userid 
                and i.userid ='aa1'
                and s.grade='1'
                and s.hakgi='1';
                

       --반                     
        select i.userid,i.name,i.school,s.grade,s.hakgi,s.ban,round((s.eng+s.kor+s.math)/3) avg
                    from student_info i,student_score s
                    where i.userid=s.userid 
                            and s.grade='1'
                            and s.hakgi='1'
                            and s.ban='1'
                            order by avg desc;

        --전체석차          
          select rank()over (order by avg desc) rank,userid,avg from ( select i.userid ,round((s.eng+s.kor+s.math)/3) avg
                    from student_info i,student_score s
                    where i.userid=s.userid 
                            and s.grade='1'
                            and s.hakgi='2'
                            order by avg desc) a;
                            
      --반석차                  
         select c.*from ( select b.*,rank()over (order by avg desc) classrank 
                from (select a.*,rank()over (order by avg desc) schoolrank 
                from(select i.userid,i.name,i.school,s.grade,s.hakgi,s.ban,round((s.eng+s.kor+s.math)/3) avg, eng,kor,math,(eng+kor+math) hap
                    from student_info i,student_score s
                    where i.userid=s.userid 
                            and s.grade='1'
                            and s.hakgi='1'
                            order by avg desc)a)b
                            where ban = (select ban from student_score where userid='aa2' and grade='1' and hakgi='1'))c
                            where userid='aa2'
                            ;
