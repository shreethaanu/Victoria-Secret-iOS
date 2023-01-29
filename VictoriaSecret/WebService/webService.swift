//
//  webService.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 29/01/23.
//

import Foundation

class webServiceManager {
    static let shared = webServiceManager()
    private init(){}

    open func makeServiceCall<T: Decodable>(url: URL, success: @escaping (_ json: T) -> Void, failure: @escaping (_ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                failure(error)
            } else if let data = data {
                do {
                    try success(JSONDecoder().decode(T.self, from: data))
                }
                catch {
                    failure(error)
                }
            }
        }.resume()
    }
}
