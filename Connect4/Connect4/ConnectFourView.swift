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
            ForEach (0..<7) { col in
                VStack {
                    ForEach (0..<6) { i in
                        ZStack {
                            if let piece = connectFourViewModel.pieceAt(col: col, row: 5 - i) {
                                Circle()
                                    .fill(piece.player.isRed ? Color.red : .yellow)
                            }
                            Circle()
                                .stroke(lineWidth: 2)
                        }
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
