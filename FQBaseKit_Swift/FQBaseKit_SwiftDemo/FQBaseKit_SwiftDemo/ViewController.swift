//
//  ViewController.swift
//  FQBaseKit_SwiftDemo
//
//  Created by owen on 2019/7/19.
//  Copyright © 2019 owen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try canThrowAnError()
        } catch  {
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    func canThrowAnError() throws {
        // this function may or may not throw an error
        
        
    }
    
}

