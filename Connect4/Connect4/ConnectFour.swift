//
//  ConnectFour.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-26.
//

import Foundation

struct ConnectFour {
    private var piecesBox: Set<Piece> = []
    
    private var whoseTurn: Player = .red
    
    func pieceAt(col: Int, row: Int) -> Piece? {
        for piece in piecesBox {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        return nil
    }
    
    mutating func drop(at col: Int) {
        piecesBox.insert(Piece(col: col, row: 0, player: whoseTurn))
        
        whoseTurn = whoseTurn == .red ? .yellow : .red
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
