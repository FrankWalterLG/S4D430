@AbapCatalog: {dataMaintenance: #RESTRICTED,
               viewEnhancementCategory: [ #PROJECTION_LIST ],
               extensibility: { allowNewDatasources: false,
                                elementSuffix: 'ZFW',
                                dataSources: [ 'Employee' ]
                                }  }

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic Empoyee CDS-View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #D,
    sizeCategory: #M,
    dataClass: #MASTER
}
define view entity Z236_R_EMPLOYEE
  as select from z236employ as Employee
  association [1..1] to Z236_R_Department as _Department on $projection.DepartmentID = _Department.Id


{
  key employee_id           as EmployeeId,
      first_name            as FirstName,
      last_name             as LastName,
      birth_date            as BirthDate,
      entry_date            as EntryDate,


      @Semantics.amount.currencyCode: 'CurrencyCode'
      annual_salary         as AnnualSalary,

      @EndUserText.label: 'Currency Key'
      currency_code         as CurrencyCode,
      department_id         as DepartmentID,

      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,


      _Department
}
