CLASS zcl_119012_demo_klausurvorb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_119012_demo_klausurvorb IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA customers TYPE TABLE OF ZI_119012_Composite_Cus_Book.

    SELECT FROM ZI_119012_Composite_Cus_Book
        FIELDS *
        WHERE CustomerId = '0000100'
        INTO TABLE @customers.
    IF sy-subrc <> 0.
      out->write( |leider keine Daten gefunden| ).
    ENDIF.

    LOOP AT customers INTO DATA(customer).
    out->write( | { customer-CustomerId }  - Datum: { customer-BookingDate } - { customer-FlightPrice }| ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
