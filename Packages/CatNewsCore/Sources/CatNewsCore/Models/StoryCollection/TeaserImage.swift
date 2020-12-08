import Foundation

public struct TeaserImage {

    public let links: Links
    public let accessibilityText: String

}

extension TeaserImage: Decodable {

    private enum CodingKeys: String, CodingKey {

        case links = "_links"
        case accessibilityText

    }

}

extension TeaserImage {

    public struct Links: Decodable {

        public let url: LinkURL

    }

}

extension TeaserImage.Links {

    public struct LinkURL: Decodable {

        public let href: URL
        public let templated: Bool
        public let type: String

    }

}
