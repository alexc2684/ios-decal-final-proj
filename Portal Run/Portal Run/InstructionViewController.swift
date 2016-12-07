//
//  InstructionViewController.swift
//  Portal Run
//
//  Created by Phat Pham on 11/11/16.
//  Copyright © 2016 Portal Run Team. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class InstructionViewController: UIViewController {
    var instructionTitle: UILabel! //instructions
    var instructions : UILabel!
    var teleport1 : UILabel!
    var teleport2 : UILabel!
    var backButton : UIButton!
    var hero:Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)//TODO: Needs to be replaced
        instructionTitle = UILabel(frame: CGRect(x: self.view.bounds.size.width/2.8, y: 0, width: self.view.bounds.size.width*3/4, height: 30))
        instructionTitle.text = "Game Instructions"
        instructionTitle.font = UIFont(name: "Arial-BoldItalicMT", size: 20)
        instructionTitle.textColor = UIColor.white
        instructionTitle.backgroundColor = UIColor(red: 0, green: 165/255, blue: 0, alpha: 1)
        instructionTitle.sizeToFit()
        instructionTitle.layer.masksToBounds = true
        instructionTitle.layer.cornerRadius = 5
        self.view.addSubview(instructionTitle)
        /*
        let xCenterConstraintForGameTitle = NSLayoutConstraint(item: instructionTitle, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 10)
        let topMarginForGameTitle = NSLayoutConstraint(item: instructionTitle, attribute: .topMargin, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 2, constant: 20)
        self.view.addConstraints([xCenterConstraintForGameTitle, topMarginForGameTitle])
        */
        makeBackButton()
        
        // Do any additional setup after loading the view.
        /*
         let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
         horizontalMotionEffect.minimumRelativeValue = -50
         horizontalMotionEffect.maximumRelativeValue = 50
         
         let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
         verticalMotionEffect.minimumRelativeValue = -50
         verticalMotionEffect.maximumRelativeValue = 50
         
         let motionEffectGroup = UIMotionEffectGroup()
         motionEffectGroup.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
         self.view.addMotionEffect(motionEffectGroup)
         */
        makeInstructions()
        //instructions.translatesAutoresizingMaskIntoConstraints = false
        /*
        let xCenterConstraintForGameTitle2 = NSLayoutConstraint(item: instructions, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let topMarginForGameTitle2 = NSLayoutConstraint(item: instructions, attribute: .topMargin, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 2, constant: 20)
        self.view.addConstraints([xCenterConstraintForGameTitle2, topMarginForGameTitle2])
        */
        let imageName = "icon-images/hero.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 150, y: 30, width: 30, height: 40)
        //imageView.addConstraints(

        view.addSubview(imageView)
        self.navigationController?.isNavigationBarHidden = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        //playVideo()
    }
    func makeInstructions() {
        instructions = UILabel(frame: CGRect(x: 10, y: 40, width: self.view.bounds.size.width*3/4, height: 30))
        instructions.text = "Your favorite ninja"
        instructions.font = UIFont(name: "Arial-BoldMT", size: 14)
        instructions.textColor = UIColor.white
        //instructions.backgroundColor = UIColor(red: 0, green: 165/255, blue: 0, alpha: 1)
        instructions.sizeToFit()
        instructions.layer.masksToBounds = true
        instructions.layer.cornerRadius = 5
        self.view.addSubview(instructions)
        
        let obstaclesText = UILabel(frame: CGRect(x: 10, y: 90, width: self.view.bounds.size.width*3/4, height: 30))
        obstaclesText.text = "Types of Obstacles"
        obstaclesText.font = UIFont(name: "Arial-BoldMT", size: 14)
        obstaclesText.textColor = UIColor.white
        //instructions.backgroundColor = UIColor(red: 0, green: 165/255, blue: 0, alpha: 1)
        obstaclesText.sizeToFit()
        obstaclesText.layer.masksToBounds = true
        obstaclesText.layer.cornerRadius = 5
        self.view.addSubview(obstaclesText)
        
        let objective = UILabel(frame: CGRect(x: 10, y: 150, width: self.view.bounds.size.width*3/4, height: 30))
        objective.text = "Objective: To avoid obstacles using teleports and survive!"
        objective.font = UIFont(name: "Arial-BoldMT", size: 14)
        objective.textColor = UIColor.white
        //instructions.backgroundColor = UIColor(red: 0, green: 165/255, blue: 0, alpha: 1)
        objective.sizeToFit()
        objective.layer.masksToBounds = true
        objective.layer.cornerRadius = 5
        self.view.addSubview(objective)
        
        let obstacles = ["icon-images/bush.png", "icon-images/tree.png","icon-images/turret.png"]
        var n = 150
        for o in obstacles {
            let image = UIImage(named: o)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: n, y: 80, width: 30, height: 40)
            view.addSubview(imageView)
            n = n + 40
        }
        
        teleport1 = UILabel(frame: CGRect(x: 10, y: 200, width: self.view.bounds.size.width*3/4, height: 30))
        teleport1.text = "Click once to create a starting portal!"
        teleport1.font = UIFont(name: "Arial-BoldItalicMT", size: 20)
        teleport1.textColor = UIColor.white
        //teleport.backgroundColor = UIColor(red: 0, green: 165/255, blue: 0, alpha: 1)
        teleport1.sizeToFit()
        teleport1.layer.masksToBounds = true
        teleport1.layer.cornerRadius = 5
        self.view.addSubview(teleport1)
        
        var image = UIImage(named: "icon-images/hero.png")
        var imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: self.view.bounds.size.width * 3/5 - 25, y: 200, width: 30, height: 40)
        view.addSubview(imageView)
        
        image = UIImage(named: "icon-images/portal.png")
        imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: self.view.bounds.size.width * 3/5, y: 200, width: 30, height: 40)
        view.addSubview(imageView)
        
        teleport2 = UILabel(frame: CGRect(x: 10, y: 250, width: self.view.bounds.size.width*3/4, height: 30))
        teleport2.text = "Click once more to create a destination portal!"
        teleport2.font = UIFont(name: "Arial-BoldItalicMT", size: 20)
        teleport2.textColor = UIColor.white
        //teleport.backgroundColor = UIColor(red: 0, green: 165/255, blue: 0, alpha: 1)
        teleport2.sizeToFit()
        teleport2.layer.masksToBounds = true
        teleport2.layer.cornerRadius = 5
        self.view.addSubview(teleport2)
        
        image = UIImage(named: "icon-images/hero.png")
        imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: self.view.bounds.size.width * 5/7, y: 250, width: 30, height: 40)
        view.addSubview(imageView)
        
        image = UIImage(named: "icon-images/portal.png")
        imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: self.view.bounds.size.width * 5/7 - 25, y: 250, width: 30, height: 40)
        view.addSubview(imageView)
        
        makeVideoButton()
        
    }
    func makeBackButton() {
        backButton = UIButton()
        backButton.backgroundColor = UIColor.blue
        backButton.setTitle("back", for: .normal)
        backButton.titleLabel?.font = UIFont(name: "Menlo-Regular", size: (backButton.titleLabel?.font.pointSize)!)
        backButton.addTarget(self, action: #selector(showStartView), for: .touchUpInside)
        backButton.sizeToFit()
        backButton.layer.cornerRadius = 1
        self.view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
    }
    func makeVideoButton() {
        var videoButton = UIButton(frame: CGRect(x: self.view.bounds.size.width * 1/2, y: 300, width: 30, height: 40))
        videoButton.backgroundColor = UIColor.gray
        videoButton.setTitle("Demo", for: .normal)
        videoButton.titleLabel?.font = UIFont(name: "Menlo-Regular", size: (videoButton.titleLabel?.font.pointSize)!)
        videoButton.addTarget(self, action: #selector(playVideo), for: .touchUpInside)
        videoButton.sizeToFit()
        videoButton.layer.cornerRadius = 1
        self.view.addSubview(videoButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
    }
    func showStartView() {
        let startVC = StartScreenViewController()
        self.navigationController?.pushViewController(startVC, animated: true)
        //self.present(startVC, animated: true, completion: nil)
    }
    @objc private func playVideo() {
        guard let path = Bundle.main.path(forResource: "video", ofType:"mov") else {
            debugPrint("video.mov not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        player.isMuted = true
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
