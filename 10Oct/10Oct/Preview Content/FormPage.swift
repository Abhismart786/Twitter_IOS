import SwiftUI

struct FormPage: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var age: String = ""
    @State private var showDetailsPage = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Register Page:")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.blue)
            
            TextField("Enter Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .padding()
            
            TextField("Enter Age", text: $age)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.headline)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Button(action: {
                if validationForm() {
                    showDetailsPage = true
                }
            }) {
                Text("Submit")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
            
            NavigationLink(destination: DetailTests(name: name, age: age, email: email), isActive: $showDetailsPage) {
                EmptyView()
            }
        }
        .padding()
    }
    
    func validationForm() -> Bool {
        if name.isEmpty {
            errorMessage = "Please enter your name"
            return false
        }
        if email.isEmpty {
            errorMessage = "Please enter your email"
            return false
        }
        if age.isEmpty {
            errorMessage = "Please enter your age"
            return false
        }
        errorMessage = ""
        return true
    }
}

struct DetailTests: View {
    var name: String
    var age: String
    var email: String
    
    var body: some View {
        VStack {
            Text("Details Page:")
                .font(.largeTitle)
                .padding()
            Text("Name: \(name)")
                .font(.title)
            Text("Email: \(email)")
                .font(.title)
            Text("Age: \(age)")
                .font(.title)
        }
        .padding()
    }
}

#Preview {
    FormPage()
}

