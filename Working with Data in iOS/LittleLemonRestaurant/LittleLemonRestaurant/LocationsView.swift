import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
    
    var body: some View {
        VStack {
            LittleLemonLogo()
                .padding(.top, 50)
            
            Text (model.displayingReservationForm ? "Reservation Details" :
                    "Select a location")
            .padding([.leading, .trailing], 40)
            .padding([.top, .bottom], 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            
            NavigationView {
                // EmptyView()
                List(model.restaurants, id: \.self) { restaurant in
                    NavigationLink(destination: ReservationForm(restaurant)) {
                        RestaurantView(restaurant)
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
            
            .onDisappear{
                if model.tabBarChanged { return }
                
                // this changes the phrase from "Select a location"
                // to "RESERVATION"
                model.displayingReservationForm = true
            }
            
            .frame(maxHeight: .infinity)
            
            // SwiftUI has this space between the title and the list
            // that is amost impossible to remove without incurring
            // into complex steps that run out of the scope of this
            // course, so, this is a hack, to bring the list up
            // try to comment this line and see what happens.
            .padding(.top, -10)
            
            // makes the list background invisible, default is gray
            .scrollContentBackground(.hidden)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}
