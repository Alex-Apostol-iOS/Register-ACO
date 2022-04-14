//
//  ServiceProxy.swift
//  PruebaTecnica
//
//  Created by Alex Apostol on 4/4/22.
//

import Alamofire



class ServiceProxy {
    
    private var mainURL = ""
    private let timeout: Double = 30
    let retryLimit: Int = 30
    
    func getItem<T: Decodable>(url: String, type: T.Type, parameters: [String:Any]?,headers: HTTPHeaders? = nil, queue: DispatchQueue = .main, completion: @escaping (Result<T, AFError>) -> Void) {
        let url = "\(mainURL)\(url)"
        let request =  AF.request(url, method: .get, parameters: parameters, headers: headers)
        { $0.timeoutInterval = self.timeout }
        .validate()
        .responseDecodable(of: T.self, queue: queue) { (response) in
            print("IN<---------------------------------------")
            if let HTTPresponse = response.response {
                // Debug
                print(HTTPresponse)
            } else {
                print(response)
            }
            print("IN<---------------------------------------")
            
            if let data = response.data {
                print("Response: \(String(data: data, encoding: .utf8) ?? "")")
            }
            
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        if request.isInitialized {
            request.cURLDescription(calling: { (description) in
                print("OUT----------------------------->")
                print("Curl Description \(description)")
                print("--------------------------------->")
            })
            
        }
    }
    
    func getItemOptional<T: Decodable>(url: String, type: T.Type?, parameters: [String:Any]?,headers: HTTPHeaders? = nil,queue: DispatchQueue = .main, completion: @escaping (Result<T?, AFError>) -> Void) {
        let url = "\(mainURL)\(url)"
        let request =  AF.request(url, method: .get, parameters: parameters, headers: headers)
        { $0.timeoutInterval = self.timeout  }
        .validate()
        .responseDecodable(of: T.self, queue: queue) { (response) in
            print("IN<---------------------------------------")
            if let HTTPresponse = response.response {
                // Debug
                print(HTTPresponse)
            } else {
                print(response)
            }
            print("IN<---------------------------------------")
            
            if let data = response.data {
                print("Response: \(String(data: data, encoding: .utf8) ?? "")")
            }
            
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                    switch error {
                    case .responseSerializationFailed(reason: let reason) :
                        switch reason {
                           case .invalidEmptyResponse(type: _):
                            completion(.success(nil))
                            break
                        default:
                            break
                        }
                    default:
                        break
                    }
                completion(.failure(error))
            }
        }
        
        if request.isInitialized {
            request.cURLDescription(calling: { (description) in
                print("OUT----------------------------->")
                print("Curl Description \(description)")
                print("--------------------------------->")
            })
            
        }
    }
    
    func postItem<T: Decodable>(url: String, type: T.Type?, parameters: [String:Any] = [:], headers: HTTPHeaders?,completion: @escaping (Result<T?, AFError>) -> Void) {
        let url = "\(mainURL)\(url)"
        let request =  AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        { $0.timeoutInterval = self.timeout  }
        .validate()
        .responseDecodable(of: T.self) { (response) in
            print("<-IN---------------------------------------")
            if let HTTPresponse = response.response {
                // Debug
                print(HTTPresponse)
            } else {
                print(response)
            }
            print("<---------------------------------------")
            // Debug
            print(response)
            if let data = response.data {
                print("Response: \(String(data: data, encoding: .utf8) ?? "")")
            }
            
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        if request.isInitialized {
            request.cURLDescription(calling: { (description) in
                print("OUT----------------------------->")
                print("Curl Description \(description)")
                print("--------------------------------->")
            })
            
        }
    }
    
    func postItemNoResponse(url: String, parameters: [String:Any] = [:], headers: HTTPHeaders?,completion: @escaping (Result<Any, AFError>) -> Void) {
        let url = "\(mainURL)\(url)"
        let request =  AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        { $0.timeoutInterval = self.timeout  }
        .validate()
        .responseData(emptyResponseCodes: [200, 201]) {  (response) in
            print("<-IN---------------------------------------")
            if let HTTPresponse = response.response {
                // Debug
                print(HTTPresponse)
            } else {
                print(response)
            }
            print("<---------------------------------------")
            
            if let data = response.data {
                print("Response: \(String(data: data, encoding: .utf8) ?? "")")
            }
            
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        if request.isInitialized {
            request.cURLDescription(calling: { (description) in
                print("OUT----------------------------->")
                print("Curl Description \(description)")
                print("--------------------------------->")
            })
            
        }
    }
    
    func putItemNoResponse(url: String, parameters: [String:Any] = [:], headers: HTTPHeaders?,completion: @escaping (Result<Any, AFError>) -> Void) {
        let url = "\(mainURL)\(url)"
        let request =  AF.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate()
            .responseData(emptyResponseCodes: [200, 201]) {  (response) in
                print("<-IN---------------------------------------")
                if let HTTPresponse = response.response {
                    // Debug
                    print(HTTPresponse)
                } else {
                    print(response)
                }
                print("<---------------------------------------")
                
                if let data = response.data {
                    print("Response: \(String(data: data, encoding: .utf8) ?? "")")
                }
                
                switch response.result {
                case .success(let result):
                    completion(.success(result))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        
        if request.isInitialized {
            request.cURLDescription(calling: { (description) in
                print("OUT----------------------------->")
                print("Curl Description \(description)")
                print("--------------------------------->")
            })
            
        }
    }
    
    func deleteItemNoResponse(url: String, parameters: [String:Any]?, headers: HTTPHeaders?,completion: @escaping (Result<Any, AFError>) -> Void) {
        let url = "\(mainURL)\(url)"
        let request =  AF.request(url, method: .delete, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        { $0.timeoutInterval = self.timeout  }
        .validate()
        .responseData(emptyResponseCodes: [200, 201]) { (response) in
            print("<-IN---------------------------------------")
            if let HTTPresponse = response.response {
                // Debug
                print(HTTPresponse)
            } else {
                print(response)
            }
            print("<---------------------------------------")
            
            if let data = response.data {
                print("Response: \(String(data: data, encoding: .utf8) ?? "")")
            }
            
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        if request.isInitialized {
            request.cURLDescription(calling: { (description) in
                print("OUT----------------------------->")
                print("Curl Description \(description)")
                print("--------------------------------->")
            })
            
        }
    }
    
    
    func getItems<T: Decodable>(url: String, type: [T].Type, parameters: [String:Any]?, headers: HTTPHeaders? = nil ,completion: @escaping (Result<[T], AFError>) -> Void) {
        let url = "\(mainURL)\(url)"
        let request = AF.request(url, method: .get, parameters: parameters, headers: headers)
        { $0.timeoutInterval = self.timeout  }
        .validate()
        .responseDecodable(of: [T].self) { (response) in
            print("IN<---------------------------------------")
            if let HTTPresponse = response.response {
                
                // Debug
                print(HTTPresponse)
            } else {
                print(response)
            }
            print("IN<---------------------------------------")
            
            if let data = response.data {
                print("Response: \(String(data: data, encoding: .utf8) ?? "")")
            }
            
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        if request.isInitialized {
            request.cURLDescription(calling: { (description) in
                print("OUT----------------------------->")
                print("Curl Description \(description)")
                print("--------------------------------->")
            })
            
        }
    }
}
