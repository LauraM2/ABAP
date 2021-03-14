@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Comsumption View: Customer and Booking'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZC_119012_ConsumptionView as select from ZI_119012_Composite_Cus_Book {
    key TravelId,
    key BookingId,
   // BookingDate,
     @Search.defaultSearchElement: true
     @Search.fuzzinessThreshold: 0.5
    CustomerId,
    //CarrierId,
    //ConnectionId,
    //FlightDate,
    FlightPrice,
    CurrencyCode,
    /* Associations */
    _Customer.Title,
    concat_with_space(_Customer.FirstName, _Customer.LastName, 1) as CustomerName,
    _Customer.CountryCode    
}

