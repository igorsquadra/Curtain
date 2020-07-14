//
//  BackgroundProgressView.swift
//
//
//  Created by Igor Squadra on 09/05/2020.
//  Copyright © 2020 Igor Squadra. All rights reserved.
//

import Foundation
import UIKit


public enum DirectionType {
    case horizontal
    case vertical
}

public enum ResetType {
    case fade
    case linear
}

public class BackgroundProgressView: UIView {
    
    /// Progress view direction, should be `horizontal` (from left to right) or `vertical` (from top to bottom).
    private var direction = DirectionType.horizontal
    /// Minimum width or height at start. Default is zero.
    private var minSize = CGFloat()
    /// Maximum width or height to achieve when the progress is 100%.
    private var maxSize = CGFloat()
    /// Progress timer.
    private var updatingTimer: Timer?
    /// Updating view frequency.
    private var updatingTimeInterval = 0.01
    /// Single frame size.
    private var singleFrameSize: CGFloat {
        return maxSize/CGFloat(time!/updatingTimeInterval)
    }
    /// Type of reset animation
    private var resetType = ResetType.fade
    /// Auto-reset at the end of timer
    private var isAutoResetActive = true
    /// Progress view is setup.
    private var isSetup = false
    /// Progress view is working.
    private var isInProgress = false
    
    /// Update counter
    private var counter = 0
    
    /// The time of progress.
    private(set) var time: Double?
    
    /// View color.
    public var color = UIColor.green {
        didSet {
            backgroundColor = color
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
}


// MARK: - Public methods

extension BackgroundProgressView {
    
    /// Call this method to setup the progress view.
    /// - Parameters:
    ///   - withDirection: progress view direction, should be `horizontal` (from left to right) or `vertical` (from bottom to top).
    ///   - time: time from 0 to 100%.
    ///   - view: your parent view, the progress view will cover all parent view backgrond when arrive at 100%
    ///   - color: progress view color. Default value is green.
    ///   - initialSize: progress view initial size.
    ///   - autoreset: set to true if you want the view automatically reset at the end of time, otherwise false. Default value is `true`.
    ///   - resetType: set type of reset, it could be fade or linear.
    public func setup(
        withDirection: DirectionType = .horizontal,
        withTime time: Double,
        view: CGRect,
        color: UIColor = .green,
        initialSize: CGFloat = 0,
        autoreset: Bool = true,
        resetType: ResetType = .fade
    ) {
        
        isSetup = true
        
        self.minSize = initialSize
        self.time = time
        self.color = color
        self.direction = withDirection
        self.isAutoResetActive = autoreset
        self.resetType = resetType
        
        switch withDirection {
        case .horizontal:
            maxSize = view.width
            frame = CGRect.init(x: 0, y: 0, width: minSize, height: view.height)
        case .vertical:
            maxSize = view.height
            frame = CGRect.init(x: 0, y: 0, width: view.width, height: minSize)
        }
    }
    
    /// Start progress.
    /// - Parameter time: Time to 0 to 100%.
    public func start(withTime time: Double? = nil) {
        guard isSetup else { fatalError("Please call setup method before start") }
        
        if let newTime = time {
            self.time = newTime
        }

        if #available(iOS 10.0, *) {
            updatingTimer = Timer.scheduledTimer(withTimeInterval: updatingTimeInterval, repeats: true, block: { (timer) in
                
                self.counter += 1
                
                guard self.counter <= Int(self.time!/self.updatingTimeInterval) else {
                    timer.invalidate()
                    
                    if self.isAutoResetActive {
                        
                        self.resetView()
                    }
                    
                    return
                }
                
                // Update progress view
                self.updateView(withProgress: self.singleFrameSize)
            })
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    /// Reset progress to initial status.
    /// Change reset type in the setup method.
    public func reset() {
        resetView()
    }
}


// MARK: - Animation

extension BackgroundProgressView {
    
    /// Update view size with animation.
    /// - Parameter progress: Progress to animate.
    private func updateView(withProgress progress: CGFloat) {
        
        UIView.animate(withDuration: updatingTimeInterval) {
            
            switch self.direction {
            case .horizontal:
                self.frame.size.width += progress
            case .vertical:
                self.frame.size.height += progress
            }
        }
    }
    
    /// Reset view to initial status with animation.
    /// - Parameter type: Animation type, it should be `fade` or `linear`.
    private func resetView() {
        
        switch resetType {
        case .fade:
            UIView.animate(withDuration: 0.8, delay: 0.7, options: .curveEaseIn, animations: {
                self.alpha = 0
            }, completion: { (animationCompleted) in
                switch self.direction {
                case .horizontal:
                    self.frame.size.width = self.minSize
                    self.alpha = 1
                case .vertical:
                    self.frame.size.height = self.minSize
                    self.alpha = 1
                }
            })
        case .linear:
            UIView.animate(withDuration: 0.8, delay: 0.7, options: .allowAnimatedContent, animations: {
                switch self.direction {
                case .horizontal:
                    self.frame.size.width = self.minSize
                case .vertical:
                    self.frame.size.height = self.minSize
                }
            }, completion: nil)
        }
    }
}

