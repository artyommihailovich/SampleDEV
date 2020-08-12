//
//  FinishRegistrationView.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 12.08.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI

struct FinishRegistrationView: View {
    
    @State var name = ""
    @State var surname = ""
    @State var telephone = ""
    @State var address = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {

        Form {
            
            Section() {
                
                Text("Завершите регистрацию в SAMPLE")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding([.top, .bottom], 20)
                
                TextField("Имя", text: $name)
                TextField("Фамилия", text: $surname)
                TextField("Телефон", text: $telephone)
                TextField("Адрес", text: $address)
                
            } //End of Section
            
            
            Section() {
                
                Button(action: {
                    self.finishRegistration()
                }, label: {
                    Text("Завершить регистрацию")
                })
            }.disabled(!self.fieldsCompleted())
            //End of Section
            
            
        } //End of Form

    }//End of Body
    
    private func fieldsCompleted() -> Bool {
        
        return self.name != "" && self.surname != "" && self.telephone != "" && self.address != ""
    }
    
    private func finishRegistration() {
        
        let fullName = name + " " + surname
        
        updateCurrentUser(withValues: [kFIRSTNAME : name, kLASTNAME : surname, kFULLNAME : fullName, kFULLADDRESS : address, kPHONENUMBER : telephone, kONBOARD : true]) { (error) in
            
            if error != nil {
                
                print("error updating user: ", error!.localizedDescription)
                return
            }
            
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct FinishRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        FinishRegistrationView()
    }
}
