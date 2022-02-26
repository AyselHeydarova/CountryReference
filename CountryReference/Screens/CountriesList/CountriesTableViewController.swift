//
//  CountriesTableViewController.swift
//  CountryReference
//
//  Created by Aysel Heydarova on 25.02.22.
//

import UIKit

class CountriesTableViewController: UITableViewController {

    private var viewModel: CountriesViewModel

    init(region: RegionalBlocs) {
        self.viewModel = CountriesViewModel(region: region)
        super.init(style: .plain)
    }

    override init(style: UITableView.Style) {
        self.viewModel = CountriesViewModel(region: .EU)
        super.init(style: style)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCountries {
            self.tableView.reloadData()
        }
        title = viewModel.region.rawValue
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorStyle = .singleLine
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryTableViewCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as? CountryTableViewCell

        guard let countryCell = cell else { return UITableViewCell()}

        let country = viewModel.countries[indexPath.row]
        countryCell.configure(flag: country.flags.png,
                              title: country.name,
                              language: country.languages[0].name ?? "")
        return countryCell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController(country: viewModel.countries[indexPath.row])
        show(detailViewController, sender: self)
    }
}
