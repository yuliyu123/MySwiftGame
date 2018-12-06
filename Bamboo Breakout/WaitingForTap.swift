//
//  WaitingForTap.swift
//  BreakoutSpriteKitTutorial
//
//  Created by Michael Briscoe on 1/16/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import SpriteKit
import GameplayKit


// waiting for tap state
class WaitingForTap: GKState {
  unowned let scene: GameScene
  
  init(scene: SKScene) {
    self.scene = scene as! GameScene
    super.init()
  }
  
    override func didEnter(from previousState: GKState?) {
        // let ball scale to 1
        let scale = SKAction.scale(to: 1.0, duration: 0.25)
        scene.childNode(withName: GameMessageName)!.run(scale)
    }
    
    override func willExit(to nextState: GKState) {
        if nextState is Playing {
            //let ball scale to 0
            let scale = SKAction.scale(to: 0, duration: 0.4)
            scene.childNode(withName: GameMessageName)!.run(scale)
        }
    }

  
  override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    return stateClass is Playing.Type
  }

}
