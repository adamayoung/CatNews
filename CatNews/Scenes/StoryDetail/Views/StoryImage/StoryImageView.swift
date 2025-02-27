//
//  StoryImageView.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import SDWebImage
import UIKit

final class StoryImageView: UIView {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .secondarySystemFill
        imageView.sd_imageTransition = SDWebImageTransition.fade
        return imageView
    }()

    init(viewModel: StoryImageViewModeling) {
        super.init(frame: .zero)

        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])

        imageView.sd_setImage(with: viewModel.url)
        imageView.accessibilityLabel = viewModel.accessibilityText
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
