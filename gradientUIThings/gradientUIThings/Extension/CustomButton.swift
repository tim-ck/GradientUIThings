import UIKit

final class CustomButton {



    static func getButton(width: CGFloat = 311, height: CGFloat = 35,
                          fontSize: CGFloat = 13 , buttonText: String,
                          axis: NSLayoutConstraint.Axis = .vertical, onClickListener: @escaping ()-> Void,
                          titleColor: UIColor = .black) -> UIView {
        let container = UIView()
        let button = UIButton(type: .system)

        container.translatesAutoresizingMaskIntoConstraints = false
        container.addGestureRecognizer(BindableGestureRecognizer {
            onClickListener()
        })

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(titleColor, for: .normal)
        button.setTitle(buttonText, for: .normal)
        //button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: height / 5, bottom: 0, right: height / 5)
        button.titleLabel?.baselineAdjustment = .alignCenters
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        button.titleLabel?.numberOfLines = 0
        button.addGestureRecognizer(BindableGestureRecognizer {
            onClickListener()
        })
        container.addSubview(button)

        if axis == .horizontal {
            container.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        NSLayoutConstraint.activate([
            container.heightAnchor.constraint(equalToConstant: height),
            button.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            button.topAnchor.constraint(equalTo: container.topAnchor),
            button.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        return container
    }
}