//
//  LoadJsonFile.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/13.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

struct SampleJsonData:Codable {
    var total:String
    var page:String
    var records:String
    var rows:[Rows]
    
    struct Rows:Codable {
        var id:String
        var thing:String
    }
}

class LoadJsonFile {
    
    func getJson() -> SampleJsonData? {
        let filename = "sample"
        let jsondata = loadJsonFile(filename)
        guard let data = jsondata else {
            return nil
        }
        return data
    }
    
    func loadJsonFile(_ fileName:String) -> SampleJsonData? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do{
                let jsonStr = try String(contentsOfFile: path)
                guard let data = jsonStr.data(using: .utf8) else {
                    return nil
                }
                let sampleJsonData = try? JSONDecoder().decode(SampleJsonData.self, from: data)
                // parse処理
                //            let a = try JSONSerialization.jsonObject(with: data, options: [])
                //            let json =  JSON.parse(jsonStr)
                
                // ちゃんと値取得できているか確認する
                //encode
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                let encoded = try! encoder.encode(sampleJsonData)
                print(String(data: encoded, encoding: .utf8)!)
                
                return sampleJsonData
            } catch{
                return nil
            }
        } else {
            return nil
        }

    }
}
