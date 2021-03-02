CLASS zcl_119012_exercise_0202 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_119012_exercise_0202 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA travels TYPE z119012_travels.
    "oder DATA travels TYPE TABLE OF z119012_travel.

    travels = VALUE #( "BASE travels wenn schon was drin ist, sinnvoll, weglassen wenn ich überschreiben will
        ( travel_id = '00000123' description = 'Bali' begin_date = '20210312' end_date = '20210328' )
        ( travel_id = '00001234' description = 'New York' begin_date = '20210422' end_date = '20210513' )
        ( travel_id = '12345' description = 'San Fransisco' begin_date = '20210329' end_date = '20210415' )
        ( travel_id = '123456' description = 'Paris' begin_date = '20210616' end_date = '20210628' )
        ( travel_id = '12345678' description = 'Testreise' )
        ).

    TRY.
        travels[ 2 ]-travel_id = '00005678'. "wenn das nicht funktioniert wird das untere auch nicht gemacht
        travels[ description = 'New York' ]-begin_date = '20220101'.
      CATCH cx_sy_itab_line_not_found. "um die Ausnahme herauszufinden, einmal Ausnahme herbeiführen
    ENDTRY.

   " DATA travel TYPE z119012_travel.

    LOOP AT travels INTO DATA(travel).
      out->write( | { travel-travel_id } - { travel-description } - { travel-begin_date } - { travel-end_date } | ).
    ENDLOOP.


    DATA(number_of_travels) = lines( travels ).
    out->write( |Anzahl Reisen { number_of_travels }| ).

    DELETE travels WHERE begin_date < '20210401'.

    "LOOP AT travels INTO travel.
     " out->write( | { travel-travel_id } - { travel-description } - { travel-begin_date } - { travel-end_date } | ).
    "ENDLOOP.

    "schöner und schneller
    out->write( travels ).

  ENDMETHOD.
ENDCLASS.
