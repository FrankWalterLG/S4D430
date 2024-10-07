extend view entity Z236_C_EmployeeQueryP
 with 
 association[1..1] to I_Country as _ZZCountryzfw on $projection.ZZCoutryZfw = _ZZCountryzfw.Country
 
 {
   Employee.ZZCoutryZfw,
   Employee.ZZTitlezfw,
   
   concat_with_space(Employee.FirstName, Employee.LastName, 1 ) as zzFullNamezfw,
   _ZZCountryzfw.IsEuropeanUnionMember  as zzEUBasedzfw
   
}
