//
//	Node.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Node {

	var avatarLarge : String!
	var avatarMini : String!
	var avatarNormal : String!
	var id : Int!
	var name : String!
	var title : String!
	var titleAlternative : String!
	var topics : Int!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		avatarLarge = dictionary["avatar_large"] as? String
		avatarMini = dictionary["avatar_mini"] as? String
		avatarNormal = dictionary["avatar_normal"] as? String
		id = dictionary["id"] as? Int
		name = dictionary["name"] as? String
		title = dictionary["title"] as? String
		titleAlternative = dictionary["title_alternative"] as? String
		topics = dictionary["topics"] as? Int
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if avatarLarge != nil{
			dictionary["avatar_large"] = avatarLarge
		}
		if avatarMini != nil{
			dictionary["avatar_mini"] = avatarMini
		}
		if avatarNormal != nil{
			dictionary["avatar_normal"] = avatarNormal
		}
		if id != nil{
			dictionary["id"] = id
		}
		if name != nil{
			dictionary["name"] = name
		}
		if title != nil{
			dictionary["title"] = title
		}
		if titleAlternative != nil{
			dictionary["title_alternative"] = titleAlternative
		}
		if topics != nil{
			dictionary["topics"] = topics
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

}