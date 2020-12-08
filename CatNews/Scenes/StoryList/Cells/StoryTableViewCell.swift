//
//  StoryTableViewCell.swift
//  CatNews
//
//  Created by Adam Young on 07/12/2020.
//

import UIKit

final class StoryTableViewCell: UITableViewCell {

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
        label.numberOfLines = 2
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(storyImageView)
        storyImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([
            storyImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            storyImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            storyImageView.heightAnchor.constraint(equalToConstant: 50),
            storyImageView.widthAnchor.constraint(equalToConstant: 50)
        ])

        contentView.addSubview(headlineLabel)
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([
            headlineLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            headlineLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: storyImageView.trailingAnchor,
                                                   multiplier: 1),
            headlineLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])

        contentView.addSubview(teaserTextLabel)
        teaserTextLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([
            teaserTextLabel.topAnchor.constraint(equalToSystemSpacingBelow: headlineLabel.bottomAnchor, multiplier: 1),
            teaserTextLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: storyImageView.trailingAnchor,
                                                     multiplier: 1),
            teaserTextLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            teaserTextLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
