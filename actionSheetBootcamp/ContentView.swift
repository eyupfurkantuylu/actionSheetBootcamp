//
//  ContentView.swift
//  actionSheetBootcamp
//
//  Created by Eyüp Tüylü on 28.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var showActionSheet: Bool = false
    @State var actionSheetOption: ActionSheetOptions = .isOtherPost
    
    enum ActionSheetOptions{
        case isMyPost
        case isOtherPost
    }
    
    
    var body: some View {
        VStack {
            
            HStack{
                Circle()
                    .frame(width: 50, height: 50)
                Text("@eyupfurkantuylu")
                Spacer()
                Button {
                    actionSheetOption = .isOtherPost
                    showActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                }
                .accentColor(.primary)
                
            }
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }
        .padding()
        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
    }
    
    
    func getActionSheet() -> ActionSheet {
        
        let shareButton: ActionSheet.Button = .default(Text("Share")){
            // Share butonuna basıldığında yapılacaklar.
        }
        
        let reportButton: ActionSheet.Button = .destructive(Text("Report")) {
            // Report butonuna basıldığında yapılacaklar.
        }
        
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete")) {
            // Delete butonuna basıldığında yapılacaklar.
        }
        
        let cancelButton: ActionSheet.Button = .cancel()
        let titleText = Text("Merhaba, YouTube!")
        
        
        switch actionSheetOption{
        case .isOtherPost:
            return ActionSheet(
                title: titleText,
                message: nil,
                buttons: [shareButton, reportButton, cancelButton]
            )
        case .isMyPost:
            return ActionSheet(
                title: titleText,
                message: nil,
                buttons: [shareButton, deleteButton, cancelButton]
            )
            
        }
        
        
    //    let aboneOl: ActionSheet.Button = .default(Text("Abone Ol"))
    //    let yorumYap: ActionSheet.Button = .destructive(Text("Yorum Yap"))
    //    let cancelButton: ActionSheet.Button = .cancel()
    //
    //    return ActionSheet(
    //        title: Text("Burası başlık alanı"),
    //        message: Text("Burası mesaj alanı"),
    //        buttons: [aboneOl, yorumYap, cancelButton]
    //    )
    }
    
    
    
    
    
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
