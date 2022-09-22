//
//  ImageTextCell.swift
//  llaTestApp
//
//  Created by Jasmeet Singh on 22/09/22.
//

import UIKit

class ImageTextCell: UITableViewCell {

    @IBOutlet weak var dummyImageView: UIImageView!
    @IBOutlet weak var dummyLabel: UILabel!
    
    var model: ImageTextModel? {
        didSet {
            setContent()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setContent() {
        dummyLabel.text = model?.text ?? ""
        dummyImageView.image = model?.image
    }
    
}
