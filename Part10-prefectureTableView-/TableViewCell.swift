//
//  TableViewCell.swift
//  Part10-prefectureTableView-
//
//  Created by 山本ののか on 2020/12/07.
//

import UIKit

final class TableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!

    override func prepareForReuse() {
      super.prepareForReuse()
        titleLabel.text = nil
        subTitleLabel.text = nil
    }

    func configure(title: String, subTitle: String, color: UIColor) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
        contentView.backgroundColor = color
    }
}
