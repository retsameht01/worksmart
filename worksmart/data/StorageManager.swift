//
//  FileManager.swift
//  worksmart
//
//  Created by Tin Le on 8/30/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
class StorageManager {
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    func readTextFile(fileName: String) ->String {
        print("reading from \(fileName)")
        getCreationDate(fileName: fileName)
        let url = self.getDocumentsDirectory().appendingPathComponent(fileName)
        do {
            let content = try String(contentsOf: url)
            return content
        } catch {
            return ""
        }
    }
    
    func saveTextFile(fileName: String, content: String) {
        print("saving to \(fileName)")
        let url = self.getDocumentsDirectory().appendingPathComponent(fileName)
        do {
            try content.write(to: url, atomically: true, encoding: .utf8)
            //let input = try String(contentsOf: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //TODO build into a compare against a target elapsed time so it can be determined if the date is needed to be updated.
    func getCreationDate(fileName: String)-> Date? {
        let url = self.getDocumentsDirectory().appendingPathComponent(fileName)
        guard let createdDate = (try? FileManager.default.attributesOfItem(atPath: url.path))?[.creationDate] as? Date else {
            print("unable to get created date for \(fileName)")
            return nil
        }
        
        let today = Date()
        let diffComponents = Calendar.current.dateComponents([.day], from: createdDate, to: today)
        
        print("it has been \(String(describing: diffComponents.day)) since file was created on \(DateUtil.getFormattedDateString(date: createdDate))")
        return createdDate
    }
}
