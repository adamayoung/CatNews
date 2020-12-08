import Foundation

public struct StoryCollectionStory: Identifiable, Decodable {

    public let id: String
    public let headline: String
    public let teaserText: String
    public let creationDate: Date
    public let modifiedDate: Date
    public let teaserImage: TeaserImage

}
