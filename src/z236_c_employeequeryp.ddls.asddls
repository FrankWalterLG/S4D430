@AbapCatalog: {dataMaintenance: #RESTRICTED,
               viewEnhancementCategory: [ #PROJECTION_LIST ],
               extensibility: { allowNewDatasources: false,
                                elementSuffix: 'ZFW',
                                dataSources: [ 'Employee' ]
                                }  }
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Query'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata: {
    allowExtensions: true
}

define view entity Z236_C_EmployeeQueryP
  with parameters
    p_target_curr : abap.cuky( 5 ),

    @Environment.systemField: #SYSTEM_DATE
    
    p_date        : abap.dats
  as select from Z236_R_EMPLOYEE as Employee
{
  key EmployeeId,
      FirstName,
      LastName,
      DepartmentID,
      _Department.Description                                                                   as DepartmentDescription,
      concat_with_space(_Department._Assistant.first_name, _Department._Assistant.last_name, 1) as AssistantName,


      
      case EmployeeId
           when _Department.HeadId         then 'H'
           when _Department.AssistantId    then 'A'
           else  ' '
           end                                                                                  as EmployeeRole,

      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(  amount=>AnnualSalary,
                            source_currency=>CurrencyCode,
                            target_currency=> $projection.CurrencyCode,
                            exchange_rate_date=>$parameters.p_date
                             )                                                                  as AnnualSalaryConverted,

      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast( cast($projection.AnnualSalaryConverted as abap.fltp ) / 12.0 as abap.curr( 10,2)  ) as MonthlySalaryConverted,


      //      CurrencyCode,
      $parameters.p_target_curr                                                                 as CurrencyCode,

      division(dats_days_between(EntryDate, $parameters.p_date), 365, 1)                        as CompanyAffiliation,
      

      _Department

}
