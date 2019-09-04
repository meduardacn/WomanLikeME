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

final class Test: QuickSpec{
    
    override func spec() {
        // Scenario 2: Favorite a story
        //GIVEN
        describe("A woman who favorite a story"){
            
            //WHEN
            context("a story that is favorited"){
                
                //THEN
                it("a story is saved to a favorite list"){
                    
                }
            }
        }
        
        // Scenario 3: Didn't favorite a story and access a favorite list
        //GIVEN
        describe("A woman who didn't favorited a story yet"){
            
            //WHEN
            context("the favorite list is accessed"){
                
                //THEN
                it("the list is empty"){
                    
                }
            }
        }
        
        // Scenario 4: Did Favorite a story and access a favorite list
        //GIVEN
        describe("A woman who favorited a story"){
            
            //WHEN
            context("the favorite list is acessed"){
                
                //THEN
                it("the list contains all the favorites stories"){
                    
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
                    let newWoman = Woman(name: first.name, date: first.date, carrer: first.carrer, textAbout: first.textAbout, image: first.image, phrase: first.phrase, saved: first.saved)
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
            let newWoman = Woman(name: "Camile", date: "20/02/1989", carrer: "dev", textAbout: "qualquer coisa", image: "foto.jpg", phrase: "é isso aí", saved: false)
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

