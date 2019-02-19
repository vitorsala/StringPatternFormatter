//
//  ViewController.swift
//  StringPatternFormatter
//
//  Created by Vitor Kawai Sala on 02/18/2019.
//  Copyright (c) 2019 Vitor Kawai Sala. All rights reserved.
//

import UIKit
import StringPatternFormatter
class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = self.formatter()
        do {
            label.attributedText = try formatter.attributedString(for: "test <b>bold</b><br>with cool <b>custom patterns</b>.")
        } catch {
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func formatter() -> StringPatternFormatter {
        let formatter = StringPatternFormatter(patterns: [
                Pattern(pattern: "<b>(.*?)</b>", type: .attributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: self.label.font.pointSize)])),
                Pattern(pattern: "<br>", type: .replace(to: "\n"))
            ])
        return formatter
    }
}


struct Pattern: StringPattern {
    let pattern: String
    let type: StringPatternType
}
