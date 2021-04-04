//
//  FirstTableViewCell.swift
//  Getapimethods
//
//  Created by Jomms on 13/01/21.
//

import UIKit
import Foundation
import WebKit

class FirstTableViewCell: UITableViewCell {
    
    @IBOutlet weak var id_txtfld: UITextField!
    
    @IBOutlet weak var user_txttfld: UITextField!
    @IBOutlet weak var titl_fld: UITextField!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  }
