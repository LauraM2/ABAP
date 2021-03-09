CLASS zcl_119012_demo_0302 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_119012_demo_0302 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE z119012_connection.

    "Angabe passender Felder, da ich nicht alle so
    "selektieren kann in meine Struktur, da diese nur 4 Spalten hat
    SELECT SINGLE FROM ZI_119012_Connection
        FIELDS CarrierId, ConnectionId, AirportFromId, AirportToId "Reihenfolge ist wichtig
        WHERE CarrierId = 'LH' AND ConnectionId = '0400'
        INTO @connection.
    IF sy-subrc <> 0.
      " Fehlerbehandlung
    ENDIF.

    "Kopieren namensgleicher Felder, beachte wirklich die Name müssen 1:1 gleich sein ! Aliasnamen
    "SELECT SINGLE FROM ZI_119012_Connection
    "    FIELDS *
    "    WHERE CarrierId = 'LH' AND ConnectionId = '0400'
    "    INTO CORRESPONDING FIELDS OF @connection.
    "IF sy-subrc <> 0.
    "  " Fehlerbehandlung
    "ENDIF.

    "Inlinedeklaration
    SELECT SINGLE FROM ZI_119012_Connection
        FIELDS *
        WHERE CarrierId = 'LH' AND ConnectionId = '0400'
        INTO @DATA(connection2).
    IF sy-subrc <> 0.
      " Fehlerbehandlung
    ENDIF.


  ENDMETHOD.
ENDCLASS.
