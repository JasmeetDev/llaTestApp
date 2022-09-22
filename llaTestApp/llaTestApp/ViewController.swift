//
//  ViewController.swift
//  llaTestApp
//
//  Created by Jasmeet Singh on 22/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        viewModel.updateView = { [weak self] in
            self?.tableView.reloadData()
        }
        
        tableView.register(UINib(nibName: "ImageCrouselCell", bundle: nil), forCellReuseIdentifier: "ImageCrouselCell")
        tableView.register(UINib(nibName: "ImageTextCell", bundle: nil), forCellReuseIdentifier: "ImageTextCell")
        tableView.register(UINib(nibName: "SearchHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "SearchHeaderView")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        return viewModel.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCrouselCell", for: indexPath) as? ImageCrouselCell
            else { return  UITableViewCell() }
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTextCell", for: indexPath) as? ImageTextCell
        else { return UITableViewCell() }
        cell.model = viewModel.model[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 { return nil }
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SearchHeaderView") as? SearchHeaderView else { return nil }
        view.delegate = self
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return 0 }
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { return 140 }
        return 60
    }
}

extension ViewController: SearchHeaderViewDelegate {
    func searchText(_ text: String) {
        viewModel.searchText(text)
    }
}
