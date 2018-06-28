//
//  SampleRealm.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/07/20.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import Foundation
import RealmSwift

enum RealmAction {
    case find, save, delete, update
}

class BuyListTable:Object {
    @objc dynamic var buylist_id:Int = 0
    @objc dynamic var buylist_name:String = ""
    @objc dynamic var count:Int = 0
    @objc dynamic var create_time:Date = Date()
    @objc dynamic var buy_on_time_recently:Date = Date()
    @objc dynamic var buy_off_time_recently:Date = Date()
}


//test
//モデルクラス
class SampleRealm:Object {
    //初期化できていること
    @objc dynamic var id:Int = 0
    @objc dynamic var title:String = ""
}

class SampleUseRealm {
    
    let sr = SampleRealm()
 
    //data set
    func realmConnect() {
        sr.id = 1;
        sr.title = "hoge";
    }
    
    //Action
    func realmAction(action:RealmAction, obj:SampleRealm){
        let realm = try! Realm()
        switch action{
        case .find:
            let dataContent = realm.objects(SampleRealm.self)
        case .save:
            try! realm.write {
                //save realmConnect
                realm.add(self.sr)
            }
        case .delete:
            try! realm.write {
                realm.delete(obj)
                
            }
        case .update:
            try! realm.write {
                obj.title = "change"
            }
        }
    }
    

}
