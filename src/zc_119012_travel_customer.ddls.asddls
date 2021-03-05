@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View 3.5: Travel Customer1'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_119012_Travel_Customer
  as select from ZI_119012_Travel_Customer
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
      /* Associations */
      _Customer.first_name,
      _Customer.last_name
}
