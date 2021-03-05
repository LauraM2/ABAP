@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View 3.5: Travel Customer'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_119012_Travel_Customer
  as select from ZI_119012_Travel_xt as TravelXt
  association [1] to /dmo/customer as _Customer on TravelXt.CustomerId = _Customer.customer_id
{
  key TravelId,
      Description,
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      Price,
      CurrencyCode,
      Status,
      _Customer

}
