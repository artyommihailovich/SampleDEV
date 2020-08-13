//
//  LoginView.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 12.08.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var showingSignup = false
    @State var showingFinishReg = false

    @Environment(\.presentationMode) var presentationMode
    
    @State var email = ""
    @State var password = ""
    @State var repeatPassword = ""
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            
            Text("Вход в SAMPLE")
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical, 40)
            
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Email")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                    
                    TextField("Введите ваш адрес почты", text: $email)
                    Divider()
                    
                    
                    Text("Пароль")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                    
                    SecureField("Введите пароль", text: $password)
                    Divider()
                    
                    if showingSignup {
                        Text("Повторите ввод пароля")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label))
                            .opacity(0.75)
                        
                        SecureField("Повторите ввод пароля", text: $repeatPassword)
                        Divider()
                    }
                    
                }
                .padding()
                .animation(.easeOut(duration: 0.1))
                //End of VStack
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        self.resetPassword()
                    }, label: {
                        Text("Забыли пароль?")
                            .foregroundColor(Color.gray)
                    })
                }
                
            } .padding(.horizontal, 13)
            //End of VStack
            
            Button(action: {

                self.showingSignup ? self.signUpUser() : self.loginUser()
            }, label: {
                Text(showingSignup ? "Регистрация" : "Вход")
                    .foregroundColor(.black)
                    .padding()
            }) //End of Button
            .foregroundColor(Color.black)
            .frame(width: 300, height: 30)
            .background(Rectangle()
            .stroke(lineWidth: 1)
            .foregroundColor(Color.black))
            
            
            
            SignUpView(showingSignup: $showingSignup)
            
            
        }//End of VStack
            .sheet(isPresented: $showingFinishReg) {
                FinishRegistrationView()
        }
        
    }//End of body
    
   
    
    
    private func loginUser() {
        
        if email != "" && password != "" {
            
            FUser.loginUserWith(email: email, password: password) { (error, isEmailVerified) in
                
                if error != nil {
                    
                    print("error loging in the user: ", error!.localizedDescription)
                    return
                }
                
                if FUser.currentUser() != nil && FUser.currentUser()!.onBoarding {
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.showingFinishReg.toggle()
                }
                
            }
        }
        
    }
    
    private func signUpUser() {
        
        if email != "" && password != "" && repeatPassword != "" {
            if password == repeatPassword {
                
                FUser.registerUserWith(email: email, password: password) { (error) in
                    
                    if error != nil {
                        print("Error registering user: ", error!.localizedDescription)
                        return
                    }
                    print("user has been created")
                    //go back to the app
                    //check if user onboarding is done
                }

                
            } else {
                print("passwords dont match")
            }
            
            
        } else {
            print("Email and password must be set")
        }
        
    }
    
    private func resetPassword() {
        
        if email != "" {
            FUser.resetPassword(email: email) { (error) in
                if error != nil {
                    print("error sending reset password, ", error!.localizedDescription)
                    return
                }
                
                print("please check you email")
            }

        } else {
            //notify the suer
            
            print("email is empty")
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct SignUpView : View {
    
    @Binding var showingSignup: Bool
    
    var body: some View {
        
        
        VStack {
            
            Spacer()
            
            HStack(spacing: 4) {
                
                Text("Еще не зарегистрировались?")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 15))
                Button(action: {
                    
                    self.showingSignup.toggle()
                }, label: {
                    Text("Регистрация")
                })
                    .foregroundColor(.black)
                    .font(.system(size: 15))
            }//End of HStack
             .padding(.bottom, 10)
            
        } //End of VStack
    }
}
