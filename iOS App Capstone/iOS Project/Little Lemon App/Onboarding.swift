//
//  Onboarding.swift
//  Little Lemon App
//
//  Created by Vitaliy Iakushev on 30.01.2023.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"


struct Onboarding: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
    
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Logo")
                    .padding(.bottom, 5)
                
                ZStack{
                    Rectangle().foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
//                        .frame(height: 230)
                    VStack(){
                        HStack{
                            Text("Little Lemon")
                                .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                                .font(Font.custom("Georgia", size: 40))
                                .bold()
                                .padding([.leading], 20)
//                                .padding(.top, 10)
                            Spacer()
                        }
                        .frame(height: 45)
                        HStack{
                            VStack(alignment: .leading) {
                                Text("Chicago")
                                    .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                                    .font(Font.custom("Georgia", size: 30))
                                    .fontWeight(.medium)
                                    .frame(height: 40)
//                                Spacer()
                                Text("We are family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                    .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                                    .font(Font.system(size: 16, weight: .medium))

                                    
                                
                            }
//                            .padding(.leading, .trailing)
                            
                            Rectangle()
                                .aspectRatio(1, contentMode: .fit)
                                .overlay(
                                Image("Hero image")
                                    .resizable()
                                    .scaledToFill()
                                )
                                .clipShape(Rectangle())
                                .cornerRadius(15)
                                .frame(width: 150, height: 150)
                        }
                        .padding([.leading, .trailing])
                        .padding(.bottom, 20)
                    }
                    
                }
                .frame(height: 240)
                
                VStack(alignment: .leading) {
                    
                    NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                        EmptyView()
                    }
//                    Text("First Name*")
//                        .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
//                        .padding([.leading, .trailing, .top])
//                        .bold()
                    TextField("First Name*", text: $firstName)
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 10)
                        .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding([.leading, .trailing, .top])
                    
//                    Text("Last Name*")
//                        .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
//                        .padding([.leading, .trailing, .top])
//                        .bold()
                    TextField("Last Name*", text: $lastName)
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 10)
                        .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding([.leading, .trailing])
                    
//                    Text("E-mail*")
//                        .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
//                        .padding([.leading, .trailing, .top])
//                        .bold()
                    TextField("Email*", text: $email)
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 10)
                        .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding([.leading, .trailing])
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                }
                
                Button("Register") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                        print("its ok")
                        
                    } else {
                        print("wrong data. make alert later")
                        
                    }
                }
                .font(Font.system(size: 18, weight: .medium))
                .frame(width: 150)
                .padding([.leading, .trailing])
                .padding([.top, .bottom], 10)
                .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                
                .cornerRadius(10)
                Spacer()
                
                
               
                //            .alert("Order placed, thanks!",
                //                   isPresented: $showAlert) {
                //                Button("OK", role: .cancel) { }
                //            }
            } .onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
    
    
    
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}


// For closing keyboard by Tap outside of textfield
extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

// For closing keyboard by Tap outside of textfield
extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to `false` if you don't want to detect tap during other gestures
    }
}
