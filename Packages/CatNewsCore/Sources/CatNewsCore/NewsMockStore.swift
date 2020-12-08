import Foundation

public final class NewsMockStore: NewsStore {

    public init() { }

    public func fetchStoryCollection(completion: @escaping (Result<StoryCollection, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(storyCollection))
        }
    }

    public func fetchStory(withID id: String, completion: @escaping (Result<Story?, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let story = stories[id] ?? stories["1"]
            completion(.success(story))
        }
    }

}

private let storyCollection = StoryCollection(
    title: "Sky Cat News",
    data: [
        .story(
            StoryCollectionStory(
                id: "1",
                headline: "Canterbury mystery: Is it a cat or is it a panther?",
                teaserText: "Canterbury's big cat mystery has deepened after another sighting of an animal that may be "
                    + "a cat or may be a panther cub.",
                creationDate: Date(timeIntervalSinceNow: -16000),
                modifiedDate: Date(timeIntervalSinceNow: -16000),
                teaserImage: TeaserImage(
                    links: TeaserImage.Links(
                        url: TeaserImage.Links.LinkURL(
                            href: URL(string: "https://i.ytimg.com/vi/zPCZWn_iWb0/maxresdefault.jpg")!,
                            templated: true,
                            type: "image/jpeg"
                        )
                    ),
                    accessibilityText: "Scared cat"
                )
            )
        )
        ,
        .story(
            StoryCollectionStory(
                id: "2",
                headline: "'Hero' dog-walker saves cat from drowning after animal is flung into dyke from moving car",
                teaserText: "A drowning cat thrown from a moving car into a South Yorkshire dyke was only saved after "
                    + "an onlooker dived into the water to rescue the animal.",
                creationDate: Date(timeIntervalSinceNow: -36000),
                modifiedDate: Date(timeIntervalSinceNow: -36000),
                teaserImage: TeaserImage(
                    links: TeaserImage.Links(
                        url: TeaserImage.Links.LinkURL(
                            href: URL(string: "https://static.independent.co.uk/2020/12/05/11/Honey.jpg")!,
                            templated: true,
                            type: "image/jpeg"
                        )
                    ),
                    accessibilityText: "Honey"
                )
            )
        ),
        .story(
            StoryCollectionStory(
                id: "3",
                headline: "How to get your cat to like you, according to science",
                teaserText: "Cats may be notoriously difficult to befriend, but a new study has found that there might "
                    + "be a simple trick to solving this problem.",
                creationDate: Date(timeIntervalSinceNow: -360000),
                modifiedDate: Date(timeIntervalSinceNow: -360000),
                teaserImage: TeaserImage(
                    links: TeaserImage.Links(
                        url: TeaserImage.Links.LinkURL(
                            href: URL(string: "https://static.independent.co.uk/2020/10/08/10/iStock-1216783007.jpg")!,
                            templated: true,
                            type: "image/jpeg"
                        )
                    ),
                    accessibilityText: "Happy Cat"
                )
            )
        )
    ]
)

