//
//  Gallery.swift
//  TestTaskiOSDeveloperITRexGroup
//
//  Created by 1 on 21.03.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import UIKit
import RealmSwift


private let firstImg = UIImage(named: "img_1")
private let firstData = UIImageJPEGRepresentation(firstImg!, 1.0)
private let firstPhoto = Photo(photo: "First", lat: 53, long: 28, imageData: firstData! as NSData)




class Gallery: UICollectionViewController {
    
    private var realm: Realm!
    private var indexR: Int!
    
    var newPhoto: Photo! {
        didSet {
            if newPhoto != nil {
                try! realm.write {
                    realm.add(newPhoto)
                    self.collectionView?.reloadData()
                }
            }
        }
    }
    
    
    private var photoArr: Results<Photo> {
        get {
            return realm.objects(Photo.self)
        }
    }
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
    }
    
    
    
    

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        makeAlert()
        indexR = indexPath.row
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! GalleryCell
        cell.imageInCell.image = UIImage(data: photoArr[indexPath.row].imageData as Data)
        return cell
    }
    
    
    
    
    
    
    // MARK: Alert
    func makeAlert () {
        let alert = UIAlertController(title: "Actions", message: "", preferredStyle: .alert)
        //Delete
        let alertDelete = UIAlertAction(title: "Delete", style: .destructive) { action in
            
            let delitPhoto = self.photoArr[self.indexR]
            try! self.realm.write {
                self.realm.delete(delitPhoto)
            }
            
            self.collectionView?.reloadData()
        }
        //Map
        let alertMap = UIAlertAction(title: "Show on Map", style: .default) { action in
            self.performSegue(withIdentifier: "goToMap", sender: self)
        }
        //Open
        let alertDetails = UIAlertAction(title: "Open", style: .default) { action in
            self.performSegue(withIdentifier: "goToDetails", sender: self)
        }
        
        alert.addAction(alertDetails)
        alert.addAction(alertMap)
        alert.addAction(alertDelete)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            let destVC = segue.destination as! DetailsVC
            destVC.arrImage = photoArr[indexR]
        } else if segue.identifier == "goToMap" {
            let destVC = segue.destination as! MapVC
            destVC.arrImage = photoArr[indexR]
            destVC.index = indexR 
        }
     }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
    }
    
}
