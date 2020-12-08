//
//  MainStoryTableViewCell.swift
//  CatNews
//
//  Created by Adam Young on 07/12/2020.
//

import SDWebImage
import UIKit

final class MainStoryTableViewCell: UITableViewCell {

    var viewModel: StoryListStoryViewModeling? {
        didSet {
            storyImageView.sd_setImage(with: viewModel?.imageURL)
            storyImageView.accessibilityLabel = viewModel?.imageAccessibilityText
            headlineLabel.text = viewModel?.headline
            teaserTextLabel.text = viewModel?.teaserText
        }
    }

    private lazy var storyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.secondarySystemFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var headlineLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        return label
    }()

    private lazy var teaserTextLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 3
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(storyImageView)
        storyImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([
            storyImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            storyImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            storyImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            storyImageView.heightAnchor.constraint(equalToConstant: 250)
        ])

        contentView.addSubview(headlineLabel)
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([
            headlineLabel.topAnchor.constraint(equalToSystemSpacingBelow: storyImageView.bottomAnchor, multiplier: 1),
            headlineLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            headlineLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])

        contentView.addSubview(teaserTextLabel)
        teaserTextLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([
            teaserTextLabel.topAnchor.constraint(equalToSystemSpacingBelow: headlineLabel.bottomAnchor, multiplier: 1),
            teaserTextLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            teaserTextLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            teaserTextLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
