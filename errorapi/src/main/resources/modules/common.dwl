%dw 2.0

fun mapError(error, correlationId, message, code) = 
"response": {
	"http-status": (( code splitBy("-") )[-1 to 0]) [0] as Number,
	"error-code": code,
	"message": message,
	"error-details":{
		"correlationId": correlationId,
		"component": error.errorType.namespace ++ ":" ++ error.errorType.identifier,
		"timestamp": now(),
		"detailDescription": error.description
	}	
}
