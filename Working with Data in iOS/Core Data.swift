@FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var dishes: FetchedResults<Dish>
   
    oneDish.customer = [oneCustomer]

    let newDish = Dish(context: viewContext)
    newDish.name = "Apple Pie"
    newDish.size = "Extra Large"
    newDish.price = 10

    let newLocation = Location(context: viewContext)
    newLocation.name = "9000 Example Road"
    newLocation.name = "(212) 555 1234"
