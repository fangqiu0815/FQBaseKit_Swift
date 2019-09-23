
// MARK: - test

import UIKit

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")





//let badStart = """
//one
//two
//"""
//let end = """
//three
//"""
//print(badStart + end)

//let catCharacters: [Character] = ["C", "a", "t", "!", "🐱️"]
//let catString = String(catCharacters)
//print(catString)



//let names = ["Anna", "Alex", "Brian", "Jack"]
//let count = names.count
//for i in 0..<count {
//    print("Person \(i + 1) is called \(names[i])")
//}

//func newtest(){

//    for name in names[2...] {
//        print(name)
//    }
//    for name in names[...2] {
//        print(name)
//    }
//}

var str = "Hello, playground"
print(str)

func makeASandwich() throws {
    // ...
}

func new(){
    do {
        try makeASandwich()
        eatASandwich()
    } catch Error.OutOfCleanDishes {
        washDishes()
    } catch Error.MissingIngredients(let ingredients) {
        buyGroceries(ingredients)
    }
}

func buyGroceries(inst : Int){
    print("buyGroceries")
}
func eatASandwich(){
    print("eatASandwich")

}
func washDishes(){
    print("washDishes")

}



