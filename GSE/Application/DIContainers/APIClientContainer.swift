//
//  APIClientContainer.swift
//  GSE
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Foundation
import Data
import Domain
import Alamofire

final class APIClientContainer {

    class var apiClient: APIClient {
        return APIClientFactory.createClient()
    }
    
}

private class APIClientFactory {
    
    fileprivate static func createClient() -> APIClient {
        let host = "https://jsonplaceholder.typicode.com/"
        let server = DefaultAPIServer(host: host)
        return APIClient(server: server, session: Session())
    }
    
}
