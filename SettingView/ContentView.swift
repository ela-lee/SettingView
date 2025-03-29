//
//  ContentView.swift
//  SettingView
//
//  Created by Ella's Mac on 3/29/25.
//

import SwiftUI

struct Setting: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let statue: String?
    let backgroundColor: Color
    let destination: AnyView
}

let settings1 : [Setting] = [
    Setting(icon: "wifi", title: "Wi-Fi", statue: "postech", backgroundColor: .blue, destination: AnyView(WifiView())),
            Setting(icon: "b.square", title: "Bluetooth", statue: "켬", backgroundColor: .blue, destination: AnyView(BluetoothView())),
            Setting(icon: "antenna.radiowaves.left.and.right", title: "셀룰러", statue: nil, backgroundColor: .green, destination: AnyView(CellularView())),
    Setting(icon: "personalhotspot", title: "개인용 핫스팟", statue: nil, backgroundColor: .green, destination: AnyView(PersnolHotspotView())),
    Setting(icon: "battery.100percent", title: "배터리", statue: nil, backgroundColor: .green, destination: AnyView(BatteryView()))
]

//let settings2 : [Setting] = [
//    Setting(icon: "gear", title: "일반", statue: "", backgroundColor: .gray),
//    Setting(icon: "accessibility", title: "손쉬운 사용", statue: "", backgroundColor: .blue),
//    Setting(icon: "magnifyingglass", title: "검색", statue: "", backgroundColor: .gray),
//    Setting(icon:"iphone.and.arrow.left.and.arrow.right.inward", title: "동작버튼", statue: "", backgroundColor: .blue),
//    Setting(icon: "sun.max.fill", title: "디스플레이 및 밝기", statue: nil, backgroundColor: .blue),
//    Setting(icon: "atom", title: "배경화면", statue: "", backgroundColor: .cyan),
//    Setting(icon: "app.badge.clock", title: "스텐바이", statue: nil, backgroundColor: .black),
//    Setting(icon: "rectangle.3.group", title: "제어센터", statue: nil, backgroundColor: .gray),
//    Setting(icon: "camera.fill", title: "카메라", statue: nil, backgroundColor: .gray),
//    Setting(icon: "apps.iphone", title: "홈 화면 및 앱 보관함", statue: nil, backgroundColor: .blue),
//    Setting(icon: "apple.intelligence", title: "Apple Intelligence 및 Siri", statue: nil, backgroundColor: .orange)
//]


struct ContentView: View {
    
    @State var airplainIsOn = false
    @State var searchText = ""
    
    
    var body: some View {
        
        NavigationStack {
            List {
                
                // section 1
                Section {
                    NavigationLink(destination:ICloudView()) {
                        HStack {
                            Image("istpcat")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text("Eunseo Lee")
                                    .font(.title3)
                                    .bold()
                                Text("Apple 계정, iCloud 등")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    
                    NavigationLink(destination: FamilyView()) {
                        HStack {
                            Image("istpcat")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .overlay(Circle()
                                    .stroke(Color.white, lineWidth: 1))
                                .padding(.leading, 5)
                            
                            Image("istpcat")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .overlay(Circle()
                                    .stroke(Color.white, lineWidth: 1))
                                .padding(.leading, -15)
                            
                            Image("istpcat")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .overlay(Circle()
                                    .stroke(Color.white, lineWidth: 1))
                                .padding(.leading, -15)
                            
                            Text("가족")
                        }
                    }
                    
                    NavigationLink(destination: AccountSuggestionsView()) {
                        HStack {
                            Text("구입에 포함된 서비스")
                            
                            
                            
                        }
                    }
                    
                }
                
               
                
                //section 2
                Section {
                    HStack {
                        Image(systemName: "airplane")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 17, height: 17)
                            .padding(5)
                            .foregroundStyle(.white)
                            .background(.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        
                        Text("에어플레인 모드")
                        
                        Spacer()
                        
                        Toggle("", isOn: $airplainIsOn)
                    }
                    
                    ForEach(settings1) {setting1 in NavigationLink(destination: setting1.destination) {
                        SettingRowView(icon: setting1.icon, title: setting1.title, statue: setting1.statue, backgroundColor: setting1.backgroundColor)
                    }
                }
                
                // section3
//                Section {
//                    
//                    ForEach(settings2) {setting2 in SettingRowView(icon: setting2.icon, title: setting2.title, statue: setting2.statue , backgroundColor: setting2.backgroundColor)}
                }
                
            }
            .navigationTitle("설정")
            .searchable(text: $searchText)
            .scrollIndicators(.visible)
            
        }
        
    }
}

#Preview {
    ContentView()
}
