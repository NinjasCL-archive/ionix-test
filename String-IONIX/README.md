# String-IONIX

This is a small String extension to encode a string with the format 
required for diverse requests in _IONIX_ endpoints.

## Example

~~~
let rut = "1-9"
let result = try rut.encodeForRUTRequest()

// Result should be FyaSTkGi8So=
   
// Make the API Request 
// https://sandbox.ionix.cl/test-tecnico/search?rut=FyaSTkGi8So=
~~~
