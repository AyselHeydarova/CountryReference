//
//  SearchCountriesViewController.swift
//  CountryReference
//
//  Created by Aysel Heydarova on 26.02.22.
//

import UIKit
import SnapKit

class SearchCountriesViewController: UIViewController {
    private var viewModel = SearchCountriesViewModel()
    let searchController = UISearchController(searchResultsController: nil)

    private lazy var tableView: UITableView =  {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = createBackgroundView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.addSubview(tableView)
        makeConstraints()
        setupSearchController()
        title = "Search countries"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func createBackgroundView() -> UIView {
        let backgroundView =  UIView(frame: .zero)
        let label = UILabel()
        backgroundView.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        label.text = "No results"
        return backgroundView
    }

    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.searchTextField.textColor = .white
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

extension SearchCountriesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        viewModel.searchForCountry(searchText: searchText) {
            self.tableView.reloadData()
        }
    }
}

extension SearchCountriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel.searchResults[indexPath.row].name
        cell.contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        if viewModel.searchResults.count != 0 {
            tableView.backgroundView = UIView()
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CountryDetails().fetchCountryDetails(country: viewModel.searchResults[indexPath.row].alpha3Code) { country in
            let detailController = DetailViewController(country: country)
            self.show(detailController, sender: self)
        }
    }
}
