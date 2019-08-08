//
//  ViewController.swift
//  SwiftAlgorithm
//
//  Created by Jack on 2019/8/6.
//  Copyright © 2019 Dun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let sortArray = SortAlgorithm.quickSort(sortArray: [9,1,4,5,6,7,2])
        print(sortArray)
    }

    
}

