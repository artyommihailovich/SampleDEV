//
//  PictureDetail.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 12.08.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI

struct PictureDetail: View {
    @State private var showingAlert = false
    @State private var showingLogin = false
    
    var picture: Picture
    
    var convertedPicturePrice: String {
           let convertedValueRaw: Double = picture.price
           let convertedValueString = String("\(convertedValueRaw)00₽")
           return convertedValueString
       }
    
    var convertedPictureYear: String {
           let convertedValueRaw: Int = picture.year
           let convertedValueString = String("\(convertedValueRaw)г.")
           return convertedValueString
       }

    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(alignment: .center, spacing: 10) {
                Image(picture.imageName)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350, alignment: .center)
                    
                
                    Text(picture.nameOfArtist)
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    Text(picture.nameOfWorkImage)
                        .font(.title)
                        .fontWeight(.regular)

                    Text(convertedPicturePrice)
                        .font(.subheadline)
                        .fontWeight(.ultraLight)
                
                HStack {
                    Text("Страна:")
                              .font(.subheadline)
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    Text(picture.country)
                    .font(.subheadline)
                    .fontWeight(.light)
                }//Country
                .padding(.horizontal)
                
                HStack {
                    Text("Размер:")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    Text("\(picture.size)см.")
                    .font(.subheadline)
                    .fontWeight(.light)
                }//Size
                .padding(.horizontal)
                
                HStack {
                    Text("Год:")
                              .font(.subheadline)
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    Text(convertedPictureYear)
                    .font(.subheadline)
                    .fontWeight(.light)
                }//Year
                .padding(.horizontal)
                .padding(.bottom)
                
                HStack(spacing: 2){
                           Button(action: {}) {
                               Image(systemName: "heart")
                                   .font(.system(size: 12, weight: .regular))
                                   .foregroundColor(.black)
                    }

                    Text(" · Подробная информация о доставке · ")
                                                  .font(.system(size: 12, weight: .regular))
                }// HeartAndDelivery
            }
            
            HStack{
                Spacer()
                OrderButton(showAlert: $showingAlert, showLogin: $showingLogin, picture: picture)
                Spacer()
            }
            .padding(.vertical)
        }
        .navigationBarHidden(false)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Добавлено в корзину!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct PictureDetail_Previews: PreviewProvider {
    static var previews: some View {
        PictureDetail(picture: pictureData[1])
    }
}

struct OrderButton : View {
    
    @ObservedObject var basketListener = BasketListener()
    
    @Binding var showAlert: Bool
    @Binding var showLogin: Bool

    var picture: Picture
    
    var body : some View {
        
        Button(action: {
            
            if FUser.currentUser() != nil && FUser.currentUser()!.onBoarding {

                self.showAlert.toggle()
                self.addItemToBasket()

            } else  {
                self.showLogin.toggle()
            }

            
        }) {
            Text("ДОБАВИТЬ В КОРЗИНУ")
        }
        .foregroundColor(Color.black)
        .frame(width: 350, height: 30)
        .background(Rectangle()
        .stroke(lineWidth: 1)
        .foregroundColor(Color.black))
        .sheet(isPresented: self.$showLogin) {
            if FUser.currentUser() != nil {
                FinishRegistrationView()
            } else {
                LoginView()
            }
        }
    }

    private func addItemToBasket() {

        var orderBasket: OrderBasket!

        if self.basketListener.orderBasket != nil {

            orderBasket = self.basketListener.orderBasket
        } else {

            orderBasket = OrderBasket()
            orderBasket.ownerId = FUser.currentId()
            orderBasket.id = UUID().uuidString
        }

        orderBasket.add(self.picture)
        orderBasket.saveBasketToFirestore()
    }
}
