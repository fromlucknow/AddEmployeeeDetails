//
//  DesignableUitextfield.swift
//  ClubBooking
//
//  Created by vikas srivastava on 06/07/18.
//  Copyright © 2018 vikas srivastava. All rights reserved.
//

import UIKit


@IBDesignable class Designabletextfield: UITextField {

    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet{
              self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var leftImage : UIImage? {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var leftPadding : CGFloat = 0
    {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var rightPadding : CGFloat = 0
        {
        didSet{
            rightupdateView()
        }
    }
    
    func updateView()  {
        if let image = leftImage{
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            imageView.tintColor = tintColor
            var width = leftPadding + 20
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line
            {
                width = width+5
            }
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            leftView = view
        }else
        {
            var width = leftPadding
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line
            {
                width = width+5
            }
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
           // view.addSubview(imageView)
            leftView = view
            leftViewMode = .always
        }
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "" , attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    @IBInspectable var RightImage : UIImage? {
        didSet{
            rightupdateView()
        }
    }
    
    
    func rightupdateView()  {
        if let image = RightImage{
            rightViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: rightPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            imageView.tintColor = tintColor
            var width = rightPadding + 20
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line
            {
                width = width+5
            }
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            rightView = view
        }else
        {
            rightViewMode = .always
        }
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "" , attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    let border = CALayer()
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.5 {
        didSet {
            setup()
        }
    }
    
    func setup() {
        border.borderColor = self.borderColor?.cgColor
        
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width:  self.frame.size.width, height: self.frame.size.height)
    }
    
//    @IBInspectable var placeHolderColor: UIColor? {
//    get {
//    return self.placeHolderColor
//    }
//    set {
//    attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
//    }
//    }

}

