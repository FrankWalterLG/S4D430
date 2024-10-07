CLASS zcl_236_path_expr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_236_path_expr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
*    FROM /LRN/C_Employee_Ann
      FROM z236_c_employeequery
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,
           DepartmentDescription,
           assistantname,
           concat_with_space( \_Department\_Head-first_name, \_Department\_Head-last_name, 1 ) AS headname


    INTO TABLE @DATA(lt_result).

    out->write( lt_result ).

  ENDMETHOD.
ENDCLASS.
