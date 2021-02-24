CLASS zcl_119012_exercise_0103 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_119012_EXERCISE_0103 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA text TYPE String value 'Haaaallo Welt'. " nicht verwendet
  DATA text1 TYPE String value 'Haushalte'.

  out->write( |Orginaltext: | && text1 ).

  text1 = replace( val = text1 sub = 'a' with = '1' occ = 0 ). "occ damit alle ersetzt werden
  text1 = replace( val = text1 sub = 'e' with = '2' occ = 0 ).
  text1 = replace( val = text1 sub = 'i' with = '3' occ = 0 ).
  text1 = replace( val = text1 sub = 'o' with = '4' occ = 0 ).
  text1 = replace( val = text1 sub = 'u' with = '5' occ = 0 ).
  "Gut gemacht ;-)

  out->write( |Neuer Text: {  text1 } | ).

  ENDMETHOD.
ENDCLASS.
