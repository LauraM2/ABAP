CLASS zcl_119012_exercise_0203 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_119012_EXERCISE_0203 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA travels TYPE z119012_travels.
    DATA travel TYPE z119012_travel.

    travels = CORRESPONDING #( zcl_119000_flight=>get_all_travels(  ) ).

    DELETE travels WHERE description <> |Business Trip|.

    SORT travels BY begin_date ASCENDING.

    LOOP AT travels INTO travel.
        out->write( | { travel-travel_id } - { travel-description } - { travel-begin_date } - { travel-end_date } | ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
