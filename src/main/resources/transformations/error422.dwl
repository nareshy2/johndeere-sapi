%dw 2.0
output application/json
---
if(!isEmpty(error.errorMessage.payload) and !isEmpty(error.errorMessage.payload.errorOrigin)) 
	error.errorMessage.payload
else { 
  "errorOrigin": Mule::p('application.name'),
  "status" : "ERROR",
  "code": "Unprocessable Entity",
  "message" :  error.description,
  "description" : if(!isEmpty(error.muleMessage.payload.errors.detail)) (error.muleMessage.payload.errors.detail reduce($$ ++ ", "++  $)) else 
                  if(!isEmpty(error.muleMessage.payload.description)) (error.muleMessage.payload.description) else error.detailedDescription,
  "correlationId" : vars.correlationId default "",
  "timestamp": now() as DateTime
}