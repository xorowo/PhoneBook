//
//  UserDefaults+Extension.swift
//  PhoneBook
//
//  Created by  Work on 08.09.2023.
//

import Foundation

extension UserDefaults {
    
    func setObjects<Object: Encodable>(_ objects: [Object], forKey: String) {
        let codableService = CodableService()
        guard let data = codableService.encoding(objects) else {
            return
        }
        set(data, forKey: forKey)
    }
    
    func getObjects<Object: Decodable >(_ type: Object.Type, forKey: String) -> [Object] {
        guard let data = data(forKey: forKey) else {
            print("Error: no userDefayults value")
            return []
        }
        let codableService = CodableService()
        let items = codableService.decoding(Object.self, data: data)
        return items
    }
    
}
