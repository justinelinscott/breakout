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
    
    
    let paddle = SKSpriteNode(imageNamed: "paddle1")
    let ball = SKShapeNode(circleOfRadius: 20 ) // Size of Ball
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
//        ball.position = CGPoint(x: size.width * 0.5, y: size.height * 0.2)
//        addChild(ball)
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
        
        //makes ball
        
        ball.position = CGPoint(x: size.width * 0.5, y: size.height * 0.2)
        ball.strokeColor = SKColor.orange
        ball.glowWidth = 1.0
        ball.fillColor = SKColor.cyan
        self.addChild(ball)
        //Ball Physics
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularDamping = 0
        ball.physicsBody?.friction = 0
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let initForce = CGVector(dx: 20.0, dy: 40.0)
        ball.physicsBody?.applyImpulse(initForce)
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //setup paddle
        
        
        //setup ball
        
  //      let touchLocation = touch.location(in: self)
        
    }
    
}
