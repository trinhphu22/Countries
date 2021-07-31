//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by Forly on 24/07/2021.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var flagLable: UILabel!
    @IBOutlet weak var countryLable: UILabel!
    @IBOutlet weak var regionLable: UILabel!
    
    func update(with country: Country) {
        flagLable.text = country.flag
        countryLable.text = country.name
        regionLable.text = country.region
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
