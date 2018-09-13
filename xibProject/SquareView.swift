import UIKit

class SquareView: UIView {
    
    var view: UIImageView?
    
    class func instanceFromNib() -> SquareView {
        return UINib(nibName: "SquareView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SquareView
    }

    @IBAction func okButtonPressed(_ sender: UIButton) {
        self.removeFromSuperview()
    }
}
