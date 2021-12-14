//
//  ListMyDate+CoreDataProperties.swift
//  Covid-19-
//
//  Created by alanood on 09/12/2021.
//
//

import Foundation
import CoreData


extension ListMyDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListMyDate> {
        return NSFetchRequest<ListMyDate>(entityName: "ListMyDate")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int64
    @NSManaged public var date: Date?

}

extension ListMyDate : Identifiable {

}
