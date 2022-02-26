//
//  DetailViewController.swift
//  CountryReference
//
//  Created by Aysel Heydarova on 26.02.22.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {

    private lazy var flagImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        return imageView
    }()

    private lazy var tableView: UITableView =  {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    var country: CountryModel

    init(country: CountryModel) {
        self.country = country
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = country.name
        navigationController?.navigationBar.prefersLargeTitles = true
        addSubviews()
        makeConstraints()
        flagImageView.sd_setImage(with: URL(string: country.flags.png), completed: nil)
    }

    private func addSubviews() {
        view.addSubview(flagImageView)
        view.addSubview(tableView)
    }

    private func makeConstraints() {
        flagImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(flagImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Currencies"
        case 1:
            return "National Languages"
        case 2:
            return "Neighboring countries"
        default:
            return ""
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return country.currencies?.count ?? 0
        case 1:
            return country.languages.count
        case 2:
            return country.borders?.count ?? 0
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        switch indexPath.section {
        case 0:
            label.text = country.currencies?[indexPath.row].name

        case 1:
            label.text = country.languages[indexPath.row].name

        case 2:
            label.text = country.borders?[indexPath.row]

        default:
            break
        }

        cell.contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 2:
            let neighbourCountryCode = country.borders?[indexPath.row]
            guard let countryCode = neighbourCountryCode else { return }

            CountryDetails().fetchCountryDetails(country: countryCode) { neighbourCountry in
                let detailController = DetailViewController(country: neighbourCountry)
                self.show(detailController, sender: self)
            }

        default:
            return
        }
    }
}
