import Foundation
import os.log

struct HTTPMockClient: HTTPClient {

    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder

    init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = .catNews) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }

    func get<Response: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<Response, Error>) -> Void) {
        let url = endpoint.url
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        os_log("GET %@", log: .api, url.absoluteString)
        urlSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                os_log("Error: GET %@ - %@", log: .api, type: .error, url.absoluteString, error.localizedDescription)
                completion(.failure(error))
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 404 {
                os_log("Not found: GET %@", log: .api, type: .error, url.absoluteString)
                completion(.failure(NotFoundError()))
                return
            }

            guard let data = data else {
                os_log("Not found: GET %@ - not response data", log: .api, type: .error, url.absoluteString)
                completion(.failure(NotFoundError()))
                return
            }

            do {
                let result = try jsonDecoder.decode(Response.self, from: data)
                completion(.success(result))
            } catch let error {
                os_log("Error: GET %@ - %@", log: .api, type: .error, url.absoluteString, error.localizedDescription)
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
