CLASS zcl_119012_demo_0105 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_119012_DEMO_0105 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA text TYPE string VALUE 'Hallo '.
    DATA text2 TYPE string VALUE 'Welt'.
    DATA text3 TYPE string.

    "Verknüpfung mehrerer Zeichenketten
    text3 = text && | | && text2 && '!'.
    out->write( text3 ).

    "Verwenden eines Zeichenketten-Templates
    text3 = |{ text } { text2 }!|.
    out->write( text3 ).

    "Zeichenkettenfunktionen
    "Aufteilen mit SPLIT
    SPLIT text3 AT | | INTO text text2.

    "Zeichenkettenlänge
    DATA number_of_characters TYPE i.
    number_of_characters = strlen( text3 ).

    "Umsetzen
    text3 = to_upper( text3 ).

    out->write( |Länge von '    ': { strlen( '     ' ) }| ).

  ENDMETHOD.
ENDCLASS.
