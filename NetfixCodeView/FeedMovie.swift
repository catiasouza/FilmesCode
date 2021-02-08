//
//  FeedMovie.swift
//  NetfixCodeView
//
//  Created by Cátia Souza on 04/06/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import Foundation

struct Movie {
    var id : Int
    var imgUrl : String
    var title : String?
    var description : String?
}
class FeedMovie{
    let highlight = Movie(id: 1, imgUrl: "highlight" , title: "Assista a temporada 1 agora", description: nil)
    let movie : [ Int : (String, [Movie]) ] = [
        
    0 :("Continue assistindo CATIA",[
            Movie(id: 1, imgUrl: "starwars", title: "starwars", description: "desc1"),
            Movie(id: 2, imgUrl: "starwars", title: "starwars", description: "desc2"),
            Movie(id: 3, imgUrl: "starwars", title: "starwars", description: "desc1"),
            Movie(id: 4, imgUrl: "starwars", title: "starwars", description: "desc2")
    ]),
    1:( "Recentemente" , [
        Movie(id: 3, imgUrl: "516446", title: "text1", description: "desc1"),
        Movie(id: 4, imgUrl: "70298966", title: "text2", description: "desc2"),
        Movie(id: 5, imgUrl: "516446", title: "text1", description: "desc1"),
        Movie(id: 6, imgUrl: "70284281", title: "text2", description: "desc2"),
        Movie(id: 7, imgUrl: "516446", title: "text1", description: "desc1"),
        Movie(id: 8, imgUrl: "70298966", title: "text2", description: "desc2")
    ]),
    2:( "Em Alta" , [
           Movie(id: 3, imgUrl: "516446", title: "text1", description: "desc1"),
           Movie(id: 4, imgUrl: "70298966", title: "text2", description: "desc2"),
           Movie(id: 5, imgUrl: "516446", title: "text1", description: "desc1"),
           Movie(id: 6, imgUrl: "70298966", title: "text2", description: "desc2"),
           Movie(id: 7, imgUrl: "70284281", title: "text1", description: "desc1"),
           Movie(id: 8, imgUrl: "70298966", title: "text2", description: "desc2")
       ]),
    3:( "Comedia" , [
       
        Movie(id: 4, imgUrl: "70298966", title: "text2", description: "desc2"),
        Movie(id: 5, imgUrl: "516446", title: "text1", description: "desc1"),
        Movie(id: 6, imgUrl: "70298966", title: "text2", description: "desc2"),
        Movie(id: 7, imgUrl: "516446", title: "text1", description: "desc1"),
        Movie(id: 8, imgUrl: "70298966", title: "text2", description: "desc2")
    ]),
    4:( "Terror" , [
           Movie(id: 3, imgUrl: "516446", title: "text1", description: "desc1"),
           Movie(id: 4, imgUrl: "70298966", title: "text2", description: "desc2"),
           Movie(id: 5, imgUrl: "516446", title: "text1", description: "desc1"),
           Movie(id: 6, imgUrl: "70298966", title: "text2", description: "desc2"),
           Movie(id: 7, imgUrl: "516446", title: "text1", description: "desc1"),
           Movie(id: 8, imgUrl: "70298966", title: "text2", description: "desc2")
       ])
    ]
}
