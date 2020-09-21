//
//  ProductsRepo.swift
//  worksmart
//
//  Created by Tin Le on 8/30/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ProductsRepo: ProductsProvider {
    //let didChange = PassthroughSubject<ProductsRepo, Never>()
    var apiSession: APIService
    //TODO, dependency injection here!!!
    private let gposService = GposService()
    private let storageMgr = StorageManager()
    private let fileNameSuffix = "_products.json"
    var cancellables = Set<AnyCancellable>()
    
    private var completionHandler: ((Bool, [Category])->Void)?
    
    /*
    @Published var products: [Category] = [Category]() {
        didSet{
            didChange.send(self)
        }
    }
 */
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getProductsV2(token: String, storeId: String, completion: @escaping (_ success: Bool, _ data: [Category]) -> Void) {
        self.completionHandler = completion
        let fileName = "\(storeId)\(fileNameSuffix)"
        let resultJson =  storageMgr.readTextFile(fileName: fileName)
        if (resultJson != "") {
            //self.products = parseCategoryFromJson(json: resultJson)
            let products = parseCategoryFromJson(json: resultJson)
            completion(true, products)
            //completion(parseCategoryFromJson(json: resultJson))
        } else {
            self.getProducts(token: token, storeId: storeId)
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
    
    private func getProducts(token: String, storeId: String) {
        let cancellable = self.getProducts(token: token, storeId: storeId)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (response) in
                //self.products = response
                self.saveCategoryDataToJsonFile(categories: response, storeId: storeId)
                if let handler = self.completionHandler {
                    handler(true, response)
                }
                //self.completionHandler(true, response)
        }
        cancellables.insert(cancellable)
    }
}


