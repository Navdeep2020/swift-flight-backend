//
//  HomeView.swift
//  VaporClientSide
//
//  Created by Navdeep Singh on 08/09/24.
//

import SwiftUI



struct HomeView: View {
    
    let flight: Flight
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#4A90E2"))]), startPoint: .top, endPoint: .bottom))
                .shadow(radius: 5)
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "airplane")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(.black)
                        Text(flight.flightNumber ?? "")
                    }
                    
                    Spacer()
                    Text(flight.company ?? "")
                        .fontWeight(.light)
                        .foregroundColor(.black)
                }
                HStack {
                    VStack {
                        Text(flight.sourceCode ?? "")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(flight.source ?? "")
                            .font(.callout)
                    }
                    Spacer()
                    Image(systemName: "airplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(.black)
                    Spacer()
                    VStack {
                        Text(flight.destinationCode ?? "")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(flight.destination ?? "")
                            .font(.callout)
                    }
                }
                
                // Timings
                HStack {
                    Group {
                        Image(systemName: "airplane.departure")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(.black.opacity(0.7))
                        Text(flight.departure ?? "")
                            .font(.headline)
                            .foregroundColor(.black)
                        
                    }
                    Spacer()
                    // Flight Duration Display
                    VStack {
                        Text(flight.duration ?? "")
                            .font(.caption)
                            .padding(6)
                            .cornerRadius(8)
                    }
                    
                    Spacer()

                    Group {
                        Image(systemName: "airplane.arrival")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(.black.opacity(0.7))
                        Text(flight.arrival ?? "")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                }
                
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(height: 1)
                Spacer()
                HStack {
                    Text("₹ \(flight.fare)")
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                    Text("Book")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
        .frame(maxWidth: 350, minHeight: 220,maxHeight: 220, alignment: .center)
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

#Preview {
    HomeView(flight: Flight(id: 1224, fare: 27637, stops: 0, flightNumber: "AI323", company: "Air India", departure: "06:30", arrival: "11:30", duration: "9h 30m", source: "Delhi", destination: "Dubai"))
}
