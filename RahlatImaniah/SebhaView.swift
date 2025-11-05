import SwiftUI

struct SebhaView: View {
    let azkar = ["الله أكبر 🌟","الحمد لله 🙏","سبحان الله ✨","أستغفر الله 🤲","اللهم صلِّ على محمد وآل محمد 📿"]
    
    @State private var selectedZikr = 0
    @State private var count = 0
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text("السبحة الالكترونية")
                .font(.title)
                .bold()
                .foregroundColor(.blue)
            
            VStack {
                Text("الذكر الحالي:")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Picker("اختر الذكر", selection: $selectedZikr) {
                    ForEach(azkar.indices, id: \.self) { index in
                        Text(azkar[index]).tag(index)
                    }
                }
                .pickerStyle(.wheel)
                .frame(height: 100)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(15)
            
            Text(azkar[selectedZikr])
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.blue)
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(15)
            
            VStack(spacing: 10) {
                Text("العدد")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("\(count)")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.green)
                    .scaleEffect(isAnimating ? 1.2 : 1.0)
            }
            .padding()
            .background(Color.green.opacity(0.1))
            .cornerRadius(15)
            
            Button(action: {
                count += 1
                withAnimation {
                    isAnimating = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    isAnimating = false
                }
            }) {
                VStack(spacing: 10) {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.blue)
                        .shadow(radius: 10)
                    Text("اضغط للعد")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .frame(width: 150, height: 150)
                .background(Color.blue.opacity(0.8))
                .cornerRadius(75)
                .shadow(color: Color.blue.opacity(0.5), radius: 15, x: 0, y: 10)
            }
            
            Button(action: { count = 0 }) {
                Text("إعادة تعيين")
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
        .navigationTitle("السبحة الإلكترونية")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SebhaView()
}
