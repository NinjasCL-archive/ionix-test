import Combine
import Env_IONIX
import Foundation
import String_IONIX

public protocol IFetchMenuItems {
    @available(iOS 13.0, *)
    func items() -> AnyPublisher<MenuItem, Error>
}

@available(iOS 13.0, *)
public class MenuAPI: IFetchMenuItems {
    static let shared = MenuAPI()

    public func items() -> AnyPublisher<MenuItem, Error> {
        let endpoint = Environment.current.endpoints.menus

        print("\(String(describing: endpoint))")

        let url = endpoint.url!

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .retry(2)
            .decode(type: MenuItem.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
