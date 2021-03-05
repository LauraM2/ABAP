@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View 3.4: Travel by Customer'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_119012_Travel_By_Customer
  as select from ZI_119012_Travel_By_Customer
{
  CustomerId,
  count(*)        as NumberOfTravels,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum(TotalPrice) as TotalExpenses,
  CurrencyCode
}

group by
  CustomerId,
  CurrencyCode
having
  count(*) > 10
