//
//  ContentView.swift
//  Islam786
//
//  Created by HASSAN RIAZ on 20/07/2023.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State var userName: String
    @State var password: String
    @State var isShowing: Bool
    @State var err: String
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("ISLAM 786")
                VStack{
                    TextField("Username", text: $userName)
                    TextField("Password", text: $password)
                    
                    
                    
                }
                //                .fullScreenCover(isPresented: <#T##Binding<Bool>#>, content: <#T##() -> View#>)
                .padding(.init(top: 20, leading: 50, bottom: 20, trailing: 50))
                
                Button {
                    Auth.auth().signIn(withEmail: userName, password: password) { authResult, error in
                        //                  guard let strongSelf = self else { return }
                        if (authResult != nil) {
                            
                        } else {
                            err = error?.localizedDescription ?? "error not identified"
                            isShowing.toggle()           }
                        // ...
                    }
                    
                } label: {
                    Text("Login")
                }
                .alert(err, isPresented: $isShowing) {
                    Button("OK", role: .cancel) { }
                    
                }
                .padding()
            }
            //        if isShowing{
            //            Alert(title: Text("Not Valid"), message: Text("TRy again"), primaryButton: Alert.Button.destructive(Text("OK")) , secondaryButton: Alert.Button.destructive(Text("CANCEL")) )
            //        }
            
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userName: "", password: "", isShowing: true, err: "")
    }
}


