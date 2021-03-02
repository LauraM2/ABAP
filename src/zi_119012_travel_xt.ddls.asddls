@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel_xt'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_119012_Travel_xt
  as select from ZI_119012_Travel
{

  key TravelId,
      Description,
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(cast(TotalPrice as abap.dec(16,2)) - (cast(BookingFee as abap.dec(16,2))) as abap.curr( 16, 2 )) as Price,
      CurrencyCode,
      //Status, damit ich den nicht doppelt habe
      case Status
        when 'B' then 'Booked'
        when 'N' then 'New'
        when 'P' then 'Planned'
        else 'Wrong' 
      end as Status
}
