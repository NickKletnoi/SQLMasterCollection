
select c.ContactID, c.FirstName, c.LastName, c.JobTitle, cr.RoleID, cr.RoleName
from Enterprise.dbo.CoStarContact as cc
inner join Enterprise.dbo.Contact as c on
       c.ContactID = cc.ContactID
left outer join Enterprise.dbo.CoStarRole as cr on
       cr.RoleID = cc.RoleID
where (cr.RoleName like '%Sales%') or (cr.RoleName like '%Account Executive%')
       --cc.DeptID = 20 and -- 20=Sales Dept.
       --cc.Status = 1 -- Active
