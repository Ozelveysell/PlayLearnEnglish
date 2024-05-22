import UIKit

class Word {
    let id: Int // Kelimenin benzersiz kimliği
    let turkishWord: String
    let engWord: String
    let image: UIImage?
    
    init(id: Int, turkish: String, english: String, imageName: String?) {
        self.id = id
        self.turkishWord = turkish
        self.engWord = english
        
        // Resim adı verilmişse, UIImage oluştur, aksi takdirde nil ata
        if let imageName = imageName {
            self.image = UIImage(named: imageName)
        } else {
            self.image = nil
        }
    }
}




// Kelime veri listesi oluştur
let wordList: [Word] = [
    Word(id: 1, turkish: "erkek çocuk", english: "boy", imageName: "boy"),
    Word(id: 2, turkish: "kız", english: "girl", imageName: "girl"),
    Word(id: 3, turkish: "elma", english: "apple", imageName: "apple"),
    Word(id: 4, turkish: "araba", english: "car", imageName: "car"),
    Word(id: 5, turkish: "motosiklet", english: "motorcycle", imageName: "motorcycle"),
    Word(id: 6, turkish: "bisiklet", english: "bicycle", imageName: "bicaycle"),
    Word(id: 7, turkish: "paten", english: "skate", imageName: "skate"),
    Word(id: 8, turkish: "muz", english: "banana", imageName: "banana"),
    Word(id: 9, turkish: "ekmek", english: "bread", imageName: "bread"),
    Word(id: 10, turkish: "makarna", english: "pasta", imageName: "pasta"),
    Word(id: 11, turkish: "üzüm", english: "grape", imageName: "grape"),
    Word(id: 12, turkish: "ananas", english: "pineapple", imageName: "pineapple"),
    Word(id: 13, turkish: "karpuz", english: "watermelon", imageName: "watermelon"),
    Word(id: 14, turkish: "kiraz", english: "cherry", imageName: "cherry"),
    Word(id: 15, turkish: "mango", english: "mango", imageName: "mango"),
    Word(id: 16, turkish: "armut", english: "pear", imageName: "pear"),
    Word(id: 17, turkish: "köpek", english: "dog", imageName: "dog"),
    Word(id: 18, turkish: "kedi", english: "cat", imageName: "cat"),
    Word(id: 19, turkish: "fil", english: "elephant", imageName: "elephant"),
    Word(id: 20, turkish: "aslan", english: "lion", imageName: "lion"),
    Word(id: 21, turkish: "kaplan", english: "tiger", imageName: "tiger"),
    Word(id: 22, turkish: "zürafa", english: "giraffe", imageName: "giraffe"),
    Word(id: 23, turkish: "maymun", english: "monkey", imageName: "monkey"),
    Word(id: 24, turkish: "ayı", english: "bear", imageName: "bear"),
    Word(id: 25, turkish: "tavşan", english: "rabbit", imageName: "rabbit"),
    Word(id: 26, turkish: "at", english: "horse", imageName: "horse"),
    Word(id: 27, turkish: "top", english: "ball", imageName: "ball"),
    Word(id: 28, turkish: "dondurma", english: "icecream", imageName: "icecream"),
    Word(id: 29, turkish: "meyve suyu", english: "juice", imageName: "juice"),
    Word(id: 30, turkish: "kitap", english: "book", imageName: "book"),
    Word(id: 31, turkish: "okul", english: "school", imageName: "school"),
    Word(id: 32, turkish: "ögretmen", english: "teacher", imageName: "teacher"),
    Word(id: 33, turkish: "masa", english: "table", imageName: "table"),
    Word(id: 34, turkish: "sandalye", english: "chair", imageName: "chair"),
    Word(id: 35, turkish: "yatak", english: "bed", imageName: "bed"),
    Word(id: 36, turkish: "sıra", english: "desk", imageName: "desk"),
    Word(id: 37, turkish: "bilgisayar", english: "computer", imageName: "computer"),
    Word(id: 38, turkish: "telefon", english: "phone", imageName: "phone"),
    Word(id: 39, turkish: "kalem", english: "pencil", imageName: "pencil"),
    Word(id: 40, turkish: "çanta", english: "bag", imageName: "bag"),
    Word(id: 41, turkish: "ayakkabı", english: "shoes", imageName: "shoes"),
    Word(id: 42, turkish: "gömlek", english: "shirt", imageName: "shirt"),
    Word(id: 43, turkish: "pantolon", english: "pants", imageName: "pants"),
   
    
    
]



