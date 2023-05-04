%dw 2.0
output application/json
---
{
	"client_id": Mule::p('secure::backendBearerToken.clientId'),
	"client_secret": Mule::p('secure::backendBearerToken.clientSecret'),
	"audience": Mule::p('backendBearerToken.audience'),
	"grant_type": Mule::p('backendBearerToken.grant_type')
}
