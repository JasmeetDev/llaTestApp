//
//  ViewModel.swift
//  llaTestApp
//
//  Created by Jasmeet Singh on 22/09/22.
//

import UIKit

class ViewModel: NSObject {
    
    var model = [ImageTextModel]()
    
    private var originalModel = [ImageTextModel]()
    
    var updateView: (() -> ())?
    
    override init() {
        super.init()
        setContent()
    }
    
    func setContent() {
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Tom"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Monty"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Tim"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Harry"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "John"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Arian"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "George"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Phil"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Jordi"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Craig"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Neil"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Troy"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Vicker"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Josh"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Sam"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Samuel"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Filos"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Theon"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Mike"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Tory"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Ian"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Jim"))
        originalModel.append(ImageTextModel(image: UIImage(named: "user"), text: "Pam"))
        
        model = originalModel
    }
    
    func searchText(_ text: String) {
        if text.isEmpty {
            model = originalModel
        } else {
            model = originalModel.filter({ $0.text?.lowercased().contains(text.lowercased()) == true })
        }
        updateView?()
    }
}
