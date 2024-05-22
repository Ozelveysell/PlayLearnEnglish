
import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var closeImageView: UIImageView!
    
    @IBOutlet weak var newLabelButton: UILabel!
    
    @IBOutlet weak var wordLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var continueLabelButton: UILabel!
    
    // wordList'i karıştır
    var shuffledWordList = wordList.shuffled()

    var randomWords: [Word] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isUserInteractionEnabled = true
        
        
        continueLabelButton.layer.cornerRadius = 10
        continueLabelButton.layer.masksToBounds = true
        
        let closeImageTapGesture = UITapGestureRecognizer(target: self, action: #selector(closeImageTapped))
        closeImageView.isUserInteractionEnabled = true
        closeImageView.addGestureRecognizer(closeImageTapGesture)

        
        let continueLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(continueLabelTapped))
        continueLabelButton.isUserInteractionEnabled = true
        continueLabelButton.addGestureRecognizer(continueLabelTapGesture)
        
        let newLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(newLabelTapped))
        newLabelButton.isUserInteractionEnabled = true
        newLabelButton.addGestureRecognizer(newLabelTapGesture)
       
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                  layout.scrollDirection = .vertical
                  layout.minimumInteritemSpacing = 0
                  layout.minimumLineSpacing = 0
              }
        fillRandomWords()

    }
    
    @objc func closeImageTapped() {
        let alert = UIAlertController(title: "Uyarı!", message: "Çıkmak istediğine emin misin?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Evet", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "toVC", sender: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Hayır", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }

    @objc func newLabelTapped() {
        // Yeni bir rastgele kelime listesi oluştur
          shuffledWordList = wordList.shuffled()
        fillRandomWords()
     
        // Tüm koleksiyon hücrelerinin arka plan rengini beyaza ayarla
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.contentView.backgroundColor = UIColor.white
            }
        }
          // Koleksiyon görünümünü yenile
          collectionView.reloadData()
    }

    @objc func continueLabelTapped() {
        // Yeni bir rastgele kelime listesi oluştur
          shuffledWordList = wordList.shuffled()
        fillRandomWords()
     
        // Tüm koleksiyon hücrelerinin arka plan rengini beyaza ayarla
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.contentView.backgroundColor = UIColor.white
            }
        }
          // Koleksiyon görünümünü yenile
          collectionView.reloadData()
    }
    
    func fillRandomWords() {
           // Eğer wordList'ten daha az kelime varsa, tüm listeyi kullan
           if shuffledWordList.count <= 4 {
               randomWords = shuffledWordList
           } else {
               // Karıştırılmış listeden ilk 4 kelimeyi seç
               randomWords = Array(shuffledWordList.prefix(4))
           }
           
           // Rastgele bir kelime seçme ve wordLabel'a yerleştirme
           if let selectedWord = randomWords.randomElement() {
               wordLabel.text = selectedWord.engWord
           }
       }
    
}
extension MainPageViewController:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        
        // Eğer wordList'ten daha az kelime varsa, tüm listeyi kullan
        if shuffledWordList.count <= 4 {
            randomWords = shuffledWordList
        } else {
            // Karıştırılmış listeden ilk 4 kelimeyi seç
            randomWords = Array(shuffledWordList.prefix(4))
        }

        // Seçilen kelimeleri koleksiyon hücrelerine yerleştirme
        if indexPath.item < randomWords.count {
            let word = randomWords[indexPath.item]
            cell.labelCell.text = word.turkishWord
            cell.imageViewCell.image = word.image
        } else {
            // Koleksiyon hücresi sayısından fazla kelime yoksa, yerine Placeholder koy
            cell.labelCell.text = "Placeholder"
            cell.imageViewCell.image = UIImage(named: "placeholder")
        }
       
        // Rastgele bir kelime seçme ve listeden kaldırma
        if let selectedWord = randomWords.randomElement() {
            wordLabel.text = selectedWord.engWord
         
        }
      
        return cell

    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // Koleksiyon görünümünde sadece 1 satır olacak
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Koleksiyon görünümünde her satırda 2 hücre olacak şekilde hücre boyutları ayarlanır
        let collectionViewWidth = collectionView.frame.width
        let collectionViewHeight = collectionView.frame.height
        let cellWidth = (collectionViewWidth - 15) / 2
        let cellHeight = (collectionViewHeight - 50) / 2
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return randomWords.count
      }
    
    
}
extension MainPageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.item < randomWords.count else {
            print("Error: Index out of bounds")
            return
        }

        let selectedWord = randomWords[indexPath.item]
        let isCorrect = (selectedWord.engWord == wordLabel.text)
        
       
        
        if isCorrect {
            // Seçilen hücreye yeşil arka plan rengi verme
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.contentView.backgroundColor = UIColor.green
            }

         
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                let alert = UIAlertController(title: "Tebrikler!", message: "Doğru cevap!", preferredStyle: .alert)
            //    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        alert.dismiss(animated: true, completion: nil)
                        
                       
                    }
                }
            }        } else {
            // Seçilen hücreye kırmızı arka plan rengi verme
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.contentView.backgroundColor = UIColor.red
            }

        
        }

    }
}
