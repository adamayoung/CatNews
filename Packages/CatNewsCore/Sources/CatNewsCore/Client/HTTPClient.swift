import Foundation

protocol HTTPClient {

    func get<Response: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<Response, Error>) -> Void)

}
