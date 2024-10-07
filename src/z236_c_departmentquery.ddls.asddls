@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Query'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z236_C_DEPARTMENTQUERY
  with parameters
    p_target_curr : abap.cuky( 5 ),

    @Environment.systemField: #SYSTEM_DATE
    @EndUserText.label: 'Date of evaluation'
    p_date        : abap.dats

  as select distinct from Z236_C_EmployeeQueryP( p_target_curr : $parameters.p_target_curr ,
                                                 p_date        : $parameters.p_date) as Emp
    right outer join      Z236_R_Department as _Department on Emp.DepartmentID = _Department.Id

{
  _Department.Id                                  as DepartmentId,
  _Department.Description                         as DepartmentDescription,
  avg( Emp.CompanyAffiliation as abap.dec(11,1) ) as AverageAffiliation,

  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum(Emp.AnnualSalaryConverted)                  as TotalSalary,
  Emp.CurrencyCode

}
group by
  _Department.Id,
  _Department.Description,
  Emp.CurrencyCode
