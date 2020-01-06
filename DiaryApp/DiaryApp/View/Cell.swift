//
//  Cell.swift
//  DiaryApp
//
//  Created by Raymond Choy on 1/5/20.
//  Copyright © 2020 thechoygroup. All rights reserved.
//

import UIKit

//This class represents a cell in table view
final class Cell: UITableViewCell {
    static let reuseIdentifier = String(describing: Cell.self)
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var diaryText: UILabel!
    @IBOutlet weak var diaryImage: UIImageView!
    @IBOutlet weak var moodImage: UIImageView!
    
    @IBOutlet weak var location: UIButton!
    
    
}
