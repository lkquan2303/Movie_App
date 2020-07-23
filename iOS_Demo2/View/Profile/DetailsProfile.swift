//
//  DetailsProfile.swift
//  iOS_Demo
//
//  Created by Uri on 7/17/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct DetailsProfile: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    @State var birthday = Date()
    @State var isPresent = false
    @State var isDatePicker = Date()
    @State var isGender = false
    @State var emailTF = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isShowingImagePicker = false
    @State var imageInBlankBox = UIImage()
    @State private var defauldImage: Image?
    var a:String?
    let dayPicker = UIDatePicker()
    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment: .top){
                HStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("CANCEL")
                    })
                        .padding(5).background(Color("bg3")).foregroundColor(Color.white)
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("DONE").foregroundColor(.white)
                    }.padding(5).background(Color("Color"))
                }
                HStack{
                    Spacer()
                    Button(action: {
                        self.isShowingImagePicker.toggle()
                        
                    }) {
                        ZStack{
//                            defauldImage? .resizable().frame(width: 300, height: 300)
                            Image(uiImage: self.imageInBlankBox).renderingMode(.original).resizable().frame(width: 300, height: 300).clipShape(Circle())
                        }
                        
                    }.sheet(isPresented: self.$isShowingImagePicker) {
                        ImagePickerView(isPresented: self.$isShowingImagePicker, selectedImage: self.$imageInBlankBox)
                    }
                    Spacer()
                }
//                .onAppear(perform: loadImageDefault)
                Spacer()
            }
            
            HStack{
                Spacer()
                Text("John Marker").font(.system(size: 25)).fontWeight(.bold)
                Spacer()
            }
            Form{
                HStack(alignment: .center, spacing: 10){
                    Image("cake").resizable().frame(width: 30, height: 30)
                    DatePicker("", selection: $isDatePicker,displayedComponents: .date).labelsHidden()
                }
                HStack{
                    Image("mail").resizable().frame(width: 30, height: 30)
                    TextField("example@email.com", text: $emailTF)
                }
                HStack{
                    Image("person").resizable().frame(width: 30, height: 30)
                    Text("Male")
                    Button(action: {
                        self.isGender.toggle()
                    }) {
                        Image(systemName: isGender == true ? "circle" : "largecircle.fill.circle")
                    }
                    Spacer()
                    Text("Female")
                    Button(action: {
                        self.isGender.toggle()
                    }) {
                        Image(systemName: isGender == true ? "largecircle.fill.circle" : "circle")
                    }
                    
                }
            }.background(Color.white)
            
            Spacer()
        }.padding()
    }
    func loadImageDefault(){
        if isShowingImagePicker == false{
            defauldImage = Image("sad")
        }else{
            defauldImage = Image(uiImage: self.imageInBlankBox).renderingMode(.original).resizable().frame(width: 300, height: 300).clipShape(Circle()) as? Image
        }
        }
       
}

struct DetailsProfile_Previews: PreviewProvider {
    static var previews: some View {
        DetailsProfile()
    }
}

struct RadioButtonField: View{
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    let isMarked: Bool
    let callBack: (String) -> ()
    init(id: String, label: String, size: CGFloat, color: Color, textSize: CGFloat, isMarked: Bool, callBack: @escaping (String) ->()) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.isMarked = isMarked
        self.callBack = callBack
    }
    var body: some View{
        Button(action: {
            
        }) {
            HStack{
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: self.size, height: self.size)
                Text("Lavel").font(Font.system(size: textSize))
                Spacer()
            }.foregroundColor(self.color)
        }.foregroundColor(Color.white)
    }
}
struct DummyView: UIViewRepresentable{
    func makeUIView(context: UIViewRepresentableContext<DummyView>) -> UIButton{
        let button  = UIButton()
        button.setTitle("Hello", for: .normal)
        button.backgroundColor = .red
        return button
    }
    func updateUIView(_ uiView: DummyView.UIViewType, context: UIViewRepresentableContext<DummyView>) {
        
    }
}
struct ImagePickerView: UIViewControllerRepresentable{
    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) ->  UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator(parent: self)
    }
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        let parent: ImagePickerView
        init(parent: ImagePickerView) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImageFromPicker = info[.originalImage] as? UIImage{
                self.parent.selectedImage = selectedImageFromPicker
                
            }
            self.parent.isPresented = false
        }
    }
    
    func updateUIViewController(_ uiViewController: ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
    
}
