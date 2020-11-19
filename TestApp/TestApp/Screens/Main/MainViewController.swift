import API_IONIX
import Combine
import String_RUT
import UIKit

var users = Set<AnyCancellable>()
var menu = Set<AnyCancellable>()

class MainViewController: UIViewController {
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = API.menu.items().sink(receiveCompletion: { _ in }, receiveValue: { items in
            print("Menu Iterms: \(items)")
        }).store(in: &menu)
    }

    // MARK: IBActions

    @IBAction func easyPayButtonWasTouchUpInside(_: UIButton) {
        alertRUT()
    }

    // MARK: Alerts

    func alertRUT() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Pago fácil", message: "Ingrese su RUT", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in

                alert.dismiss(animated: true) {
                    let rutInput = alert.textFields?.first?.text ?? ""

                    if rutInput.count > 0 && rutInput.rut.isValid {
                        _ = API.search.users(for: rutInput).map { response in
                            // Get second item
                            (response.result?.items?[1])!
                        }.sink(receiveCompletion: { _ in }, receiveValue: { result in
                            self?.alertInfo(result)
                        }).store(in: &users)
                    }
                }

            }))

            alert.addTextField { _ in }

            self.present(alert, animated: true)
        }
    }

    func alertInfo(_ user: Item) {
        DispatchQueue.main.async {
            print("Result: \(String(describing: user))")

            let alert = UIAlertController(title: user.name, message: "\(user.detail?.email ?? "") : \(user.detail?.phoneNumber ?? "")", preferredStyle: .alert)

            alert.addAction(.init(title: "OK", style: .default, handler: nil))

            self.present(alert, animated: true)
        }
    }
}
