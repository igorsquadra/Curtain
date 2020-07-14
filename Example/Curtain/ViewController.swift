//
//  ViewController.swift
//  Curtain
//
//  Created by igorsquadra on 07/06/2020.
//  Copyright (c) 2020 igorsquadra. All rights reserved.
//

import UIKit

import Curtain


// MARK: - Instance vars and IBOutlets

class ViewController: UIViewController {
    
    
}


// MARK: - Essentials

extension ViewController {
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        
    }
    
    // MARK: Memory warning
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    // MARK: Layout subviews
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
}


// MARK: - Actions

extension ViewController {
    
    @IBAction func showVerticalAnimation(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "storyboardId_background") as! BackgroundViewController
        vc.direction = .vertical
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func showHorizontalAnimation(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "storyboardId_background") as! BackgroundViewController
        vc.direction = .horizontal
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
