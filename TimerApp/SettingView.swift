//
//  SettingView.swift
//  TimerApp
//
//  Created by 菅谷亮太 on 2023/03/18.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("timer_value") var timeValue = 10
    var body: some View {
        ZStack{
            Color("backgroundSetting")
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("\(timeValue)秒").font(.largeTitle)
                //picker表示
                Picker(selection: $timeValue){
                    Text("10").tag(10)
                    Text("20").tag(20)
                    Text("30").tag(30)
                    Text("40").tag(40)
                    Text("50").tag(50)
                    Text("60").tag(60)
                }label: {
                    Text("選択")
                }.pickerStyle(.wheel)
                Spacer()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
