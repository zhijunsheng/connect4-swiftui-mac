//
//  ConnectFour.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-26.
//

import Foundation

struct ConnectFour {
    private var piecesBox: Set<Piece> = [
        Piece(col: 0, row: 0, player: .yellow),
        Piece(col: 0, row: 1, player: .red)
    ]
    
    func pieceAt(col: Int, row: Int) -> Piece? {
        for piece in piecesBox {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        return nil
    }
    
    enum Player {
        case red
        case yellow
        
        var isRed: Bool {
            self == .red
        }
    }
    
    struct Piece: Hashable {
        var col: Int
        var row: Int
        var player: Player
    }
}
