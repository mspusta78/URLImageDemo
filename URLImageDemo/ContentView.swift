//
//  ContentView.swift
//  URLImageDemo
//
//  Created by Martin Spusta on 7/18/20.
//

import SwiftUI
import URLImage

struct speakerArray : Decodable {
    let speakers : [speakersData]
}

struct speakersData: Decodable, Equatable, Identifiable {
    let id = UUID()
    var speakerID : Int = 1
    var speakerName : String = "Speaker"
    var speakerImage : String = "https://main.secure.footprint.net//dnn/sc_images/speakers/chris_brady.jpg"
}


struct ContentView: View {
    
    let jsonSpeakers : speakerArray =  Bundle.main.decode(speakerArray.self, from: "speakersAll.json")
    
    let layout = [
        GridItem(.adaptive(minimum: 175))
    ]
    let layoutHgrid = [
        GridItem(.fixed(175))
    ]
    
    
    var body: some View {
        
        
        NavigationView{
            
            VStack{
                
                ScrollView{
                    
                    LazyVGrid(columns: layout, spacing: 10){
                        
                        ForEach(0..<jsonSpeakers.speakers.count) { i in
                            
                            NavigationLink(
                                destination:
                                    
                                    VStack{
                                        if let speakerurl = jsonSpeakers.speakers[i].speakerImage{
                                            URLImage(URL(string: speakerurl)!,
                                                     delay: 1.0,
                                                     content:  {
                                                        $0.image
                                                            .renderingMode(.original)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .clipped()
                                                            .clipShape(Circle())
                                                        
                                                     })
                                                .frame(width: 250.0, height: 250.0)
                                        }
                                        Text(jsonSpeakers.speakers[i].speakerName)
                                    },
                                label: {
                                    VStack(alignment: .center) {
                                        
                                        
                                        
                                        if let speakerurl = jsonSpeakers.speakers[i].speakerImage{
                                            
                                            URLImage(URL(string: speakerurl)!,
                                                     delay: 1.0,
                                                     content:  {
                                                        $0.image
                                                            .renderingMode(.original)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .clipped()
                                                            .clipShape(Circle())
                                                        
                                                     })
                                                .frame(width: 125.0, height: 125.0)
                                            
                                        }
                                        
                                        
                                        Text(jsonSpeakers.speakers[i].speakerName ?? "")
                                            .font(.headline)
                                            .foregroundColor(Color("textColor"))
                                            .frame(width: 150, height: 50, alignment: .top)
                                            .multilineTextAlignment(.center)
                                            .truncationMode(.tail)
                                        
                                    }.padding(.bottom, 10)
                                })
                            
                            
                            
                        }
                    }
                }
                
                ScrollView{
                    
                    LazyVStack{
                        
                        ForEach(0..<jsonSpeakers.speakers.count) { i in
                            
                            NavigationLink(
                                destination:
                                    
                                    VStack{
                                        if let speakerurl = jsonSpeakers.speakers[i].speakerImage{
                                            URLImage(URL(string: speakerurl)!,
                                                     delay: 1.0,
                                                     content:  {
                                                        $0.image
                                                            .renderingMode(.original)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .clipped()
                                                            .clipShape(Circle())
                                                        
                                                     })
                                                .frame(width: 250.0, height: 250.0)
                                        }
                                        Text(jsonSpeakers.speakers[i].speakerName)
                                    },
                                label: {
                                    VStack(alignment: .center) {
                                        
                                        
                                        
                                        if let speakerurl = jsonSpeakers.speakers[i].speakerImage{
                                            
                                            URLImage(URL(string: speakerurl)!,
                                                     delay: 1.0,
                                                     content:  {
                                                        $0.image
                                                            .renderingMode(.original)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .clipped()
                                                            .clipShape(Circle())
                                                        
                                                     })
                                                .frame(width: 125.0, height: 125.0)
                                            
                                        }
                                        
                                        
                                        Text(jsonSpeakers.speakers[i].speakerName ?? "")
                                            .font(.headline)
                                            .foregroundColor(Color("textColor"))
                                            .frame(width: 150, height: 50, alignment: .top)
                                            .multilineTextAlignment(.center)
                                            .truncationMode(.tail)
                                        
                                    }.padding(.bottom, 10)
                                })
                            
                            
                            
                        }
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
