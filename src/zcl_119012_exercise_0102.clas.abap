CLASS zcl_119012_exercise_0102 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

     INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_119012_exercise_0102 IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

    DATA result type p length 16 decimals 2.

    result = 4 + 3.
    out->write( |Addition:  4+3 =| && result ).

    result = 4 - 3.
    out->write( |Subtraktion: 4-3 = | && result ).

    result = 4 * 3.
    out->write( |Multiplikation:  4*3 = | && result ).

    result = 4 / 3.
    out->write( |Division:  4/3 = | && result ).

"++ gibt es nicht

    DATA a TYPE p LENGTH 16 DECIMALS 2.
    DATA b TYPE p LENGTH 16 DECIMALS 2.
    DATA c TYPE p LENGTH 16 DECIMALS 2 value '6.58'.
    DATA operator TYPE c value '+'.

    a = '5.93'.
    b = '2.23'.

    DATA resultMin TYPE p LENGTH 16 DECIMALS 2.
    DATA resultMax TYPE p LENGTH 16 DECIMALS 2.

    " Vergleich zweier Werte

    IF ( a < b ).
      resultMin = a.
       out->write( |Der kleinste Wert ist | && resultMin ).
    ELSEIF ( a = b ).
       out->write( 'Beide Werte gleich groß' ).
    ELSE.
      resultMin = b.
      out->write( |Der kleinste Wert ist | && resultMin ).
    ENDIF.

    "  numerischer Maximal- und Minimalwert
    result = nmax( val1 = a val2 = b ).
    out->write( |Der größere Wert ist | && result ).

    result = nmin( val1 = a val2 = b ).
    out->write( |Der kleinere Wert ist | && result ).


"schönere Lösung

    case operator.
    when '+'.
        result = a + b.
    when '-'.
        result = a - b.
    when '*'.
        result = a * b.
    when '/'.
        result = a / b.
    when 'm' or 'M'.
        result = nmin( val1 = a val2 = b ).
    when others.
         out->write( |Fehlerhafte Eingabe | ).
    endcase.

    out->write( |Ergebnis: | && result ).



  ENDMETHOD.
ENDCLASS.
