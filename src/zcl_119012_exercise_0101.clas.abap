CLASS zcl_119012_exercise_0101 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_119012_exercise_0101 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  out->write('Hallo Kunde!').

  DATA travel_id TYPE /dmo/travel_id .
  DATA travel_description TYPE /dmo/description.
  DATA travel_begindate TYPE /dmo/begin_date.
  DATA travel_enddate TYPE /dmo/end_date.

  travel_id = '1234'.
  travel_description = 'Reise nach Bali'.
  travel_begindate = '20210807'.
  travel_begindate = '20210828'.

  out->write( |Nummer: | && travel_id ).
  out->write('Beschreibung:  ' && travel_description ).
  out->write('Startdatum ' && travel_begindate ).
  out->write('Enddatum ' && travel_enddate ).


  ENDMETHOD.
ENDCLASS.
