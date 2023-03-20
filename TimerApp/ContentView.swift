//
//  ContentView.swift
//  TimerApp
//
//  Created by 菅谷亮太 on 2023/03/17.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler : Timer?
    @State var count = 0
    @AppStorage("timer_value") var timeValue = 10
    @State var showAlert = false
    var body: some View {
        NavigationStack{
            ZStack{
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack(spacing:30.0){
                    Text("残り\(timeValue-count)秒")
                        .font(.largeTitle)
                    HStack{
                        Button{
                            startTimer()
                        }label: {
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 140,height: 140)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        Button{
                            stopTimer()
                        } label: {
                            Text("ストップ")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 140,height: 140)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }.onAppear{
                count = 0
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink{
                        SettingView()
                    } label: {
                        Text("秒数設定")
                    }
                }
            }
            .alert("終了",isPresented: $showAlert){
                Button("OK"){
                    print("OK")
                }
            } message: {
                Text("タイマー終了時間です")
            }
        }
    }
    func counDownTimer(){
        count += 1
        if timeValue - count <= 0{
            timerHandler?.invalidate()
            showAlert = true
        }
    }
    func startTimer(){
        if let unwrapedTimehandler = timerHandler {
            if unwrapedTimehandler.isValid{
                return
            }
        }
        if timeValue - count <= 0{
            count = 0
        }
        
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            counDownTimer()
        }
    }
    func stopTimer(){
        if let unwrapedTimehandler = timerHandler {
            if unwrapedTimehandler.isValid {
                unwrapedTimehandler.invalidate()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
