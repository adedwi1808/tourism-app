//
//  HomeViewController.swift
//  tourism-app
//
//  Created by Ade Dwi Prayitno on 18/11/25.
//

import UIKit

class HomeViewController: UIViewController {
    let tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return tableView
    }()
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .gray
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    
    var viewModel: HomeViewModel?
    
    init(viewModel: HomeViewModel? = nil) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        
        setupNavigationBar()
        setupView()
        
        fetchData()
    }
    
    private func fetchData() {
        Task.detached { [weak self] in
            guard let self, let viewModel = await viewModel else { return }
            await showLoading()
            await viewModel.getTouristAttraction()
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Tourism-APP"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .primary
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    
    private func setupView() {
        let views = [tableView, loadingIndicator]
        
        for viewElement in views {
            self.view.addSubview(viewElement)
            viewElement.translatesAutoresizingMaskIntoConstraints = false
        }
        
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TouristAttractionTableViewCell.self,
                           forCellReuseIdentifier: TouristAttractionTableViewCell.name)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func showLoading() {
        DispatchQueue.main.async {
            self.loadingIndicator.startAnimating()
        }
    }
    
    private func hideLoading() {
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
        }
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.touristAttractionPlaces.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = viewModel?.touristAttractionPlaces[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TouristAttractionTableViewCell.name,
            for: indexPath
        ) as! TouristAttractionTableViewCell
        
        cell.configure(with: data)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        12
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = viewModel?.touristAttractionPlaces[indexPath.row] else { return }
        let touristAttraction = TouristAttractionViewController()
        touristAttraction.hidesBottomBarWhenPushed = true
        touristAttraction.configure(data: data)
        navigationController?.pushViewController(touristAttraction, animated: true)
    }
}

extension HomeViewController: HomeViewModelProtocol {
    func onSuccess() {
        hideLoading()
        tableView.reloadData()
    }
    
    func onFailed(message: String) {
        hideLoading()
        
        let alertController = UIAlertController(
            title: "Failed to fetch data",
            message: message,
            preferredStyle: .alert
        )
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alertController, animated: true)
    }
}
