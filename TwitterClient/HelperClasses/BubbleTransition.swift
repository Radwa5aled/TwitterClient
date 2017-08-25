//
//  BubbleTransition.swift
//  TwitterTest
//
//  Created by Ievgen Keba on 4/18/17.
//  Copyright © 2017 Harman Inc. All rights reserved.
//

import UIKit

open class BubbleTransition: NSObject {
    
    open var duration = 0.5
    
    open fileprivate(set) var bubble = UIView()
}

extension BubbleTransition: UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        
        fromViewController?.beginAppearanceTransition(false, animated: true)
        toViewController?.beginAppearanceTransition(true, animated: true)
        
        let returningControllerView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toControllerView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        let originalCenter = returningControllerView.center
        let originalSize = returningControllerView.frame.size
        
        bubble.frame = frameForBubble(originalCenter, size: originalSize, start: returningControllerView.center)
        bubble.layer.cornerRadius = bubble.frame.size.height / 2
        bubble.backgroundColor = UIColor.white
        bubble.center = returningControllerView.center
        bubble.center.y = bubble.center.y
        containerView.addSubview(toControllerView)
        containerView.addSubview(bubble)
        containerView.addSubview(returningControllerView)

        UIView.animate(withDuration: duration, delay: 0.8, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseIn, animations: {
            self.bubble.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            returningControllerView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            returningControllerView.center = self.bubble.center
            returningControllerView.alpha = 0.0
            self.bubble.alpha = 0.9
            
        }, completion: { (_) in
            returningControllerView.center = originalCenter
            returningControllerView.removeFromSuperview()
            self.bubble.removeFromSuperview()
            transitionContext.completeTransition(true)
            
            fromViewController?.endAppearanceTransition()
            toViewController?.endAppearanceTransition()
        })
    }
}

private extension BubbleTransition {
    func frameForBubble(_ originalCenter: CGPoint, size originalSize: CGSize, start: CGPoint) -> CGRect {
        let lengthX = fmax(start.x, originalSize.width - start.x)
        let lengthY = fmax(start.y, originalSize.height - start.y)
        let offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2
        let size = CGSize(width: offset, height: offset)
        
        return CGRect(origin: CGPoint.zero, size: size)
    }
}


