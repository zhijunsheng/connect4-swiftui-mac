//
//  ConnectFourViewModel.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-26.
//

import SwiftUI
import AVFoundation
import MultipeerConnectivity

class ConnectFourViewModel: NSObject, ObservableObject {
    @Published private var connectFour: ConnectFour = ConnectFour()
    
    private var droppingAudioPlayer: AVPlayer?
    
    private let conn4ServiceType = "gt-conn4"
    private var peerID: MCPeerID
    private var session: MCSession
    private var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser?
    
    override init() {
        peerID = MCPeerID(displayName: Host.current().name ?? "My mac")
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        super.init()
        session.delegate = self
    }
    
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
    
    func advertise() {
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: conn4ServiceType)
        nearbyServiceAdvertiser?.delegate = self
        nearbyServiceAdvertiser?.startAdvertisingPeer()
    }
    
    func invite() {
        let browser = MCBrowserViewController(serviceType: conn4ServiceType, session: session)
        browser.delegate = self
        NSApplication.shared.keyWindow?.contentViewController?.presentAsSheet(browser)
    }
}

extension ConnectFourViewModel: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
}

extension ConnectFourViewModel: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
    }
}

extension ConnectFourViewModel: MCBrowserViewControllerDelegate {
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        NSApplication.shared.keyWindow?.contentViewController?.dismiss(browserViewController)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        NSApplication.shared.keyWindow?.contentViewController?.dismiss(browserViewController)
    }
}
