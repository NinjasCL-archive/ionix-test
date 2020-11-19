import Combine
import Env_IONIX
import Foundation
import String_IONIX

public protocol ISearchUsers {
    @available(iOS 13.0, *)
    func users(for rut: String) -> AnyPublisher<User, Error>
}

@available(iOS 13.0, *)
public class SearchAPI: ISearchUsers {
    static let shared = SearchAPI()

    public func users(for rut: String) -> AnyPublisher<User, Error> {
        let query = URLQueryItem(name: "rut", value: rut.encodeForRUTRequest())

        var endpoint = Environment.current.endpoints.search
        endpoint.queryItems = [query]

        print("\(String(describing: endpoint))")

        let url = endpoint.url!

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .retry(2)
            .decode(type: User.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
