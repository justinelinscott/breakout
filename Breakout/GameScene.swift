//
//  GameScene.swift
//  Breakout
//
//  Created by Justine Linscott on 5/30/19.
//  Copyright © 2019 Justine Linscott. All rights reserved.
//

import SpriteKit
import GameplayKit

struct PhysicsCategory {
    static let None: UInt32 = 0
    static let All: UInt32 = UInt32.max
    static let Paddle: UInt32 = 0b1
    static let Ball: UInt32 = 0b10
    static let Brick: UInt32 = 0b11
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var ball = SKSpriteNode(imageNamed: "ball1")
    let paddle = SKSpriteNode(imageNamed: "paddle1")
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        ball.position = CGPoint(x: size.width * 0.5, y: size.height * 0.2)
        addChild(ball)
        paddle.position = CGPoint(x: size.width * 0.5, y: size.height * 0.1)
        addChild(paddle)
        
        //physics
        physicsWorld.gravity = CGVector.zero
        physicsWorld.contactDelegate = self
        
        //caging body
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0
        self.physicsBody = borderBody
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        ball.physicsBody?.applyImpulse(CGVector(dx: 2.0, dy: -2.0))
        ball.physicsBody?.isDynamic = true
        
//        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
//        let actionMove = SKAction.move(to: CGPoint(x: -enemy.size.width / 2, y: actualY), duration: TimeInterval(actualDuration))
//        let actionMoveDone = SKAction.removeFromParent()
//        enemy.run(SKAction.sequence([actionMove, actionMoveDone]))
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //setup paddle
        
        
        //setup ball
        
  //      let touchLocation = touch.location(in: self)
        
    }
    
}
