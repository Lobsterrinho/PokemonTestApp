//
//  PokemonList+CoreDataProperties.swift
//  PokemonTestApp
//
//  Created by Lobster on 11.05.23.
//
//

import Foundation
import CoreData


@objc(PokemonList)
public class PokemonList: NSManagedObject { }

extension PokemonList: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonList> {
        return NSFetchRequest<PokemonList>(entityName: "PokemonList")
    }

    @NSManaged public var url: String
    @NSManaged public var name: String

}
