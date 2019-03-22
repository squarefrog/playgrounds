//: A UIKit based Playground for presenting user interface
//
// Image credits:
//
// Body of Water during Golden Hour by Sebastian Voortman
// https://www.pexels.com/photo/beach-dawn-dusk-ocean-189349/
//
// Photo of Aurora During Evening by Tobias Bjørkli
// https://www.pexels.com/photo/photo-of-aurora-during-evening-1938348/
//

import UIKit
import PlaygroundSupport

enum Image: String {
    case beach
    case aurora

    var filename: String {
        return self.rawValue + ".jpg"
    }

    var backgroundColor: UIColor {
        switch self {
        case .beach:
            return UIColor(white: 0.93, alpha: 1.0)
        case .aurora:
            return UIColor(white: 0.05, alpha: 1.0)
        }
    }
}

let image: Image = .aurora

let frame = CGRect(x: 0, y: 0, width: 600, height: 400)
let enclosingView = UIView(frame: frame)
enclosingView.backgroundColor = image.backgroundColor

let imageView = UIImageView(frame: frame)
imageView.image = UIImage(named: image.filename)
enclosingView.addSubview(imageView)

let label = UILabel(frame: frame)
label.text = image.rawValue
label.font = UIFont.systemFont(ofSize: 200, weight: .ultraLight)
label.textColor = .white
label.textAlignment = .center

enclosingView.addSubview(label)

imageView.layer.mask = label.layer

PlaygroundPage.current.liveView = enclosingView
