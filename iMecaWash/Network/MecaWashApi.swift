
import Foundation
import Alamofire
import os

class MecaWashApi {
    static let baseUrlString = "http://64.202.186.215/APIMekaWash"
    static let loginProviderUrlString = "\(baseUrlString)/wamekawash/v1/loginprovider"
    static let loginCustomerUrlString = "\(baseUrlString)/wamekawash/v1/logincustomer"
    
    static func getLocals(id: Int) -> String {
        return "\(baseUrlString)/wamekawash/v4/providers/\(id)/locals"
    }
    
    static func getServices(id: Int) -> String {
        return "\(baseUrlString)/wamekawash/v5/locals/\(id)/services"
    }
    
    static private func get<T: Decodable>(
        from urlString: String,
        headers: HTTPHeaders,
        responseType: T.Type,
        responseHandler: @escaping ((T) -> Void),
        errorHandler: @escaping((Error) -> Void)) {
        guard let url = URL(string: urlString) else {
            let message = "Error on URL"
            os_log("%@", message)
            return
        }
        
        AF.request(url, headers: headers).validate().responseJSON(
            completionHandler: { response in
                switch response.result {
                case .success( _):
                    do {
                        let decoder = JSONDecoder()
                        if let data = response.data {
                            let dataResponse = try decoder.decode(responseType, from: data)
                            responseHandler(dataResponse)
                        }
                    } catch {
                        errorHandler(error)
                    }
                    
                case .failure(let error):
                    errorHandler(error)
                }
        })
    }
    
    static private func post<T: Decodable>(
        from urlString: String,
        parameters: [String : String],
        responseType: T.Type,
        responseHandler: @escaping ((T) -> Void),
        errorHandler: @escaping((Error) -> Void)) {
        guard let url = URL(string: urlString) else {
            let message = "Error on URL"
            os_log("%@", message)
            return
        }
        
        AF.request(url, method: .post, parameters: parameters).validate().responseJSON(
            completionHandler: { response in
                switch response.result {
                case .success( _):
                    do {
                        let decoder = JSONDecoder()
                        if let data = response.data {
                            let dataResponse = try decoder.decode(responseType, from: data)
                            responseHandler(dataResponse)
                        }
                    } catch {
                        errorHandler(error)
                    }
                    
                case .failure(let error):
                    errorHandler(error)
                }
        })
        
    }
    
    static func loginClient(username: String, password: String,
                            responseHandler: @escaping ((PostClientResponse) -> Void),
                            errorHandler: @escaping ((Error) -> Void)) {
        let parameters = ["Username" : username, "Password" : password]
        
        self.post(from: loginCustomerUrlString, parameters: parameters,
                 responseType: PostClientResponse.self,
                 responseHandler: responseHandler, errorHandler: errorHandler)
        
    }
    
    static func localsRequest(key: String, url: String,
                              responseHandler: @escaping ((GetLocalsResponse) -> Void),
                              errorHandler: @escaping ((Error) -> Void)) {
        
        let headers: HTTPHeaders = [
            "Authorization": key,
        ]
        
        self.get(from: url, headers: headers, responseType: GetLocalsResponse.self, responseHandler: responseHandler, errorHandler: errorHandler)
        
    }
    
    static func servicesRequest(key: String, url: String,
                                responseHandler: @escaping ((GetServicesResponse) -> Void),
                                errorHandler: @escaping ((Error) -> Void)) {
        
        let headers: HTTPHeaders = [
            "Authorization": key,
        ]
        
        self.get(from: url, headers: headers, responseType: GetServicesResponse.self, responseHandler: responseHandler, errorHandler: errorHandler)
        
    }
    
    
}
