//
//  UseCaseProtocol.swift
//  
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Foundation

public protocol UseCaseProtocol {
    associatedtype RequestValue
    associatedtype ResponseValue
    func execute(requestValue: RequestValue) async throws -> ResponseValue
}
