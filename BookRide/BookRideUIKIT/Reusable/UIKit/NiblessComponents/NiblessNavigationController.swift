//
//  NiblessNavigationController.swift
//  BookRide
//
//  Created by ZEUS on 18/2/24.
//

import UIKit

open class NiblessNavigationController: UINavigationController {
    public init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable,
      message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
    )
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable,
      message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
    )
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
    }
}
