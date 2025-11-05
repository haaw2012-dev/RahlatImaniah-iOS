import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.1, green: 0.2, blue: 0.5),
                        Color(red: 0.2, green: 0.3, blue: 0.6)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 25) {
                    Text("رحلة إيمانية")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            NavigationLink(destination: QuranView()) {
                                IconCard(name: "القرآن الكريم", icon: "📖", color: .green)
                            }
                            
                            NavigationLink(destination: SebhaView()) {
                                IconCard(name: "السبحة الإلكترونية", icon: "📿", color: .blue)
                            }
                            
                            NavigationLink(destination: DuaView()) {
                                IconCard(name: "الأدعية والتعقيبات", icon: "🤲", color: .orange)
                            }
                            
                            NavigationLink(destination: ClockView()) {
                                IconCard(name: "الساعة والمنبه", icon: "⏰", color: .yellow)
                            }
                            
                            NavigationLink(destination: CompassView()) {
                                IconCard(name: "البوصلة", icon: "🧭", color: .red)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct IconCard: View {
    var name: String
    var icon: String
    var color: Color
    
    var body: some View {
        VStack(spacing: 15) {
            Text(icon)
                .font(.system(size: 60))
                .scaleEffect(1.0)
                .shadow(radius: 5)
            
            Text(name)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(color.opacity(0.8))
                .shadow(color: color.opacity(0.5), radius: 10, x: 0, y: 5)
        )
    }
}

#Preview {
    ContentView()
}
