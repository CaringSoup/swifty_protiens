//
//  ProteinTableViewCell.swift
//  SwiftyProteins
//
//  Created by Naledi MATUTOANE on 2019/12/10.
//  Copyright © 2019 Naledi MATUTOANE. All rights reserved.
//

import UIKit

class ProteinTableViewCell: UITableViewCell {
    @IBOutlet weak var ligandName: UILabel!
    
    var ligand: String? {
        didSet {
            if let l = ligand {
                ligandName.text = l
            }
        }
    }
}
