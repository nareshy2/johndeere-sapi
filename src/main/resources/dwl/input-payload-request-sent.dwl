%dw 2.0
output application/json
---
{
    correlationId : vars.correlationId,
    businessProcessName: Mule::p('logger.businessProcessName'),
    flowName: flow.name,  
    source: Mule::p('application.name'),
    target: Mule::p('logger.target'),
    httpMethod: vars.inputPayload.httpMethod,
    message: "Sending shipment order created request to John Deere api",
    businessObject: []
}
