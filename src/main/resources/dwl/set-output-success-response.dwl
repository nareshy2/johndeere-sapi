%dw 2.0
output application/json
---
{
	"status": attributes.statusCode,
	"message": attributes.reasonPhrase
}