@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View 3: SqlExpressions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_119012_SqlExpressions
  as select from /dmo/connection
{
  key carrier_id      as CarrierId,
  key connection_id   as ConnectionId,
      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      departure_time  as DepartureTime,
      arrival_time    as ArrivalTime,
      distance        as Distance, // durch dmo/flight_distance erfahre ich, dass distance ein int ist
        distance + distance as DoubleDistance,
        distance * 2 as DoubleDistance2,
        cast(distance as abap.fltp) / 2.0 as HalfDistance,  
      distance_unit   as DistanceUnit,
      
      case
      when distance > 2000 and distance_unit = 'KM' then 'Langstreckenflug'
      when distance > 1243 and distance_unit = 'MI' then 'Langstreckenflug'
      else 'Kurzstreckenflug'
      end as DistanceCategory

}
