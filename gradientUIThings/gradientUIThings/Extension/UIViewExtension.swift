import UIKit

extension UIView{
    func applyGradient(colours: [UIColor] = [UIColor(hex: 0xD7F230),UIColor(hex: 0x009149)]) {
        applyVerticalGradient(colours: colours)
    }
    // Store layer in VC and copy following into viewDidLayoutSubView
    /*
    if btnCALayer != nil{
            buttonName.updateGradientFrame(layer: btnCALayer)
        }
    */
    func applyVerticalGradient(colours: [UIColor] = [UIColor(hex: 0xD7F230),UIColor(hex: 0x009149)]) -> CAGradientLayer  {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colours.map {
            $0.cgColor
        }
        gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 0)
        layer.insertSublayer(gradient, at: 0)
        return gradient
    }


    func applyHorizontalGradient(colours: [UIColor] = [UIColor(hex: 0xD7F230),UIColor(hex: 0x009149)]) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        gradient.colors = colours.map {
            $0.cgColor
        }
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.insertSublayer(gradient, at: 0)
        return gradient
    }

    private static let kLayerNameGradientBorder = "GradientBorderLayer"
    // Store layer in VC and copy following into viewDidLayoutSubView
    /*
    if btnCALayer != nil
            saveConfirmBtn.updateGradientBorderFrame(layer: saveConfirmBtnCALayer)
    */
    func applyGradientBorder(colors: [UIColor] = [UIColor(hex: 0xD7F230),UIColor(hex: 0x009149)]) -> (CAGradientLayer, CAShapeLayer) {
        let startPoint = CGPoint(x: 0.0, y: 0.5)
        let endPoint = CGPoint(x: 1.0, y: 0.5)
        let maskRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let existingBorder = gradientBorderLayer()
        let border = existingBorder ?? CAGradientLayer()
        border.frame = maskRect
        border.colors = colors.map {
            $0.cgColor
        }
        border.startPoint = startPoint
        border.endPoint = endPoint
        let mask = CAShapeLayer()
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = UIColor.white.cgColor
        border.mask = mask
        let exists = (existingBorder != nil)
        if !exists {
            layer.addSublayer(border)
        }
        return (border, mask)
    }

    private func gradientBorderLayer() -> CAGradientLayer? {
        let borderLayers = layer.sublayers?.filter {
            $0.name == UIView.kLayerNameGradientBorder
        }
        if borderLayers?.count ?? 0 > 1 {
            fatalError()
        }
        return borderLayers?.first as? CAGradientLayer
    }

    func updateGradientFrame(layer: CAGradientLayer) {
        let btnBounds = bounds
        layer.frame = btnBounds
        layer.cornerRadius = btnBounds.height / 2
    }

    func updateGradientBorderFrame(layer: (CAGradientLayer, CAShapeLayer), borderWidth: CGFloat = 1.5) {
        let btnBounds = bounds
        layer.0.frame = CGRect(x: btnBounds.origin.x, y: btnBounds.origin.y,
                width: btnBounds.size.width + borderWidth, height: btnBounds.size.height + borderWidth)
        let maskRect = CGRect(x: btnBounds.origin.x + borderWidth / 2, y: btnBounds.origin.y + borderWidth / 2,
                width: btnBounds.size.width - borderWidth, height: btnBounds.size.height - borderWidth)
        layer.1.path = UIBezierPath(roundedRect: maskRect, cornerRadius: (btnBounds.size.height - borderWidth) / 2).cgPath
        layer.1.lineWidth = borderWidth
    }
}