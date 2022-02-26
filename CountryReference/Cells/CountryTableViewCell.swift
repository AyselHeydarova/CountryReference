//
//  CountryTableViewCell.swift
//  CountryReference
//
//  Created by Aysel Heydarova on 25.02.22.
//

import UIKit
import SnapKit
import SDWebImage

class CountryTableViewCell: UITableViewCell {

    private lazy var flagImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.font =  UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    private lazy var nativeLanguageLabel: UILabel = {
        var label = UILabel()
        label.font =  UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews()
        makeConstraints()
    }
    private func addSubviews() {
        self.addSubview(flagImageView)
        self.addSubview(titleLabel)
        self.addSubview(nativeLanguageLabel)
    }

    private func makeConstraints() {
        flagImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(16)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(flagImageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-16)
        }

        nativeLanguageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(flagImageView.snp.trailing).offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
    }

    func configure(flag: String, title: String, language: String) {
        flagImageView.sd_setImage(with: URL(string: flag), completed: nil)
        titleLabel.text = title
        nativeLanguageLabel.text = language
        layoutIfNeeded()
    }
}