private let stories = [
    "1": Story(
        id: "1",
        headline: "Canterbury mystery: Is it a cat or is it a panther?",
        heroImage: HeroImage(
            imageUrl: URL(string: "https://i.ytimg.com/vi/zPCZWn_iWb0/maxresdefault.jpg")!,
            accessibilityText: "Scared cat"
        ),
        creationDate: Date(),
        modifiedDate: Date(),
        contents: [
            .paragraph(
                StoryParagraph(text: "Canterbury's big cat mystery has deepened after another sighting of an animal "
                                + "that may be a cat or may be a panther cub.")
            ),
            .paragraph(
                StoryParagraph(text: "Social influencer Bare Kiwi, aka Kyle Mulinder, has caught the black animal on "
                                + "video while interviewing double-amputee Everest mountaineer Mark Inglis in the "
                                + "Hanmer Springs Heritage Forest.")
            ),
            .image(
                StoryImage(
                    url: URL(string: "https://d.ibtimes.co.uk/en/full/400105/large-panther-like-cat-was-caught-camera-it-ate-prey-murhill-woods-wiltshire-herbert-smith.jpg")!,
                    accessibilityText: "Panther"
                )
            ),
            .paragraph(
                StoryParagraph(text: "\"It was about 50 metres away, strolling in the other direction but it sat down, "
                                + "turned and looked into my soul,\" Mulinder said in a statement released by Visit "
                                + "Hurunui.")
            ),
            .paragraph(
                StoryParagraph(text: "\"It was a very emotional experience. I was fearing for my life – it was a very "
                                + "close call.\"")
            )
        ]
    ),
    "2": Story(
        id: "2",
        headline: "'Hero' dog-walker saves cat from drowning after animal is flung into dyke from moving car",
        heroImage: HeroImage(
            imageUrl: URL(string: "https://static.independent.co.uk/2020/12/05/11/Honey.jpg")!,
            accessibilityText: "Honey"
        ),
        creationDate: Date(),
        modifiedDate: Date(),
        contents: [
            .paragraph(
                StoryParagraph(text: "A drowning cat thrown from a moving car into a South Yorkshire dyke was only "
                                + "saved after an onlooker dived into the water to rescue the animal.")
            ),
            .paragraph(
                StoryParagraph(text: "The long-haired female ginger was chucked from a black Honda into Mill Dyke in "
                                + " the town of Doncaster.")
            ),
            .paragraph(
                StoryParagraph(text: "But she survived the ordeal after a passing dog-walker plunged into the shallow "
                                + "water to fish her out.")
            ),
            .paragraph(
                StoryParagraph(text: "\"Had he not intervened I am sure she would have not survived,\" said Graeme "
                                + "Petty, an animal rescuer inspector with the RSPCA. \"His heroic actions saved her "
                                + "life.\"")
            ),
            .image(
                StoryImage(
                    url: URL(string: "https://i.ytimg.com/vi/ny5vGbTfB8c/maxresdefault.jpg")!,
                    accessibilityText: "Honey jumping"
                )
            ),
            .paragraph(
                StoryParagraph(text: "He added: \"For a person to callously throw a neglected cat into water to an "
                                + "almost certain death is absolutely awful.")
            ),
            .paragraph(
                StoryParagraph(text: "\"There is about 15ft of land before you reach the water – so it seems someone "
                                + "has made a real effort to try and drown her.\"")
            ),
            .paragraph(
                StoryParagraph(text: "The animal charity is now looking after the cat – which staff have nicknamed "
                                + "Honey – at its Doncaster and Rotherham branch in Bawtry. It says it is is trying to "
                                + "trace the towner.")
            )
        ]
    ),
    "3": Story(
        id: "3",
        headline: "How to get your cat to like you, according to science",
        heroImage: HeroImage(
            imageUrl: URL(string: "https://static.independent.co.uk/2020/10/08/10/iStock-1216783007.jpg")!,
            accessibilityText: "Happy Cat"
        ),
        creationDate: Date(timeIntervalSinceNow: -36000),
        modifiedDate: Date(timeIntervalSinceNow: -36000),
        contents: [
            .paragraph(
                StoryParagraph(text: "Cats may be notoriously difficult to befriend, but a new study has found that "
                                + "there might be a simple trick to solving this problem.")
            ),
            .paragraph(
                StoryParagraph(text: "According to research published in Scientific Reports, cats are one of several "
                                + "animals that respond to the so-called Duchenne smile, which is defined as a natural "
                                + "smile that sees people raise the corners of their mouth and create crow’s feet "
                                + "around the eyes.")
            ),
            .paragraph(
                StoryParagraph(text: "When humans smile at their cats in this way and blink their eyes in slow motion, "
                                + "the cat is likely to respond positively, the study, conducted by researchers at the "
                                + "Universities of Sussex and Portsmouth found.")
            ),
            .paragraph(
                StoryParagraph(text: "The cats were also found to mirror the humans’ slow-blink.")
            ),
            .image(
                StoryImage(
                    url: URL(string: "https://static.boredpanda.com/blog/wp-content/uploads/2015/09/Happy-Cats__880.jpg")!,
                    accessibilityText: "Very happy cat"
                )
            ),
            .paragraph(
                StoryParagraph(text: "The researchers conducted two experiments to reach their findings.In the first, "
                                + "they looked at 21 cats from 14 different households.")
            ),
            .paragraph(
                StoryParagraph(text: "They found that these cats were more likely to respond positively to their "
                                + "owners after they slow-blinked at them compared to when they remained passive.")
            ),
            .paragraph(
                StoryParagraph(text: "In the second experiment,  45 cats aged between one and 17 were examined.")
            ),
            .image(
                StoryImage(
                    url: URL(string: "https://static.boredpanda.com/blog/wp-content/uploads/2016/04/smiling-animals-8-570e0c1b0703c__605.jpg")!,
                    accessibilityText: "Smiling cat"
                )
            ),
            .paragraph(
                StoryParagraph(text: "They were found to be more likely to approach the outstretched hand of a "
                                + "stranger after they had slow-blinked at them, compared to when the stranger "
                                + "maintained a neutral expression.")
            ),
            .paragraph(
                StoryParagraph(text: "\"Taken together, the study shows that this slow blinking technique can provide "
                                + "a form of positive communication between cats and humans,\" the researchers wrote.")
            )
        ]
    )
]
