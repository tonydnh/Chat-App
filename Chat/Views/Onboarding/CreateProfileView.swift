//
//  CreateProfileView.swift
//  Chat
//
//  Created by Tony Dinh on 7/21/22.
//

import SwiftUI

struct CreateProfileView: View {
    
    @Binding var currentStep: OnboardingStep
    
    @State var firstName = ""
    @State var lastName = ""
    
    @State var selectedImage: UIImage?
    @State var isPickerShowing = false
    
    @State var isSourceMenuShowing = false
    @State var source: UIImagePickerController.SourceType = .photoLibrary
    
    @State var isSaveButtonDisabled = false
    
    var body: some View {
        
        VStack {
            
            Text("Setup your Profile")
                .font(Font.titleText)
                .padding(.top, 52)
            
            Text("Just a few more details to get started")
                .font(Font.bodyParagraph)
                .padding(.top, 12)
            
            Spacer()
            
            // Profile image button
            Button {
                // Show action sheet
                isSourceMenuShowing = true
                
            } label: {
                ZStack {
                    
                    if selectedImage != nil {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                    }
                    else {
                        
                        Circle()
                            .foregroundColor(.white)
                        
                        Image(systemName: "camera.fill")
                            .tint(Color("icons-input"))
                    }
                    
                    Circle()
                        .stroke(Color("create-profile-border"), lineWidth: 2)
                    
                }
                .frame(width: 134, height: 134)
                
            }
            
            Spacer()
            
            // First name
            TextField("Given Name", text: $firstName)
                .textFieldStyle(CreateProfileTextfieldStyle())
            
            // Last name
            TextField("Last Name", text: $lastName)
                .textFieldStyle(CreateProfileTextfieldStyle())
            
            Spacer()
            
            Button {
                // Prevent double taps
                isSaveButtonDisabled = true
                
                // Save the data
                DatabaseService().setUserProfile(firstName: firstName, lastName: lastName, image: selectedImage) { isSuccess in
                    if isSuccess {
                        currentStep = .contacts
                    }
                    else {
                        // TODO: Show error message to the user
                    }
                    
                    isSaveButtonDisabled = false
                }
                
            } label: {
                Text(isSaveButtonDisabled ? "Uploading": "Save")
            }
            .buttonStyle(OnboardingButtonStyle())
            .disabled(isSaveButtonDisabled)
            .padding(.bottom, 87)
            
            
        }
        .padding(.horizontal)
        .confirmationDialog("From where?", isPresented: $isSourceMenuShowing, actions: {
            Button {
                // Set the source to photo library
                isPickerShowing = true
                
                // Show the image picker
                self.source = .photoLibrary
            } label: {
                Text("Photo Library")
            }
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                Button {
                    // Set the source to camera
                    self.source = .camera
                    
                    // Show the image picker
                    isPickerShowing = true
                } label: {
                    Text("Take Photo")
                }
            }
            
        })
        .sheet(isPresented: $isPickerShowing) {
            // Show the image picker
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing, source: self.source)
        }
        
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView(currentStep: .constant(.profile))
    }
}
