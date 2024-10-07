@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Query'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z236_C_EMPLOYEEQUERY
  as select from Z236_R_EMPLOYEE
  
{
  key EmployeeId,
      FirstName,
      LastName,
      DepartmentID,
      _Department.Description                                                                   as DepartmentDescription,
      concat_with_space(_Department._Assistant.first_name, _Department._Assistant.last_name, 1) as AssistantName,


      @EndUserText.label: 'Employee Role'
      case EmployeeId
          when _Department.HeadId         then 'H'
          when _Department.AssistantId    then 'A'
          else  ' '
           end                                                                                  as EmployeeRole,

      @EndUserText.label: 'Annual Salary'
      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
      currency_conversion(  amount=>AnnualSalary,
                            source_currency=>CurrencyCode,
                            target_currency=> $projection.CurrencyCodeUSD,
                            exchange_rate_date=>$session.system_date
                             )                                                                  as AnnualSalaryConverted,

      @EndUserText.label: 'Monthly Salary'
      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
      cast( cast($projection.AnnualSalaryConverted as abap.fltp ) / 12.0 as abap.curr( 10,2)  ) as MonthlySalary,


      //      CurrencyCode,
      cast( 'USD' as /dmo/currency_code )                                                       as CurrencyCodeUSD,

      division(dats_days_between(EntryDate, $session.system_date), 365, 1)                      as CompanyAffiliation,

      _Department

}
