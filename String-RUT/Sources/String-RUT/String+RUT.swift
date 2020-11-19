
public extension String {
    /**
     Checks if the string is a valid chilean RUT (Rol Único Tributario).
     - Returns: Simple struct with isValid and formatted values.
     */
    var rut: (isValid: Bool, formatted: String) {
        return RUTValidator.validateRUT(self)
    }
}
