@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Department'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z236_R_Department
  as select from z236depment 
  association[0..*]  to z236employ as _Employee      on $projection.Id           =  _Employee.department_id
  association[0..1]  to z236employ as _Head          on $projection.HeadId       = _Head.employee_id
  association[0..1]  to z236employ as _Assistant     on $projection. AssistantId = _Assistant.employee_id
  
{
  key id                    as Id,
      description           as Description,
      head_id               as HeadId,
      assistant_id          as AssistantId,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      
      _Employee,
      _Head,
      _Assistant
}
