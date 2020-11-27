//
//  ConnectFourViewModel.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-26.
//

import Foundation

class ConnectFourViewModel: ObservableObject {
    @Published private var connectFour: ConnectFour = ConnectFour()
    
    func pieceAt(col: Int, row: Int) -> ConnectFour.Piece? {
        connectFour.pieceAt(col: col, row: row)
    }
    
    func drop(at col: Int) {
        connectFour.drop(at: col)
    }
}
