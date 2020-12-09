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

    private lazy var storyView = StoryView()
    private lazy var loadingView = LoadingView(message: "Loading story")

    init(viewModel: StoryDetailViewModeling) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UIScrollView()
        view.accessibilityLabel = "Story"
        view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let view = self.view as? UIScrollView else {
            return
        }

        view.addSubview(storyView)
        storyView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            storyView.topAnchor.constraint(equalTo: view.topAnchor),
            storyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            storyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            storyView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            storyView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        isLoading(true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        fetchStory()
    }

}

extension StoryDetailViewController {

    private func fetchStory() {
        guard viewModel.story == nil else {
            return
        }

        view.subviews.forEach { subview in
            if subview is ErrorView {
                subview.removeFromSuperview()
            }
        }

        isLoading(true)
        viewModel.fetch { [weak self] in
            guard let self = self else {
                return
            }

            self.isLoading(false)

            if let error = self.viewModel.fetchError {
                self.displayError(error)
                return
            }

            if let story = self.viewModel.story {
                self.updateUI(with: story)
            }
        }
    }

    private func updateUI(with storyViewModel: StoryViewModeling) {
        title = storyViewModel.headline
        storyView.viewModel = storyViewModel
    }

    private func displayError(_ error: Error) {
        let errorView: ErrorView = {
            if error is StoryDetailViewModel.StoryNotFoundError {
                return ErrorView(
                    title: NSLocalizedString("Not found", comment: "Not found"),
                    message: NSLocalizedString("Looks like a cat has made off with this story",
                                               comment: "Looks like a cat has made off with this story")
                )
            }

            return ErrorView(
                title: NSLocalizedString("What a CATastrophe", comment: "What a CATastrophe"),
                message: NSLocalizedString("There's been a problem fetching this news article",
                                           comment: "There's been a problem fetching this news article"),
                retryHandler: fetchStory
            )
        }()

        view.addSubview(errorView)
        errorView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            errorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func isLoading(_ loading: Bool) {
        if !loading {
            if loadingView.superview != nil {
                loadingView.removeFromSuperview()
            }

            return
        }

        guard loadingView.superview == nil else {
            return
        }

        view.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            loadingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
