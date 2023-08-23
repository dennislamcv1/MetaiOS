class VirtualBankSystem {
    var accountType = ""
    func welcomeCustomer() {
        print("Welcome to your virtual bank system.")
    }
    func onboardCustomerAccountOpening() {
        print("What kind of account would you like to open?")
        print("1. Debit account")
        print("2. Credit account")
    }
…} while virtualBankSystem.accountType == ""