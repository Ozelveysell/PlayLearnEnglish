
import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    @IBOutlet weak var labelCell: UILabel!
    
    override func awakeFromNib() {
         super.awakeFromNib()
         
         // Hücreye çerçeve ekleyelim
         layer.borderWidth = 1.0
         layer.borderColor = UIColor.black.cgColor
         
         // Çerçeveyi ovalleştirelim
         layer.cornerRadius = 10.0
         layer.masksToBounds = true
        


     }
   
}
