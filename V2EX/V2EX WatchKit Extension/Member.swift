//
//	Member.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Member {

	var avatarLarge : String!
	var avatarMini : String!
	var avatarNormal : String!
	var id : Int!
	var tagline : String!
	var username : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		avatarLarge = dictionary["avatar_large"] as? String
		avatarMini = dictionary["avatar_mini"] as? String
		avatarNormal = dictionary["avatar_normal"] as? String
		id = dictionary["id"] as? Int
		tagline = dictionary["tagline"] as? String
		username = dictionary["username"] as? String
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
		if tagline != nil{
			dictionary["tagline"] = tagline
		}
		if username != nil{
			dictionary["username"] = username
		}
		return dictionary
	}

}