//
//  ConnectFourView.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-26.
//

import SwiftUI

struct ConnectFourView: View {
    @ObservedObject var connectFourViewModel: ConnectFourViewModel
    
    var body: some View {
        HStack {
            ForEach (0..<7) { _ in
                VStack {
                    ForEach (0..<6) { _ in
                        Circle()
                            .stroke()
                    }
                }
            }
        }
        .padding()
    }
}

struct ConnectFourView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectFourView(connectFourViewModel: ConnectFourViewModel())
    }
}
