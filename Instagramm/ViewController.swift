//
//  ViewController.swift
//  Instagramm
//
//  Created by Aziz on 16/1/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var stories = ["01", "02", "03",]
    
    private lazy var collectionStories: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        view.register(Insta.self, forCellWithReuseIdentifier: "Insta")
        return view
    }()
    
    private lazy var lenta: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "00")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        
        view.addSubview(collectionStories)
        collectionStories.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.frame.height * 0.04)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.15)
        }
        view.addSubview(lenta)
        lenta.snp.makeConstraints { make in
            make.top.equalTo(collectionStories.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func collectionView(_ storiesCollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(
            width: (view.frame.width / 1) - 15,
            height: (view.frame.height / 2.9) - 165)
    }
    
    func collectionView(_ storiesCollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ storiesCollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ storiesCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ storiesCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: "Insta", for: indexPath) as! Insta
        cell.instaCell.image = UIImage(named: String(stories[index]))
        return cell
    }
}


