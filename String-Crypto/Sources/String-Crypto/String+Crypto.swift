import Foundation

public extension String {
    /**
      A string is DES encrypted and then encoded to base64 representation.

      ## Warning
         https://rules.sonarsource.com/swift/RSPEC-2278

     Neither DES (Data Encryption Standard) nor DESede (3DES) should be used.

     - Parameters:
       - key: The key to encrypt the string.

     - Returns: A  base64 encoded encrypted string.
        */
    func encryptDES(key: String) throws -> String {
        let cryptor = SymmetricCryptor(.des)
        let cipher = try cryptor.crypt(string: self, key: key)
        return cipher.base64EncodedString()
    }

    /**
     A base64 encoded string is DES decrypted and transformed
     to a plain text representation.

     ## Warning
     https://rules.sonarsource.com/swift/RSPEC-2278

     Neither DES (Data Encryption Standard) nor DESede (3DES) should be used.

     - Parameters:
         - key: The key to decrypt the base64 encoded string.

     - Returns: A plain text version of the base64 encoded encrypted string. Empty string on decoding error.
        */
    func decryptDES(key: String) throws -> String {
        let cryptor = SymmetricCryptor(.des)
        guard let data = Data(base64Encoded: self) else {
            return ""
        }

        let cipher = try cryptor.decrypt(data, key: key)

        let decrypted = String(data: cipher, encoding: .utf8) ?? ""
        return decrypted
    }

    /// Transforms the string to an hexadecimal representation
    var hexDescription: String {
        data(using: .utf8)!.hexDescription
    }
}
