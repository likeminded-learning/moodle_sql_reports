#Selects 'scale' grades for assignments

select concat(u.firstname, ' ', u.lastname) 'Name',
       case
           when ag.grade = 2 then ''
           when ag.grade = 1 then ''
           when ag.grade = -1 then ''
           when isnull(ag.grade) then ''
       end 'Grade',
       cc.name 'Category',
       c.fullname 'Course',
       a.name 'Assignment'
from mdl_user u
       join mdl_assign_grades ag on ag.userid = u.id
       join mdl_assign a on a.id = ag.assignment
       join mdl_course c on c.id = a.course
       join mdl_course_categories cc on cc.id = c.category
              #and cc.parent = x #only in this category
#user not suspended or deleted
where u.deleted <> 1 and u.suspended <> 1