//
//  APIClientContainer.swift
//  GSE
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Foundation
import Data
import Domain

final class APIClientContainer {
    
    class var urlBase: String {
        return APIClientFactory.createUrl()
    }
    
}

private class APIClientFactory {
    
    fileprivate static func createUrl() -> String {
        let host = "https://jsonplaceholder.typicode.com/"
        return host
    }
    
}
