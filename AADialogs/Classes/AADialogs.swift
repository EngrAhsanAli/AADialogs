//
//  AADialogs.swift
//  AADialogs
//
//  Created by M. Ahsan Ali on 24/09/2018.
//  Copyright (c) 2018 Ahsan Ali. All rights reserved.
//


import UIKit
import AAViewAnimator

var AssociatedObjectHandle: UInt8 = 0

// MARK: - fileprivate methods
fileprivate extension UIViewController {
    
    var rootViewController: UIViewController {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else {
            fatalError("AADialogs - Application key window not found. Please check UIWindow in AppDelegate.")
        }
        return rootVC
    }
    
    var blurEffectView: UIVisualEffectView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectHandle) as? UIVisualEffectView
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addViewController(_ viewController: UIViewController?, effect: UIBlurEffect.Style?) {
        let currentVC = viewController ?? rootViewController

        if let style = effect {
            blurEffectView = currentVC.view.addBlur(style: style)
        }
        
        currentVC.view.addSubview(view)
        currentVC.addChild(self)
  
    }
    
    func removeViewController() {
        removeFromParent()
        view.removeFromSuperview()
        blurEffectView?.removeFromSuperview()
        blurEffectView = nil
    }
    
}

fileprivate extension UIView {
    
    func addBlur(style: UIBlurEffect.Style) -> UIVisualEffectView {
        
        let blurEffect = UIBlurEffect(style: style)
        let blurBackground = UIVisualEffectView(effect: blurEffect)
        
        addSubview(blurBackground)
        
        blurBackground.translatesAutoresizingMaskIntoConstraints = false
        blurBackground.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        blurBackground.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blurBackground.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        blurBackground.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        return blurBackground
    }
}

// MARK:- AADialog
public typealias AADialog = AA_Dialog<String, String>

open class AA_Dialog<V, S>: UIViewController {
    open var viewsController: UIViewController
    
    public init(_ withId: String, storyboard: String) {
        
        self.viewsController =
            UIStoryboard(name: storyboard, bundle: nil)
                .instantiateViewController(withIdentifier: withId)

        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers
extension UIViewController {
    
    open func aa_show_alert(duration: TimeInterval = 0.3,
                            springDamping: AAViewDamping = .none,
                            animation: AAViewAnimators = .zoomIn,
                            blurEffect: UIBlurEffect.Style? = .dark,
                            viewController: UIViewController? = nil,
                            completion: ((Bool, UIViewController) -> ())? = nil) {

        addViewController(viewController, effect: blurEffect)
        
        view.aa_animate(duration: duration, springDamping: springDamping, animation: animation) {
            (animating, _) in
            
            guard !animating else { return }
            completion?(true, self)
            
        }
        
    }
    
    open func aa_hide_alert(duration: TimeInterval = 0.3,
                            springDamping: AAViewDamping = .none,
                            animation: AAViewAnimators = .zoomOut,
                            completion: (() -> ())? = nil) {
        
        view.aa_animate(duration: duration, springDamping: springDamping, animation: animation) {
            (animating, _) in
            
            guard !animating else { return }
            self.removeViewController()
            completion?()
        }
        
    }
    
    open func setAbsHeight(_ height: CGFloat) {
        view.bounds.size.height = height
    }
}

