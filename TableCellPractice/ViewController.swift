//
//  ViewController.swift
//  TableCellPractice
//
//  Created by Luis Santiago  on 11/25/17.
//  Copyright © 2017 Luis Santiago. All rights reserved.
//

import UIKit

class CustomCollectionViewController : UICollectionViewController  , UICollectionViewDelegateFlowLayout{

    let cellId = "cellId";
    let names = ["Mark", "Steve" , "Carl" , "Luis", "Elon musk"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "My tableview";
        navigationController?.navigationBar.prefersLargeTitles = true;
        collectionView?.backgroundColor = .white;
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: cellId);
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count;
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCell;
        cell.customLabel.text = names[indexPath.item];
        return cell;
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200);
    }
}

class CustomCell : UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame);
        setUpViews();
    }
    
    let customLabel:UILabel = {
        let label = UILabel();
        label.text = "Custom label";
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        backgroundColor = .blue;
        addSubview(customLabel);
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":customLabel]));
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":customLabel]));
    }
}

