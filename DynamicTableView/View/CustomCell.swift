//
//  CustomCell.swift
//  DynamicTableView
//
//  Created by Sakkaphong Luaengvilai on 12/8/2560 BE.
//  Copyright © 2560 MaDonRa. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var PhotoImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var DetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal var aspectConstraint : NSLayoutConstraint? {
        didSet {
            if oldValue != nil {
                PhotoImageView.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                PhotoImageView.addConstraint(aspectConstraint!)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        PhotoImageView.image = nil
        aspectConstraint = nil
    }
    
    func setPostedImage(image : UIImage) {
        
        let aspect = image.size.width / image.size.height
        
        let constraint = NSLayoutConstraint(item: PhotoImageView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: PhotoImageView, attribute: NSLayoutAttribute.height, multiplier: aspect, constant: 0.0)
        constraint.priority = UILayoutPriority(rawValue: 999)
        
        aspectConstraint = constraint
        
        PhotoImageView.image = image
    }

}
