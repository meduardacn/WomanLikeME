//
//  WomanLikeMETests.swift
//  WomanLikeMETests
//
//  Created by Maria Eduarda Casanova Nascimento on 02/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Quick

import Nimble

@testable import WomanLikeME

final class TestFavoriteFunctions : QuickSpec{
    override func spec() {
        // Scenario : Favorite a story
        //GIVEN
        describe("GIVEN a user uses the app"){
            let list = User.sharedService.fecthListOfFAvorite()
            //WHEN
            context("WHEN a story that is favorited"){
                let newWoman = Woman(name: "Camile", date: "20/02/1989", carrer: "dev", textAbout: "qualquer coisa", image: "foto.jpg", phrase: "é isso aí", saved: true, id: 0)
                User.sharedService.addWoman(new: newWoman)
                let newlist = User.sharedService.fecthListOfFAvorite()
                //THEN
                it("THEN it is saved to a favorite list"){
                    expect(list.count).to(equal(newlist.count-1))
                    
                }
            }
        }
        
        // Scenario : disfavor a story
        //GIVEN
        describe("GIVEN a user uses the app"){
            //WHEN
            context("WHEN a story that is disfavorited"){
                let newWoman = Woman(name: "Camile", date: "20/02/1989", carrer: "dev", textAbout: "qualquer coisa", image: "foto.jpg", phrase: "é isso aí", saved: true, id: 0)
                User.sharedService.addWoman(new: newWoman)
                User.sharedService.deleteWoman(new: newWoman)
                let list = User.sharedService.fecthListOfFAvorite()
                //THEN
                it("THEN it is saved to a favorite list"){
                    expect(list.contains(where: { $0.id == newWoman.id} )).to(beFalse())
                    
                }
            }
        }
        
        // Scenario : Didn't favorite a story and access a favorite list
        //GIVEN
        describe("A woman who didn't favorited a story yet"){
            //WHEN
            context("the favorite list is accessed"){
                let list = User.sharedService.fecthListOfFAvorite()
                //THEN
                it("the list is empty"){
                    expect(list).to(beEmpty())
                }
            }
        }
        
        // Scenario : Did Favorite a story and access a favorite list
        //GIVEN
        describe("A woman who favorited a story"){
            let newWoman = Woman(name: "Camile", date: "20/02/1989", carrer: "dev", textAbout: "qualquer coisa", image: "foto.jpg", phrase: "é isso aí", saved: true, id: 0)
            User.sharedService.addWoman(new: newWoman)
            let newWoman2 = Woman(name: "Maria", date: "21/08/1998", carrer: "dev", textAbout: "qualquer coisa", image: "foto.jpg", phrase: "é isso aí", saved: true, id: 1)
            User.sharedService.addWoman(new: newWoman2)
            //WHEN
            context("the favorite list is acessed"){
                let list = User.sharedService.fecthListOfFAvorite()
                //THEN
                it("the list contains all the favorites stories"){
                   expect(list.count).to(equal(2))
                }
            }
        }
        
    }
}


final class TestNotEmpty: QuickSpec{
    override func spec() {
        // Scenario: When a woman is loaded all informatios aren't empty
        //GIVEN
        describe("GIVEN A woman who uses the app"){
            //WHEN
            context("WHEN the app is running"){
                let database = ReadingPList()
                let allWoman = database.returningData()
                let first = allWoman[0]
                //THEN
                it("THEN a story of woman is loaded AND with a not empty text about her AND with a not empty name AND with a not empty date AND with a not empty carrer AND with a not empty phrase AND with an valid image "){
                    let newWoman = Woman(name: first.name, date: first.date, carrer: first.carrer, textAbout: first.textAbout, image: first.image, phrase: first.phrase, saved: first.saved, id: 0)
                    expect(newWoman.textAbout).toNot(be(""))
                    expect(newWoman.name).toNot(be(""))
                    expect(newWoman.date).toNot(be(""))
                    expect(newWoman.carrer).toNot(be(""))
                    expect(newWoman.phrase).toNot(be(""))
                    let image = Data(base64Encoded: newWoman.image)
                    expect(image).toNot(haveCount(0))
                }
            }
        }
    }
}

final class TestLoadAllDataPlist: QuickSpec{
    override  func spec() {
        // Scenario : When database is not empty all stories are loaded from
        // GIVEN
        describe("GIVEN WomanLikeME"){
            
            // WHEN
            context("WHEN it is loaded"){
                let database = ReadingPList()
                // THEN
                it("THEN a list of all woman in database is loaded"){
                    let allWoman = database.returningData()
                    expect(allWoman).toNot(beEmpty())
                }
            }
            
        }
    }
}

final class TestDateTransformation: QuickSpec{
    override func spec() {
    // Scenario : A woman born in 1989 is loaded
    //GIVEN
        describe("GIVEN a woman born in 20/02/1989"){
            let newWoman = Woman(name: "Camile", date: "20/02/1989", carrer: "dev", textAbout: "qualquer coisa", image: "foto.jpg", phrase: "é isso aí", saved: false, id: 0)
            //WHEN
                context("WHEN her story is loaded in 04/09/2019"){
                let transform = DateTransformation()
                
                //THEN
                it("THEN her age should be 30"){
                    let date = transform.ageCalculator(date: newWoman.date)
                    expect(date).to(equal("30"))
                }
            }
        }
    }

}

