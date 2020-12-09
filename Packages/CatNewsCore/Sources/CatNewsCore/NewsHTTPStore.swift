import Foundation

public final class NewsHTTPStore: NewsStore {

    public static let shared = NewsHTTPStore()

    private let client: HTTPClient

    private init(client: HTTPClient = HTTPMockClient()) {
        self.client = client
    }

    public func fetchStoryCollection(completion: @escaping (Result<StoryCollection, Error>) -> Void) {
        client.get(.newsList) { (result: Result<StoryCollection, Error>) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }

    public func fetchStory(withID id: String, completion: @escaping (Result<Story?, Error>) -> Void) {
        client.get(.story(storyID: id)) { (result: Result<Story, Error>) in
            DispatchQueue.main.async {
                do {
                    completion(.success(try result.get()))
                } catch let error {
                    if error is NotFoundError {
                        completion(.success(nil))
                        return
                    }

                    completion(.failure(error))
                }
            }
        }
    }

}
