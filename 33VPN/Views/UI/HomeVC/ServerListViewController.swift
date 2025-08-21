import UIKit

// MARK: - Data Model
struct Server {
    let country: String
    let ip: String
    let accessSpeedImageName: String
}

final class ServerListViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .plain)
    private var servers: [Server] = []

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupLayout()
        populateDummyServers()
    }

    // MARK: - Setup
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: "ServerTableViewCell", bundle: nil),
            forCellReuseIdentifier: "ServerTableViewCell"
        )
        tableView.backgroundColor = .white
    }

    private func setupLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func populateDummyServers() {
        let countries = [
            "USA", "Germany", "France", "Japan", "Brazil",
            "Canada", "United Kingdom", "Australia", "India", "Spain"
        ]
        let ips = [
            "192.168.0.1", "172.16.10.5", "10.0.0.3",
            "192.168.1.10", "192.168.2.20", "10.10.10.10",
            "172.20.20.20", "192.168.100.100", "10.0.1.1", "192.168.50.50"
        ]
        let speedImages = ["highImg", "mediumImg", "lowImg"]

        for i in 0..<10 {
            let server = Server(
                country: countries[i % countries.count],
                ip: ips[i % ips.count],
                accessSpeedImageName: speedImages.randomElement() ?? "lowImg"
            )
            servers.append(server)
        }
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension ServerListViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servers.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ServerTableViewCell",
            for: indexPath
        ) as? ServerTableViewCell else {
            return UITableViewCell()
        }

        let server = servers[indexPath.row]
        cell.countryImg.image = UIImage(named: server.country)
        cell.countryNameLbl.text = server.country
        cell.countryNameLbl.textColor = UIColor(hex: "1D3D5B")
        cell.ipLbl.text = server.ip
        cell.ipLbl.textColor = UIColor(hex: "1D3D5B")
        cell.accessSpeedImg.image = UIImage(named: server.accessSpeedImageName)
        cell.backgroundColor = .white
        cell.contentView.backgroundColor = .white

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let server = servers[indexPath.row]
        print("Selected server: \(server.country) - \(server.ip)")
    }

    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 60
    }
}

