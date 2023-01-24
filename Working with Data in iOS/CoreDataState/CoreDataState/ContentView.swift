import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors:[NSSortDescriptor(key: "name",
                                          ascending: true,
                                          selector: #selector(NSString .localizedStandardCompare)),
                         NSSortDescriptor(key: "size",
                                          ascending: true,
                                          selector: #selector(NSString .localizedStandardCompare))
        ],
        animation: .default)
    var desserts: FetchedResults<Dessert>
        
    var body: some View {
        NavigationView{
            VStack{
                Text("DESSERTS")
                    .font(.title)
                List {
                    ForEach(desserts) { dessert in
                        
                        VStack(alignment:.leading){
                            Text (dessert.name!)
                            
                            HStack (spacing: 40){
                                Text (dessert.size!)
                                Spacer()
                                Text("$\(dessert.price, specifier: "%.2f")")
                            }
                            .foregroundColor(.gray)
                            .font(.callout)
                        }
                    }
                }
                
//                Button(action: {
//                    createDishes()
//                }, label: {
//                  Text("Add Dishes")
//                })

            }
//           .onAppear{createDesserts()}
        }
    }
    
    
    
    func createDesserts() {
//        return
        let profiterole = Dessert(context: viewContext)
        profiterole.name = "Profiterole"
        profiterole.size = "extra"
        profiterole.price = 2.99
        
        let cremeBurlee = Dessert(context: viewContext)
        cremeBurlee.name = "Crème Burlée"
        cremeBurlee.size = "normal"
        cremeBurlee.price = 3.99
        
        let iceCream = Dessert(context: viewContext)
        iceCream.name = "Ice Cream"
        iceCream.size = "extra"
        iceCream.price = 5.99
        
        let applePie = Dessert(context: viewContext)
        applePie.name = "Apple Pie"
        applePie.size = "extra large"
        applePie.price = 2.99
        
        let eclair = Dessert(context: viewContext)
        eclair.name = "Éclair"
        eclair.size = "large"
        eclair.price = 3.99
        
        let crepe = Dessert(context: viewContext)
        crepe.name = "Crêpe Suzette"
        crepe.size = "large"
        crepe.price = 3.99
        
        let piece = Dessert(context: viewContext)
        piece.name = "Pièce montée"
        piece.size = "extra"
        piece.price = 5.99
        
        let imperatrice = Dessert(context: viewContext)
        imperatrice.name = "Riz à l'impératrice"
        imperatrice.size = "extra large"
        imperatrice.price = 2.99
        
        let cheeseCake = Dessert(context: viewContext)
        cheeseCake.name = "Cheese Cake"
        cheeseCake.size = "medium"
        cheeseCake.price = 4.99
        
        let carrotCake = Dessert(context: viewContext)
        carrotCake.name = "Carrot Cake"
        carrotCake.size = "small"
        carrotCake.price = 3.99
        
        
        let profiterole2 = Dessert(context: viewContext)
        profiterole2.name = "Profiterole"
        profiterole2.size = "all"
        profiterole2.price = 2.99
        
        let cremeBurlee2 = Dessert(context: viewContext)
        cremeBurlee2.name = "Crème Burlée"
        cremeBurlee2.size = "aaa"
        cremeBurlee2.price = 3.99
        
        let iceCream2 = Dessert(context: viewContext)
        iceCream2.name = "Ice Cream"
        iceCream2.size = "bbb"
        iceCream2.price = 5.99
        
        
        saveDatabase()
    }
    
    
    
    func saveDatabase() {
        guard viewContext.hasChanges else { return}
        do {
            try viewContext.save()
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



