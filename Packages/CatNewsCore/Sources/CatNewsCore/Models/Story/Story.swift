import Foundation

public struct Story: Identifiable, Decodable {

    public let id: String
    public let headline: String
    public let heroImage: HeroImage
    public let creationDate: Date
    public let modifiedDate: Date
    public let contents: [StoryContent]

}
