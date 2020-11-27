//
//  ConnectFourViewModel.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-26.
//

import Foundation
import AVFoundation

class ConnectFourViewModel: ObservableObject {
    @Published private var connectFour: ConnectFour = ConnectFour()
    
    private var droppingAudioPlayer: AVPlayer?
    
    func pieceAt(col: Int, row: Int) -> ConnectFour.Piece? {
        connectFour.pieceAt(col: col, row: row)
    }
    
    func drop(at col: Int) {
        connectFour.drop(at: col)
        
        droppingAudioPlayer = AVPlayer(url: URL(fileReferenceLiteralResourceName: "drop.wav"))
        droppingAudioPlayer?.play()
    }
    
    func reset() {
        connectFour.reset()
    }
}
