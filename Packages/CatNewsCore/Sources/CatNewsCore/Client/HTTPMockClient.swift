import Foundation

struct HTTPMockClient: HTTPClient {

    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder

    init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = .catNews) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }

    func get<Response: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<Response, Error>) -> Void) {
        urlSession.dataTask(with: endpoint.url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NotFoundError()))
                return
            }

            do {
                let result = try jsonDecoder.decode(Response.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

}

private extension Endpoint {

    private static var baseURL: URL {
        URL(string: "https://raw.githubusercontent.com/adamayoung/CatNews/main/Packages/CatNewsCore/MockData")!
    }

    var url: URL {
        switch self {
        case .newsList:
            return Self.baseURL.appendingPathComponent("news-list.json")

        case .story(let storyID):
            return Self.baseURL.appendingPathComponent("story-\(storyID).json")
        }
    }

}
