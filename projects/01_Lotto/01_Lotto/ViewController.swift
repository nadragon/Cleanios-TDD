//
//  ViewController.swift
//  01_Lotto
//
//  Created by 김나용 on 19/03/2019.
//  Copyright © 2019 Yoee Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfVowelsInString(_ string: String) -> Int {
        let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I",
                                   "O", "U"]
        return string.characters.reduce(0) { $0 + (vowels.contains($1) ? 1
            : 0) }
    }
}

