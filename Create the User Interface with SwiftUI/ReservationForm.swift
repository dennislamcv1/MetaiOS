import SwiftUI

struct ReservationForm: View { 
    @State var customerName:String = "" 
    var body: some View {  
        Form {
            TextField("Type Your Name", 
                text:$customerName, 
                onEditingChanged: { status in 
                    print(status) 
                }) 
            .onSubmit({ 
                print("submitted") 
            }) 
            .onChange(of: customerName, perform: { newValue in 
                print(newValue) 
            }) 

        }
        .padding() 
    } 
} 
struct ReservationForm_Previews: PreviewProvider {
    static var previews: some View {
        ReservationForm()
    }
}