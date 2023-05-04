%dw 2.0
output application/json
---
{
  "shipmentNumber": payload."shipmentNumber",
  "tenantId": payload."tenantId",
  "trackingNumber": payload."trackingNumber",
  "accountCode": payload."accountCode",
  "carrierName": payload."carrierName",
  "scac": payload."scac",
  "customerName": payload."customerName",
  "equipmentType": payload."equipmentType",
  "carrierProNumber": payload."carrierProNumber",
  "trailerNumber": payload."trailerNumber",
  "mode": payload."mode",
  "containerInformation": [
    {
      "containerNumber": payload."containerNumber",
      "containerType": payload."containerType",
      "containerWeight": payload."containerWeight" as Number,
      "weightUnitOfMeasure": payload."weightUnitOfMeasure"
    }
  ],
  "movementType": payload."movementType",
  "isManaged": payload."isManaged",
  "orderNumbers": [
    payload."shipmentNumber"
  ],
  "canceled": payload."canceled",
  "forwarder": payload."forwarder",
  "stops": payload.stops map(address,addressindex)->{
      "orderNumbers": [
        payload."shipmentNumber"
      ],
      "locations": [
        {
          "locationId": address."locationId",
          "sequenceNumber": address.sequenceNumber,
          "stopRole": address."stopRole",
          "name": address."name",
          "address1": address."address1",
          "city": address."city",
          "stateProvinceCode": address."stateProvinceCode",
          "postalCode": address."postalCode",
          "countryCode": address."countryCode"
        }
      ]
    },
  "handlingUnits": [
    {
      "handlingUnitId": payload."containerNumber",
      "orderNumbers": [
        payload."shipmentNumber"
      ],
      "packagingType": payload.equipmentType,
      "quantity": 1,
      "containerNumber": payload."containerNumber",
      "pickLocSequenceNumber": payload.handlingUnits.pickLocSequenceNumber[0],
      "dropLocSequenceNumber": payload.handlingUnits.dropLocSequenceNumber[0]
    }
  ]
}