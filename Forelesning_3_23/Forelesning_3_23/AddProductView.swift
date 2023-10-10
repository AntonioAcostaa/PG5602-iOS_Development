//
//  AddProductView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 11/09/2023.
//

import SwiftUI

struct AddProductView: View {
    var didAddProduct: ((Product) -> ())
    
    init(didAddProduct: @escaping ((Product) -> Void) ) {
        self.didAddProduct = didAddProduct
    }
    
    /// Textfield attributes
    @State var newProductName: String = ""
    @State var newProductPrice: String = ""
    @State var newProductDescription: String = ""
    
    @State var isShowingErrorAlert: Bool = false
    
    @State var isShowingPhotoPickerView = false
    
    //    var myname: String
    
    func addProduct() -> () {
        if let productPrice = Int(newProductPrice) {
            let product = Product(name: newProductName, description: newProductDescription, price: productPrice, images: []
            )
            didAddProduct(product)
        } else {
            isShowingErrorAlert = true
        }
        return ()
    }
    
    func didTapPhotoPickerButton() {
        isShowingPhotoPickerView = true
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text("Legg til nytt produkt")
                    .font(.title)
                    .padding(30)
                Spacer()
            } // title hstack
            
            TextField("Produktnavn", text: $newProductName)
            
            TextField("Beskrivelse", text: $newProductDescription)
            TextField("Pris", text: $newProductPrice)
            
            
            Button() {
                // user tapped button
                print("user tapped button")
                addProduct()
                return
            } label: {
                VStack {
                    Text("Lagre")
                    Text("Produkt")
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            Button {
                didTapPhotoPickerButton()
            } label: {
                Text("Velg produktbilde")
            }
            .buttonStyle(.borderedProminent)
            Spacer()

        }.sheet(isPresented: $isShowingPhotoPickerView, content: {
            PhotoPickerView(sourceType: .photoLibrary) { image in
                print(image)
            }
                
        })
        
        .alert("Det skjedde noe feil",
                isPresented: $isShowingErrorAlert) {
            Text("dette var actions")
        } message: {
            Text("Dette var message")
                .foregroundColor(.red)
        }

    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView() { product in
            
        }
    }
}
