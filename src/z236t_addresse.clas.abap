CLASS z236t_addresse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

* Task 1: Simple Table Type
**********************************************************************
    TYPES tt_addresses TYPE SORTED TABLE OF  z236s_address
                            WITH NON-UNIQUE key  city country.




*Task 3: Nested Table Type
**********************************************************************
    TYPES tt_persons TYPE HASHED TABLE OF z236s_person_deep
                     WITH UNIQUE KEY last_name first_name.


protected section.
private section.
ENDCLASS.



CLASS Z236T_ADDRESSE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Task 1
**********************************************************************
    DATA addresses TYPE z236t_addresses.

    addresses =
      VALUE #(
              ( street      = 'Dietmar-Hopp-Allee 16'
                postal_code = '69190'
                city        = 'Walldorf'
                country     = 'DE'
              )
              ( street      = '3999 West Chester Pike'
                postal_code = '19073'
                city        = 'Newtown Square, PA'
                country     = 'US'
              )
             ).

* Task 2
**********************************************************************
    DATA person TYPE z236s_person_deep.

    person-first_name = 'Dictionary'.
    person-last_name  = 'ABAP'.
    person-addresses  = addresses.

* Task 3
**********************************************************************
    DATA persons TYPE z236t_persons.

    persons =
       VALUE #(
          ( person )
          (
            first_name = 'CDS'
            last_name  = 'ABAP'
            addresses =
              VALUE #(
                      ( street      = 'SAP-Allee 29'
                        postal_code = '68789'
                        city        = 'St.Leon-Rot'
                        country     = 'DE'
                      )
                      ( street      = '35 rue d''Alsace'
                        postal_code = '92300'
                        city        = 'Levallois-Perret'
                        country     = 'FR'
                      )
                      ( street      = 'Bedfont Road'
                        postal_code = 'TW14 8HD'
                        city        = 'Feltham'
                        country     = 'GB'
                      )
                     )
           )
         ).

  ENDMETHOD.
ENDCLASS.
