//
//  DBViewModel.swift
//  RealmAppUI
//
//  Created by Thor on 01/09/2021.
//

import SwiftUI
import RealmSwift

class DBViewModel : ObservableObject{
    
    @Published var title = ""
    @Published var detail = ""
    
    @Published var openNewPage = false
    
    //     Fetched Data
    @Published var cards : [Card] = []
    
    //    Data Updation...
    @Published var updateObject : Card?
    
    init(){
        fetchData()
    }
    
    //     Fetching data
    func fetchData(){
        //        Gettting reference
        guard let dbRef = try? Realm() else {return}
        
        let results = dbRef.objects(Card.self)
        
        //        Displaying result
        self.cards = results.compactMap({ (card) -> Card? in
            return card
        })
    }
    
    func deleteData(object: Card){
        //        Gettting reference
        guard let dbRef = try? Realm() else {return}
        
        try? dbRef.write{
            dbRef.delete(object)
            //            Updating UI
            fetchData()
        }
        
    }
    
    //    Add New Data...
    func addData(presentation: Binding<PresentationMode>){
        let card = Card()
        card.title = title
        card.detail = detail
        
        //        Gettting reference
        guard let dbRef = try? Realm() else {return}
        
        //        Writing Data
        
        try? dbRef.write{
            
            //            Checking and Writing Data
            guard let availbleObject = updateObject else{
                dbRef.add(card)
                return
            }
            
            availbleObject.title = title
            availbleObject.detail = detail
        }
        //            Updating UI
        fetchData()
        
        //        Closing view
        presentation.wrappedValue.dismiss()
    }
    
    //     Setting and clearing the data
    func setUpInitialData(){
        
        guard let updateData = updateObject else {return}
        title = updateData.title
        detail = updateData.detail
    }
    
    func deInitData(){
        title = ""
        detail = ""
    }
    
}
