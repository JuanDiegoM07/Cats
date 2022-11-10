//
//  CustomTableViewCell.swift
//  Cats
//
//  Created by Wilson David Molina Lozano on 10/11/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var originCountry: UILabel!
    @IBOutlet weak var inteligenceLabel: UILabel!
    
    var cat: Cat? {
        didSet {
            setup()
        }
    }
    
    private func setup() {
        catImage.downloaded(from: cat?.image?.url, placeHolder: nil)
        name.text = cat?.name
        originCountry.text = cat?.origin
        inteligenceLabel.text = String(cat?.intelligence ?? 0)
    }
    
}
