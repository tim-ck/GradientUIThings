import UIKit
extension UIImage {
    
    
    func clipGradient(colorsArr: [CGColor]!) -> UIImage { //colorsArr take star color and end color
        UIGraphicsBeginImageContextWithOptions(size, false, scale);
        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1, y: -1)
        context.setBlendMode(.normal)
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        let colors = colorsArr as CFArray
        let space = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: space, colors: colors, locations: nil)
        context.clip(to: rect, mask: cgImage!)
        context.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: size.height), options: .drawsAfterEndLocation)
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return gradientImage!
    }
    
    func applyCircleGradientToIcon(colorsArr: [CGColor]!, iconScale: CGFloat, BGsize: CGSize = CGSize(width: 27, height: 27)) -> UIImage {
        let foreground = self
        UIGraphicsBeginImageContextWithOptions(BGsize, false, scale);
        let BGrect = CGRect.init(x: 0, y: 0, width: BGsize.width, height: BGsize.height)
        let FGrect = CGRect.init(x: (BGsize.width - size.width * iconScale) / 2, y: (BGsize.height - size.height * iconScale) / 2, width: size.width * iconScale, height: size.height * iconScale)
        let background = UIImage.getCircleGradientImage(bounds: BGrect, colors: colorsArr)
        background.draw(in: BGrect)
        foreground.draw(in: FGrect)
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return gradientImage!
    }
    
    static func getCircleGradientImage(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = bounds.height / 2
        gradientLayer.colors = colors
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
