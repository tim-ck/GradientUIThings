//
//  ViewController.swift
//  gradientUIThings
//
//  Created by administrator on 20/3/2023.
//

import UIKit

class ViewController: UIViewController {
    var verticalGradientFillButton, horizontalGradientFillButton, gradientBorderButton: UIView!
    var horizontalGradientFillButtonCALayer, verticalGradientFillButtonCALayer: CAGradientLayer!
    var gradientBorderButtonCALayer: (CAGradientLayer, CAShapeLayer)!
    var stackview: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //add stackview to view
        stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        self.view.addSubview(stackview)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        //center with height of 300 and width of match superview
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackview.heightAnchor.constraint(equalToConstant: 300),
            stackview.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])

        //icon with circle gradient background
        let image = UIImage(systemName: "person")
        let icon = UIImageView(image: (image!.withTintColor(UIColor(hex: 0xfcfcfc))).applyCircleGradientToIcon(colorsArr:[UIColor(hex: 0xD7F230).cgColor,UIColor(hex: 0x009149).cgColor],iconScale: 1.1))
        icon.contentMode = .center
        stackview.addArrangedSubview(icon)

        //gradient fill button
        //vertical gradient fill button
        verticalGradientFillButton = CustomButton.getButton(buttonText: "Confirm", onClickListener: { print("confirm") }, titleColor: .white)
        stackview.addArrangedSubview(verticalGradientFillButton)
        verticalGradientFillButtonCALayer = verticalGradientFillButton.applyVerticalGradient()

       //horizontal gradient fill button
        horizontalGradientFillButton = CustomButton.getButton(buttonText: "Confirm", onClickListener: { print("confirm") }, titleColor: .white)
        stackview.addArrangedSubview(horizontalGradientFillButton)
        horizontalGradientFillButtonCALayer = horizontalGradientFillButton.applyHorizontalGradient()

        //gradient border button
        gradientBorderButton = CustomButton.getButton(buttonText: "reset", onClickListener: { print("confirm") }, titleColor: .black)
        stackview.addArrangedSubview(gradientBorderButton)
        gradientBorderButtonCALayer = gradientBorderButton.applyGradientBorder()
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //verticalGradientFillButton, horizontalGradientFillButton, gradientBorderButton
//        if verticalGradientFillButtonCALayer != nil {
            verticalGradientFillButton.updateGradientFrame(layer: verticalGradientFillButtonCALayer)
//        }
//        if horizontalGradientFillButtonCALayer != nil {
            horizontalGradientFillButton.updateGradientFrame(layer: horizontalGradientFillButtonCALayer)
//        }
//        if gradientBorderButtonCALayer != nil {
            gradientBorderButton.updateGradientBorderFrame(layer: gradientBorderButtonCALayer)
//        }

    }


}

