@AbapCatalog: { dataMaintenance: #RESTRICTED,
                viewEnhancementCategory: [ #NONE ] }
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Consumption)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #D,
    sizeCategory: #M,
    dataClass: #MASTER
}
define view entity Z236_C_EMPLOYEE
  as select from Z236_R_EMPLOYEE
{
  key EmployeeId,
      FirstName,
      LastName,
      BirthDate,
      EntryDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      AnnualSalary,
      @EndUserText.label: 'Currency Key'
      CurrencyCode,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt
}
