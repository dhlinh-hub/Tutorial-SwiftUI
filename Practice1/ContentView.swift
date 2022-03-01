//
//  ContentView.swift
//  Practice1
//
//  Created by Mac on 23/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State var colors: [Color] = [.pink, .purple, .gray, .black, .red, .orange, .yellow, .green, .blue]
    let items = [Items(id: 0, name: "Anh", image: "1"),
                 Items(id: 1, name: "Truong", image: "2"),
                 Items(id: 2, name: "Nghien", image: "3"),
                 Items(id: 3, name: "Vai", image: "4"),
                 Items(id: 4, name: "Lol", image: "5"),
                 Items(id: 5, name: "Lol", image: "5"),
                 Items(id: 6, name: "Lol", image: "5"),
                 Items(id: 7, name: "Lol", image: "5"),
                 Items(id: 8, name: "Lol", image: "5"),
                 Items(id: 9, name: "Lol", image: "5"),
                 
                 
    ]
    var body: some View {
        
        /// - MARK : TableView sử dụng Stack
        //        NavigationView {
        //            ScrollView(.horizontal) {
        //                HStack{
        //                    ForEach(0..<items.count, id: \.self) { index in
        //                        BoxView(item: items[index])
        //                    }
        //                }
        //                Spacer()
        //            }
        //            .navigationBarTitle(Text("Placeholder"))
        //        }
        
        //        /// - MARK : TableView sử dụng List
        //                    List(items) { item in
        //                        BoxView(item: item)
        //                }
        
        // - MARK : CollectionView
        
        //        Ngoài .flexible, GridItem còn có thể được khởi tạo với 2 thuộc tính khác: .adaptive hoặc .fixed
        //        * .adaptive: thuộc tính này sẽ tự động tính toán khoảng trống của Grid, để điền càng nhiều View vào Grid càng tốt
        //        * .fixed: thuộc tính này đơn giản nhất, fix size của View vào 1 kích thước cố định
        
        let columns = Array(repeating: GridItem(.flexible()), count: 3)
        /// count ở đây chính là số cột
        let col = [GridItem(.adaptive(minimum:100))]
        /// 100 ở đây chính là size của item
        ScrollView(.vertical) {
            LazyVGrid(columns: col, content: {
                
                ForEach(items) { item in
                    BoxView(item: item)
                }
            })
            .padding(.horizontal, 10)
        }
        .padding()
    }
}


struct BoxView: View {
    let item: Items
    
    var body: some View {
        VStack {
            Button(action: {
                print("\(item.id)")
            }, label: {
                VStack {
                    Image("\(item.image)")
                        .resizable()
                        .frame(width: (UIScreen.main.bounds.width/3)-25 , height:  (UIScreen.main.bounds.width/3) - 35, alignment: .center)
                        .cornerRadius(3.0)
                    Text("\(item.name)")
                        .font(.footnote)
                        .frame(width: 100, height: 10, alignment: .leading)
                        .lineLimit(0)
                }
            })
        }
        .cornerRadius(5.0)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8")
    }
}
