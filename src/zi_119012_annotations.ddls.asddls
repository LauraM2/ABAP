@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View 2: Annotations'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_119012_Annotations
  as select from /dmo/flight
{
      @UI:{
           selectionField: [{ position: 10}], 
           lineItem: [{ position: 10 }],
           identification:[{ position: 10 }]
      }
  key carrier_id     as CarrierId,
      @UI:{
           selectionField: [{ position: 20}], 
           lineItem: [{ position: 20 }],
           identification:[{ position: 20 }]
      }
  key connection_id  as ConnectionId,
      @UI:{
           selectionField: [{ position: 30}], 
           lineItem: [{ position: 30 }],
           identification:[{ position: 30 }]
      }
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      @UI.hidden: true
      currency_code  as CurrencyCode,
      @UI:{
           selectionField: [{ position: 50}], 
           lineItem: [{ position: 50 }],
           identification:[{ position: 50 }]
      }
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied
}
