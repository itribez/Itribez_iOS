import Foundation


class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    func request<T: Codable>(endpoint: String, method: String, parameters: [String: Any]?, completion: @escaping (Result<T, Error>) -> Void) {
        // Create URL based on endpoint and parameters
        guard let url = createURL(endpoint: endpoint, parameters: parameters) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        // Create URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        // Set Content-Type header
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            // Encode parameters to JSON data
            if let parameters = parameters {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            }
        } catch {
            completion(.failure(error))
            return
        }

        // Assuming you're using URLSession to make the API request
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Handle the API response

            // Assuming you have a generic JSONDecoder to decode the API response
            let decoder = JSONDecoder()

            // Decode the API response data
            if let data = data {
                print(String(data: data, encoding: .utf8) ?? "Unable to convert data to string")
                do {
                    let decodedResponse = try decoder.decode(T.self, from: data)
                    completion(.success(decodedResponse))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }

    private func createURL(endpoint: String, parameters: [String: Any]?) -> URL? {
        guard var urlComponents = URLComponents(string: endpoint) else {
            return nil
        }

        // Check if the endpoint already contains a query string
        var hasQuery = urlComponents.query != nil

        if let parameters = parameters {
            // Append query items
            let queryItems = parameters.map { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }

            // If the endpoint already has a query, append the items; otherwise, set the query items
            if hasQuery {
                urlComponents.queryItems?.append(contentsOf: queryItems)
            } else {
                urlComponents.queryItems = queryItems
                hasQuery = true
            }
        }

        // If the endpoint already has a query, use the original URL; otherwise, use the modified URL
        return hasQuery ? URL(string: endpoint) : urlComponents.url
    }
}
