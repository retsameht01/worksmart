//
//  ProductsRepo.swift
//  worksmart
//
//  Created by Tin Le on 8/30/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
class ProductsRepo {
    //TODO, dependency injection here!!!
    private let gposService = GposService()
    private let storageMgr = StorageManager()
    private let fileNameSuffix = "_products.json"
    
    func getProducts(token: String, storeId: String, completion: @escaping (_ data: [Category]) -> Void) {
        let fileName = "\(storeId)\(fileNameSuffix)"
        let resultJson =  storageMgr.readTextFile(fileName: fileName)
        if (resultJson != "") {
            completion(parseCategoryFromJson(json: resultJson))
        } else {
            gposService.getCatgegories(token: token, completion: { isSuccess, data in
                self.saveCategoryDataToJsonFile(categories: data, storeId: storeId)
                completion(data)
            })
        }
    }
    
    private func parseCategoryFromJson(json: String) -> [Category] {
        let decoder = JSONDecoder()
        do {
            let products = try decoder.decode([Category].self, from: Data(json.utf8))
            return products
        } catch {
            print(error.localizedDescription)
            return [Category]()
        }
    }
    
    private func saveCategoryDataToJsonFile(categories: [Category], storeId: String) {
        let encoder = JSONEncoder()
        do {
            let jsonData = try  encoder.encode(categories)
            let fileName = getFileName(storeId: storeId)
            guard let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) else {
                print("unable to encode data")
                return
            }
            storageMgr.saveTextFile(fileName: fileName, content: jsonString)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    private func getFileName(storeId: String) -> String {
        return "\(storeId)\(fileNameSuffix)"
    }
    
}
