//
//  CodableService.swift
//  PhoneBook
//
//  Created by  Work on 08.09.2023.
//

import Foundation

struct CodableService {
    
    func encoding<Object: Encodable>(_ objects: [Object]) -> Data? {
        do {
            let data = try PropertyListEncoder().encode(objects)
            return data
        } catch {
            print("Error: unable to encode")
            return nil
        }
    }
    
    func decoding<Object: Decodable>(_ type: Object.Type, data: Data) -> [Object] {
        do {
            let items = try PropertyListDecoder().decode([Object].self, from: data)
            return items
        } catch {
            print("Error: unable to decode")
            return []
        }
    }
    
}
