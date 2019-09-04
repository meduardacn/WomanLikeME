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
        
        // Scenario 1: A woman who open an app
        //GIVEN
        describe("A woman who uses the app"){
            let user = User()
            //WHEN
            context("the app is running"){
                // pegar do banco
                //THEN
                it("a story of a different woman is loaded AND with a text about her AND with an image"){
//                    let newWoman = Woman(name: <#T##String#>, date: <#T##String#>, carrer: <#T##String#>, textAbout: <#T##String#>, image: <#T##Data#>, phrase: <#T##String#>)
//                    expect(newWoman.text).to(notEqual(""))
//                    expect(newWoman.image).to(notHaveCount(0))
                }
            }
        }
        
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
