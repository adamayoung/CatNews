import Foundation

public struct StoryCollectionWeblink: Identifiable, Decodable {

    public let id: String
    public let headline: String
    public let weblinkUrl: URL
    public let creationDate: Date
    public let modifiedDate: Date
    public let teaserImage: TeaserImage

}
