//
//  AddPageView.swift
//  RealmAppUI
//
//  Created by Thor on 01/09/2021.
//

import SwiftUI

struct AddPageView: View {
    
    @EnvironmentObject var modelData: DBViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Title")){
                    TextField("", text: $modelData.title)
                }
                Section(header: Text("Detail")){
                    TextField("", text: $modelData.detail)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle( modelData.updateObject == nil ? "Add Data" : "Update Data")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                ToolbarItem(placement: .navigationBarTrailing ){
                    Button(action: {modelData.addData(presentation: presentation)}, label: {
                        Text("Done")
                    })
                }
                
                ToolbarItem(placement: .navigationBarLeading ){
                    Button(action: {presentation.wrappedValue.dismiss()}, label: {
                        Text("Cancel")
                    })
                }
                
            }
        }
        .onAppear(perform: modelData.setUpInitialData)
        .onDisappear(perform: modelData.deInitData)
        
    }
}

struct AddPageView_Previews: PreviewProvider {
    static var previews: some View {
        AddPageView()
    }
}
