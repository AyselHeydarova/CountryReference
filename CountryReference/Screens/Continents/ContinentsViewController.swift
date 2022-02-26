//
//  ContinentsViewController.swift
//  CountryReference
//
//  Created by Aysel Heydarova on 25.02.22.
//

import UIKit
import SnapKit

class ContinentsViewController: UIViewController {

    private var viewModel = ContinentsViewModel()

    private lazy var tableView: UITableView =  {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.addSubview(tableView)
        title = "Regional blocs"
        navigationController?.navigationBar.prefersLargeTitles = true
        makeConstraints()
    }

    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ContinentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.allRegionalBlocs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel.allRegionalBlocs[indexPath.row].rawValue
        cell.contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countriesViewController = CountriesTableViewController(region: viewModel.allRegionalBlocs[indexPath.row])
        show(countriesViewController, sender: self)
    }
}
