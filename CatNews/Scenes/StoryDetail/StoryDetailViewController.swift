//
//  StoryDetailViewController.swift
//  CatNews
//
//  Created by Adam Young on 07/12/2020.
//

import CatNewsCore
import UIKit

final class StoryDetailViewController: UIViewController {

    private let viewModel: StoryDetailViewModeling

    init(viewModel: StoryDetailViewModeling) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel.fetch { [weak self] in
            guard let self = self else {
                return
            }

            if let story = self.viewModel.story {
                self.updateUI(with: story)
            }
        }
    }

}

extension StoryDetailViewController {

    private func updateUI(with story: Story) {

    }

}
