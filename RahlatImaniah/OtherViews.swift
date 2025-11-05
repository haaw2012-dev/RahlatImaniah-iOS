import SwiftUI

struct QuranView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("القرآن الكريم")
                .font(.title)
                .bold()
                .foregroundColor(.green)
            
            Image(systemName: "book.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)
            
            Text("سيتم عرض القرآن الكريم كاملاً من ملف PDF")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {}) {
                Text("فتح القرآن")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 12)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("القرآن الكريم")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DuaView: View {
    let duas = [("دعاء الصباح", "اللهم بك أصبحنا وبك أمسينا وبك نحيا وبك نموت"),("دعاء المساء", "اللهم بك أمسينا وبك أصبحنا وبك نحيا وبك نموت")]
    
    @State private var selectedDua = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("الأدعية والتعقيبات")
                .font(.title)
                .bold()
                .foregroundColor(.orange)
            
            Picker("اختر الدعاء", selection: $selectedDua) {
                ForEach(duas.indices, id: \.self) { index in
                    Text(duas[index].0).tag(index)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            VStack(spacing: 15) {
                Text(duas[selectedDua].0)
                    .font(.headline)
                    .foregroundColor(.orange)
                
                Text(duas[selectedDua].1)
                    .font(.body)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .padding()
            }
            .padding()
            .background(Color.orange.opacity(0.1))
            .cornerRadius(15)
            
            Button(action: {}) {
                Label("استمع للدعاء", systemImage: "speaker.wave.2")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("الأدعية والتعقيبات")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ClockView: View {
    @State private var currentTime = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("الساعة والمنبه")
                .font(.title)
                .bold()
                .foregroundColor(.yellow)
            
            VStack(spacing: 10) {
                Text(currentTime, style: .time)
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(.yellow)
                
                Text(currentTime, style: .date)
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.yellow.opacity(0.1))
            .cornerRadius(15)
            
            ZStack {
                Circle()
                    .stroke(Color.yellow.opacity(0.3), lineWidth: 2)
                
                Image(systemName: "clock.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.yellow)
            }
            .frame(height: 150)
            .padding()
            
            Button(action: {}) {
                Label("تعيين منبه", systemImage: "bell")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("الساعة والمنبه")
        .navigationBarTitleDisplayMode(.inline)
        .onReceive(timer) { _ in
            currentTime = Date()
        }
    }
}

struct CompassView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("البوصلة")
                .font(.title)
                .bold()
                .foregroundColor(.red)
            
            ZStack {
                Circle()
                    .stroke(Color.red.opacity(0.3), lineWidth: 2)
                
                Image(systemName: "location.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.red)
            }
            .frame(height: 200)
            .padding()
            
            Text("البوصلة لحساب اتجاه القبلة")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {}) {
                Label("حدد القبلة", systemImage: "location.circle.fill")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("البوصلة")
        .navigationBarTitleDisplayMode(.inline)
    }
}
