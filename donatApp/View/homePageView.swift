//
//  homePageView.swift
//  donatApp
//
//  Created by Борух Соколов on 17.09.2023.
//

import SwiftUI

struct homePageView: View {
    
    @StateObject var donatViewModel = DonatViewModel()
    @State var needTeg:Teg = .всеМеню
    
    var body: some View {
        
        ZStack{
            Background
            VStack(alignment: .leading) {
                AppBar
               // Spacer()
                TextHelloApp
                PickerMenuTeg
                GridItemDonat
               
                
            }
            .padding(30)
        }
       

    }
}

struct homePageView_Previews: PreviewProvider {
    static var previews: some View {
        homePageView()
            .environmentObject(DonatViewModel())
    }
}


extension homePageView{
    
    var Background: some View{
        Color.black
            .ignoresSafeArea()
    }
    var PickerMenuTeg: some View{
        Picker("chose",selection: $needTeg){
            ForEach(Teg.allCases,id: \.self ){
                Text($0.rawValue)
                
            }
        }
        .pickerStyle(.segmented)
            .onAppear(perform: {
                UISegmentedControl.appearance().selectedSegmentTintColor = .yellow
                   UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
                   UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
            })
    }
    
    var AppBar: some View {
        HStack {
          Image(systemName: "line.3.horizontal")
                .resizable()
                .frame(width: 24,height: 24)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 24,height: 24)
                .foregroundColor(.white)
        }
    }
    
    var TextHelloApp: some View {
        VStack(alignment: .leading,spacing: 4){
            Text("Some sweets of")
                .foregroundColor(.white)
                .font(.system(size: 36,design: .rounded))
                .bold()
            Text("Happiness!")
                .font(.system(size: 24))
                .fontWeight(.light)
                .foregroundColor(.white)
        }
    }
    
    
    var GridItemDonat: some View{
        ScrollView(.vertical){
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 140))]) {
                ForEach(0 ..< donatViewModel.donatArr.count, id: \.self) { item in
                    
                    if((donatViewModel.donatArr[item].teg.contains(needTeg) == true) ){
                        
                        CardViewMenu(donatViewModel: donatViewModel,item: item)
                            
                        
                            .padding(.vertical,10)
                            .padding(.horizontal,5)
                            
                    }
                    
                    
                }
                
            }
           
        }
    }
    
    
}













struct CardViewMenu: View {
    @StateObject var donatViewModel : DonatViewModel
    @State var item:Int
    var body: some View {
        VStack{
            Rectangle()
                .fill(Color.secondary)
                .cornerRadius(12)
                .frame(height: 210)
                .overlay(content: {
                    VStack{
                        Image(donatViewModel.donatArr[item].image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 95,height: 97)

                        VStack(alignment: .leading){
                            Text(donatViewModel.donatArr[item].title)
                                .foregroundColor(.white)
                            // .font(.system(size: 14,design: .rounded))
                                .fontWeight(.medium)
                                .font(.callout)
                                .lineLimit(1)


                            Text(donatViewModel.donatArr[item].description)
                                .foregroundColor(.white)
                                .font(.system(size: 12,design: .rounded))
                                .fontWeight(.light)
                            HStack{
                                Text("\(donatViewModel.donatArr[item].price)")
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName:"plus")
                                    .foregroundColor(.yellow)

                            }

                        }
                        // .frame(width: 115)
                        .padding()

                    }
                })
        }
    }
}
