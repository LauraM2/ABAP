CLASS zcl_119012_demo_0202 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_119012_DEMO_0202 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connections TYPE z119012_connections.

    " interne Tabelle mit ... TYPE TABLE OF <Strukturtyp>
    DATA connections2 TYPE TABLE OF z119012_connection.

    "einfügen von Datensätzen
    connections = value #(
        ( carrier_id = 'LH' connection_id = '0400' )
        ( carrier_id = 'LH' connection_id = '0401' airport_from_id = 'JFK'  airport_to_id = 'FRA' )
        ( carrier_id = 'UA' connection_id = '3517' ) ).


    DATA connection TYPE z119012_connection.
    connection-carrier_id = 'LH'.
    connection-connection_id = '0400'.
    connection-airport_from_id = 'FRA'.
    connection-airport_to_id = 'JFK'.

    connections = value #( base connections
        ( carrier_id = 'LH' connection_id = '0402' airport_from_id = 'FRA' )
        ( connection ) ).

    "Lesen eines Datensatzes

    try. "weil ja 10 zum Beispiel eine Exception wirft
            connection = connections[ 2 ]. "Index ab 1 anfangen zu zählen
        catch cx_sy_itab_line_not_found INTO data(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    IF line_exists( connections[ carrier_id = 'LH' connection_id = '0400' ] ).
        connection = connections[ carrier_id = 'LH' connection_id = '0401' ]. "Schlüssel
    ELSE.
        out->write( |Fehler: Zeile existiert nicht | ).
    ENDIF.

    out->write( |Reisenummer: { connection-carrier_id } | ).
    out->write( |Verbindungsnummer: { connection-connection_id } | ).
    out->write( |Startflughafen: { connection-airport_to_id } | ).
    out->write( |Zielflughafen: { connection-airport_from_id } | ).


    "Auslesen mehrerer Datensätze - Einschränken durch where, dabei kein if benötigt
    LOOP AT connections INTO connection WHERE carrier_id = 'LH'. " inline Deklaration mit ... data(connection3) .
        out->write( | { connection-carrier_id } - { connection-connection_id } | ).
    ENDLOOP.



    "Ändern eines Datensatzes

    connections[ 1 ]-airport_from_id = 'BER'. "Index ab 1 anfangen zu zählen
    connections[ carrier_id = 'LH' connection_id = '0402' ]-airport_to_id = 'FDH'. "Schlüssel

    "Ändern mehrerer Datensätze - Einschränken durch where, dabei kein if benötigt
    DATA connection2 type ref to z119012_connection. "mit ref to wird Datenreferenz gemacht

    LOOP AT connections REFERENCE INTO connection2 WHERE carrier_id = 'LH'. " inline Deklaration mit ... data(connection3) .
       connection2->airport_to_id = 'JFK'.
    ENDLOOP.

**********************************************************************
*    "Änderung auslesen
*    DATA connection_test TYPE z119012_connection.
*    connection_test = connections[ 2 ].
*
*    out->write( |Reisenummer: { connection-carrier_id } | ).
*    out->write( |Verbindungsnummer: { connection-connection_id } | ).
*    out->write( |Startflughafen: { connection-airport_to_id } | ).
*    out->write( |Zielflughafen: { connection-airport_from_id } | ).
**********************************************************************

    "Sortieren
    SORT connections BY carrier_id DESCENDING connection_id ASCENDING airport_from_id DESCENDING.

    "Löschen
    DELETE connections WHERE airport_to_id IS INITIAL OR airport_from_id < 'FRA'. "sortieren nach Asci Code

    "Größe der Tabelle
    DATA(number_of_connections) = lines( connections ).


  ENDMETHOD.
ENDCLASS.
