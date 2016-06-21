//
//  LoginData.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/17/16.
//  Copyright © 2016 courses. All rights reserved.
//

import Foundation

class UserData {
  var profile: String!
  var wantlistUrl: String!
  var rank: Float!
  var numPending: String!
  var id: Int!
  var numForsale: String!
  var homePage: String!
  var location: String!
  var collectionFoldersUrl: String!
  var username: String!
  var collectionFieldsUrl: String!
  var releasesContributed: Int!
  var registered: String!
  var ratingAvg: Float!
  var numCollection: Int!
  var releasesRated: Int!
  var numLists: Int!
  var name: String!
  var numWantlist: Int!
  var inventoryUrl: String!
  var uri: String!
  var avatarUrl: String!
  var resourceUrl: String!

  init() {
    profile = ""
    wantlistUrl = ""
    rank = 0.0
    numPending = ""
    id = 0
    numForsale = ""
    homePage = ""
    location = ""
    collectionFoldersUrl = ""
    username = ""
    collectionFieldsUrl = ""
    releasesContributed = 0
    registered = ""
    ratingAvg = 0.0
    numCollection = 0
    releasesRated = 0
    numLists = 0
    name = ""
    numWantlist = 0
    inventoryUrl = ""
    uri = ""
    avatarUrl = ""
    resourceUrl = ""
    }
}
