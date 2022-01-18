//
//  InstaCell.swift
//  Instagramm
//
//  Created by Aziz on 16/1/22.
//

import Foundation
import UIKit
import SnapKit


class Insta: UICollectionViewCell {

    lazy var instaCell: UIImageView = {
        let view = UIImageView()
        return view
    }()

    override func layoutSubviews() {
        addSubview(instaCell)
        instaCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}



