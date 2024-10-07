CLASS z236_copy_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z236_copy_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DELETE FROM z236employ.

    INSERT z236employ FROM ( SELECT * FROM  /lrn/employ_rel ).


  ENDMETHOD.
ENDCLASS.
