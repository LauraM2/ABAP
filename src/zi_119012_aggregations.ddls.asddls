@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View 5: Aggregationen'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_119012_Aggregations
  as select from /dmo/flight
{
  key carrier_id                              as CarrierId,
  key connection_id                           as ConnectionId,
      //plane_type_id                         as PlaneTypeId, nicht sinnvoll wenn ich das zähle
      count(*)                                as Count1,
      count(distinct plane_type_id)           as CountDistinct,
      sum(seats_occupied)                     as Sum1,
      sum(seats_max)                          as Sum2,
      avg(seats_occupied as abap.dec( 16, 0)) as Avg1,
      min(seats_occupied)                     as Min1,
      max(seats_occupied)                     as Max1
}
group by
  carrier_id,
  connection_id
// plane_type_id 
having 
    avg(seats_occupied) < 150
