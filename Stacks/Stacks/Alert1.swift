//
//  Alert1.swift
//  Stacks
//
//  Created by Abhishek Sehgal on 2024-10-09.
//

import SwiftUI

struct Alert1: View {
    @State private var showAlert: Bool = false
    var body: some View {
        NavigationView{
            VStack{
                Button(action: {
                    self.showAlert = true
                }, label: {
                    Text("Click Me!")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 24))
                })
                .frame(width: 200,
                       height: 50,
                       alignment: .center)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .alert( isPresented: $showAlert, content: {
                    Alert(title: Text("Purchase Successfull"),
                          message:Text("Your in app purchase went through!"),
                          dismissButton: .default(Text("Got it")))
                })
                
            } .navigationTitle("Alert")
        }
       
    }
}

#Preview {
    Alert1()
}
