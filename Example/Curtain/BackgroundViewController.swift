//
//  BackgroundViewController.swift
//  Curtain_Example
//
//  Created by Igor Squadra on 06/07/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit


// MARK: - Instance vars and IBOutlets

class BackgroundViewController: UIViewController {
    
    var backgroundProgressView: BackgroundProgressView!
    
    // Background animation direction type: .vertical or .horizontal
    var direction: DirectionType!
}


// MARK: - Essentials

extension BackgroundViewController {
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create and add progress view
        backgroundProgressView = BackgroundProgressView.init(frame:
            CGRect.init(
                x: 0,
                y: 0,
                width: 0,
                height: 0
        ))
        
        view.addSubview(backgroundProgressView)
        
        // Setup your progress view here
        backgroundProgressView.setup(
            withDirection: direction,
            withTime: 3,
            view: view.frame,
            color: UIColor.init(red: 109/255, green: 212/255, blue: 0/255, alpha: 1.0),
            initialSize: 0,
            autoreset: true,
            resetType: .linear
        )
        
//        backgroundProgressView.setup(withDirection: direction, withTime: 3, view: view.frame, color: UIColor.init(red: 30/255, green: 150/255, blue: 182/255, alpha: 1.0))
        
        // Hide navigation bar
        navigationController?.navigationBar.topItem?.titleView = UIView.init()
        navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage.init()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Start progress view
        backgroundProgressView.start(withTime: <#T##Double?#>)
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
