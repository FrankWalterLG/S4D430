CLASS zcl_236_parameter DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_236_parameter IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
**    FROM /LRN/C_Employee_Ann
    FROM Z236_C_EmployeeQueryP(  p_target_curr = 'JPY' )
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,
           departmentdescription,
           assistantname,
           CONCAT_WITH_SPACE( \_department\_Head-first_name, \_Department\_Head-last_name, 1 ) as HeadName,
           MonthlySalaryConverted,
           CurrencyCode,
           CompanyAffiliation

    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
