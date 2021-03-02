@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View 3.3: Travel by Customer'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_119012_Travel_By_Customer
  as select from ZI_119012_Travel_xt
{
  key concat_with_space(TravelId, Description, 1) as Travel,
      CustomerId,
      BeginDate,
      EndDate,
      dats_days_between(BeginDate, EndDate)       as Duration,
      @Semantics.amount.currencyCode: 'CurrencyCode'
          currency_conversion(amount => Price,
          source_currency => CurrencyCode,
          target_currency => cast('EUR' as abap.cuky),
          exchange_rate_date => EndDate)              as Price,
      @Semantics.amount.currencyCode: 'CurrencyCode'
          currency_conversion(amount => Price,
          source_currency => CurrencyCode,
          target_currency => cast('EUR' as abap.cuky),
          exchange_rate_date => EndDate)              as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
          currency_conversion(amount => Price,
          source_currency => CurrencyCode,
          target_currency => cast('EUR' as abap.cuky),
          exchange_rate_date => EndDate)              as TotalPrice,

      cast('EUR' as abap.cuky)                    as CurrencyCode,
      Status
}
