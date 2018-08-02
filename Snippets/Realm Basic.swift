//
//  Realm Basic.swift
//  Snippets
//
//  Created by Warren Hansen on 7/30/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import Foundation
import RealmSwift

class Places: Object {

    // requires pod 'RealmSwift'
    @objc dynamic var name     = ""
    @objc dynamic var rating = 0

    class func deleteAll() {
        
        let realm = try! Realm()
        let allPlaces = realm.objects(Places.self)
        try! realm.write({
            realm.delete(allPlaces)
        })
    }
    
    class func getAllPlaces()-> Results<Places> {
        let realm = try! Realm()
        let allPlaces = realm.objects(Places.self)
        let sortedDistance = allPlaces.sorted(byKeyPath: "distance", ascending: true)
        return sortedDistance
    }
    
    class func setObject(name:String, rating:Int) {

        let realm = try! Realm()
        let places = Places()
        places.name = name
        places.rating = rating
        
        try! realm.write {
            realm.add(places)
        }
    }

}
