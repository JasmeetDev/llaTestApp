//
//  SearchHeaderView.swift
//  llaTestApp
//
//  Created by Jasmeet Singh on 22/09/22.
//

import UIKit

protocol SearchHeaderViewDelegate: NSObject {
    func searchText(_ text: String)
}
class SearchHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var searchBar: UISearchBar!
    weak var delegate: SearchHeaderViewDelegate?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchBar.delegate = self
    }

}

extension SearchHeaderView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.searchText(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        delegate?.searchText(searchBar.text ?? "")
    }
}
