import Foundation

public final class NewsMockStore: NewsStore {

    private static let storyCollection = StoryCollection(
        title: "Sky Cat News",
        data: [
            .story(
                StoryCollectionStory(
                    id: "1",
                    headline: "Funny Cats Scared Of Random Things 1",
                    teaserText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    creationDate: Date(),
                    modifiedDate: Date(),
                    teaserImage: TeaserImage(
                        links: TeaserImage.Links(
                            url: TeaserImage.Links.LinkURL(
                                href: URL(string: "https://i.ytimg.com/vi/zPCZWn_iWb0/maxresdefault.jpg")!,
                                templated: true,
                                type: "image/jpeg"
                            )
                        ),
                        accessibilityText: "Funny Cats Scared Of Random Things"
                    )
                )
            ),
            .story(
                StoryCollectionStory(
                    id: "2",
                    headline: "Funny Cats Scared Of Random Things 2",
                    teaserText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    creationDate: Date(),
                    modifiedDate: Date(),
                    teaserImage: TeaserImage(
                        links: TeaserImage.Links(
                            url: TeaserImage.Links.LinkURL(
                                href: URL(string: "https://i.ytimg.com/vi/zPCZWn_iWb0/maxresdefault.jpg")!,
                                templated: true,
                                type: "image/jpeg"
                            )
                        ),
                        accessibilityText: "Funny Cats Scared Of Random Things"
                    )
                )
            ),
            .story(
                StoryCollectionStory(
                    id: "3",
                    headline: "Funny Cats Scared Of Random Things 3",
                    teaserText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    creationDate: Date(),
                    modifiedDate: Date(),
                    teaserImage: TeaserImage(
                        links: TeaserImage.Links(
                            url: TeaserImage.Links.LinkURL(
                                href: URL(string: "https://i.ytimg.com/vi/zPCZWn_iWb0/maxresdefault.jpg")!,
                                templated: true,
                                type: "image/jpeg"
                            )
                        ),
                        accessibilityText: "Funny Cats Scared Of Random Things"
                    )
                )
            ),
            .story(
                StoryCollectionStory(
                    id: "4",
                    headline: "Funny Cats Scared Of Random Things 4",
                    teaserText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    creationDate: Date(),
                    modifiedDate: Date(),
                    teaserImage: TeaserImage(
                        links: TeaserImage.Links(
                            url: TeaserImage.Links.LinkURL(
                                href: URL(string: "https://i.ytimg.com/vi/zPCZWn_iWb0/maxresdefault.jpg")!,
                                templated: true,
                                type: "image/jpeg"
                            )
                        ),
                        accessibilityText: "Funny Cats Scared Of Random Things"
                    )
                )
            ),
            .story(
                StoryCollectionStory(
                    id: "5",
                    headline: "Funny Cats Scared Of Random Things 5",
                    teaserText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    creationDate: Date(),
                    modifiedDate: Date(),
                    teaserImage: TeaserImage(
                        links: TeaserImage.Links(
                            url: TeaserImage.Links.LinkURL(
                                href: URL(string: "https://i.ytimg.com/vi/zPCZWn_iWb0/maxresdefault.jpg")!,
                                templated: true,
                                type: "image/jpeg"
                            )
                        ),
                        accessibilityText: "Funny Cats Scared Of Random Things"
                    )
                )
            ),
            .story(
                StoryCollectionStory(
                    id: "6",
                    headline: "Funny Cats Scared Of Random Things 6",
                    teaserText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    creationDate: Date(),
                    modifiedDate: Date(),
                    teaserImage: TeaserImage(
                        links: TeaserImage.Links(
                            url: TeaserImage.Links.LinkURL(
                                href: URL(string: "https://i.ytimg.com/vi/zPCZWn_iWb0/maxresdefault.jpg")!,
                                templated: true,
                                type: "image/jpeg"
                            )
                        ),
                        accessibilityText: "Funny Cats Scared Of Random Things"
                    )
                )
            ),
            .story(
                StoryCollectionStory(
                    id: "7",
                    headline: "Funny Cats Scared Of Random Things 7",
                    teaserText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    creationDate: Date(),
                    modifiedDate: Date(),
                    teaserImage: TeaserImage(
                        links: TeaserImage.Links(
                            url: TeaserImage.Links.LinkURL(
                                href: URL(string: "https://i.ytimg.com/vi/zPCZWn_iWb0/maxresdefault.jpg")!,
                                templated: true,
                                type: "image/jpeg"
                            )
                        ),
                        accessibilityText: "Funny Cats Scared Of Random Things"
                    )
                )
            ),
            .story(
                StoryCollectionStory(
                    id: "8",
                    headline: "Funny Cats Scared Of Random Things 8",
                    teaserText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    creationDate: Date(),
                    modifiedDate: Date(),
                    teaserImage: TeaserImage(
                        links: TeaserImage.Links(
                            url: TeaserImage.Links.LinkURL(
                                href: URL(string: "https://i.ytimg.com/vi/zPCZWn_iWb0/maxresdefault.jpg")!,
                                templated: true,
                                type: "image/jpeg"
                            )
                        ),
                        accessibilityText: "Funny Cats Scared Of Random Things"
                    )
                )
            )
        ])

    public init() { }

    public func fetchStoryCollection(completion: @escaping (Result<StoryCollection, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(Self.storyCollection))
        }
    }

    public func fetchStory(withID id: String, completion: @escaping (Result<Story?, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(nil))
        }
    }

}
