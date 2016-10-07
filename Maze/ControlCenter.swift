//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(_ myRobot: ComplexRobotObject) {
      
        //Call the function, isFacingWall(), and define a constant to be equal to its return value.
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        
        // Save the return value of checkWalls() to a constant called myWallInfo.
        let myWallInfo = checkWalls(myRobot)
        print(myWallInfo)
        
        
        // Categorize the robot's current location based on the number of walls
        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        let isTwoWayPath = (myWallInfo.numberOfWalls == 2)
        let isDeadEnd = (myWallInfo.numberOfWalls == 3)
        
        // Test whether the values of the above constants are correct
        print(isThreeWayJunction, isTwoWayPath, isDeadEnd)
        
        
        // Three-way Path - else-if statements
        
        //If the robot encounters a three way junction and there IS a wall ahead, it should randomly rotate right or left.
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        }
        
        //If the robot encounters a three way junction and there is NO wall ahead, it should continue straight or rotate.
        if (isThreeWayJunction && !robotIsBlocked) {
            continueStraightOrRotate(myRobot)
        }
        
        
        // Two-way Path - else-if statements
        
        //If the robot encounters a two way path and there is NO wall ahead it should continue forward.
        if isTwoWayPath && !robotIsBlocked {
            myRobot.move()
        }
        
        //If the robot encounters a two way path and there IS a wall ahead, it should randomly rotate.
        if (isTwoWayPath && robotIsBlocked){
            randomlyRotateRightOrLeft(myRobot)
        }
        
        
        // Dead end - else-if statements
        
        //If the robot encounters a dead end and there is NO wall ahead it should move forward.
        //If the robot encounters a dead end and there IS a wall ahead it should rotateRight().
        if isDeadEnd {
            if !robotIsBlocked {
                myRobot.move()
            }
            if robotIsBlocked {
                myRobot.rotateRight()
            }
        }


        // Step 3.2
        // Two-way Path - else-if statements
        
        // TODO: If the robot encounters a two way path and there is NO wall ahead it should continue forward.
        
        // TODO: If the robot encounters a two way path and there IS a wall ahead, it should turn in the direction of the clear path.
        
    }
    
    func previousMoveIsFinished(_ robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
    
}
