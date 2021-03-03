//
//  ContentView.swift
//  ManyButton
//
//  Created by 澤崎正佳 on 2021/03/03.
//

import SwiftUI

let character = ["ルフィ", "ゾロ", "ナミ", "サンジ"]

struct ContentView: View {
    @State var id = 0
    
    var body: some View {
        VStack{
            Image(character[id])
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Choose Your Character!!")
                .font(.title)
                .fontWeight(.bold)
            // ボタンを4つ並べる
            // テンプレートの呼び出し
            HStack{
                CharacterButton(id: $id, number: 0, buttonColor: Color.red)
                CharacterButton(id: $id, number: 1, buttonColor: Color.green)
            }
            HStack{
                CharacterButton(id: $id, number: 2, buttonColor: Color.orange)
                CharacterButton(id: $id, number: 3, buttonColor: Color.blue)
            }
        }
    }
}

// テンプレート
struct CharacterButton: View {
    // 違う部分はプロパティにしてそれぞれ変えられるようにする
    @Binding var id: Int
    let number: Int
    let buttonColor: Color
    
    var body: some View {
        // 重複しているコードを書き出す
        Button(action: {
            id = number
        }, label: {
            Text(character[number])
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 130, height: 130)
                .background(buttonColor)
                .cornerRadius(20)
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
