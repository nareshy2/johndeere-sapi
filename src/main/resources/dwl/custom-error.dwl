%dw 2.0
output application/json
---
if(error.muleMessage.typedAttributes.statusCode==400) (error.muleMessage.payload.message reduce ($$++ ", "++ $)) else error.muleMessage.payload.message 