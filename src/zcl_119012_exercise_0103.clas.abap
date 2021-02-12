CLASS zcl_119012_exercise_0103 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_119012_exercise_0103 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA text TYPE String value 'Hallo Welt'.
  DATA text1 TYPE String value 'Haushalte'.

  out->write( |Orginaltext: | && text1 ).

  text1 = replace( val = text1 sub = 'a' with = '1' ).
  text1 = replace( val = text1 sub = 'e' with = '2' ).
  text1 = replace( val = text1 sub = 'i' with = '3' ).
  text1 = replace( val = text1 sub = 'o' with = '4' ).
  text1 = replace( val = text1 sub = 'u' with = '5' ).
  "Gut gemacht ;-)

  out->write( |Neuer Text: | && text1 ).

  ENDMETHOD.
ENDCLASS.
