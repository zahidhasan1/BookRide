//
//  NiblessView.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import UIKit
open class NiblessView: UIView{
    
    //MARK: - Method
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable,
      message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
    )
    
    public required init?(coder aDecoder: NSCoder) {
      fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
}
