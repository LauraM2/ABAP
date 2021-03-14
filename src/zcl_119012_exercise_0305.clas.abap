CLASS zcl_119012_exercise_0305 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_119012_exercise_0305 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA travel_id TYPE /dmo/travel_id VALUE '00000012'.
    DATA description TYPE /dmo/description VALUE 'Sightseeing in Miami, Florida'.
    DATA customer_id TYPE /dmo/customer_id VALUE '000001'.

    DATA travels TYPE TABLE OF ZC_119012_Travel_Customer.


   "00000551;Vacation;000001;20211006;20211007;40.00 ;21702.00 ;21662.00 ;SGD;Planned;Theresia;Buchholm

    SELECT FROM ZC_119012_Travel_Customer
        FIELDS * "TravelId, Description, CustomerId, BeginDate, EndDate, BookingFee, TotalPrice, Price, CurrencyCode, Status, _Customer.first_name, _Customer.last_name
        "WHERE TravelId = @travel_id
        WHERE CustomerId = @customer_id
        INTO TABLE @travels.
    IF sy-subrc <> 0.
      out->write( |leider keine Daten gefunden| ).
    ENDIF.

    out->write( travels ). "einfacher aber zu einfach für Prüfung!

    "bezüglich _Customer.first_name am besten Aliasnamen vergeben
    "LOOP AT travels INTO DATA(travel).
    "out->write( | Reisezeitraum: { travel-BeginDate } - { travel-EndDate } - Beschreibung: { travel-Description } - Vorname: { travel-first_name }  | ).
    "ENDLOOP.

  ENDMETHOD.
ENDCLASS.
