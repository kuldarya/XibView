import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wallpaperImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    let coverLayer = CALayer()
    
    var coordinateX = CGFloat(300)
    var coordinateY = CGFloat(-400)
    var width = CGFloat(300)
    var height = CGFloat(300)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setScreenUI()
    }

    @IBAction func startButtonPressed(_ sender: UIButton) {
        self.animateSquareViewFrame()
        self.darkenFullScreen()
        self.coverLayer.opacity = 0.4
    }
    
    private func setScreenUI() {
        self.wallpaperImageView.image = #imageLiteral(resourceName: "iphonewallpaper")
        self.startButton.layer.cornerRadius = 7
    }
    
    private func animateSquareViewFrame() {
        let squareView = SquareView.instanceFromNib()
        squareView.frame = CGRect(x: self.coordinateX, y: self.coordinateY, width: self.width, height: self.height)
        self.view.addSubview(squareView)
        
        UIView.animate(withDuration: 2) {
            squareView.frame.origin.x = (self.view.frame.width - self.width) / 2
            squareView.frame.origin.y = (self.view.frame.height - self.height) / 2
        }
    }
    
    private func darkenFullScreen() {
        self.coverLayer.frame = self.wallpaperImageView.bounds
        self.coverLayer.masksToBounds = true
        self.coverLayer.backgroundColor = UIColor.black.cgColor
        self.coverLayer.opacity = 0.0
        self.wallpaperImageView.layer.addSublayer(coverLayer)
    }
   
}



