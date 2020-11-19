import Env_IONIX
import String_Crypto
import String_RUT

public let key = Environment.current.DESKey

public extension String {
    func encodeForRUTRequest(_ key: String = key) -> String {
        let encoded: String = try! rut.formatted.encryptDES(key: key)
        return encoded
    }
}
