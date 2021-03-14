@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Composite View: Customer and Booking'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_119012_Composite_Cus_Book
  as select from ZI_119012_Booking as Booking
  association [1] to ZI_119012_Customer as _Customer on Booking.CustomerId = _Customer.CustomerId
{
  key Booking.TravelId,
  key Booking.BookingId,
      Booking.BookingDate,
      Booking.CustomerId,
      Booking.CarrierId,
      Booking.ConnectionId,
      Booking.FlightDate,
      Booking.FlightPrice,
      Booking.CurrencyCode,
      _Customer
      
}
    where _Customer.CountryCode = 'DE'
