//
//  ListTabelViewSell.swift
//  hw2
//
//  Created by Артур Миннушин on 03.07.2023.
//

import UIKit

struct ListTableViewData{
    let title: String
    let image: UIImage
    let number: String
}

final class ListTableViewCell: UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.backgroundColor = .systemGray6
        titleLabel.layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        numberLabel.text = nil
        logoImageView.image = nil
    }
    
    func setUp(_ data: ListTableViewData) {
        titleLabel.text = data.title
        logoImageView.image = data.image
        numberLabel.text = data.number
    }
    
}
