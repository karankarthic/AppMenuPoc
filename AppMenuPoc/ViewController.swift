//
//  ViewController.swift
//  AppMenuPoc
//
//  Created by Karan Karthic Neelamegan on 09/12/22.
//

import UIKit

class ViewController: UIViewController, UIContextMenuInteractionDelegate  {

    
    let button = UIButton()
    
    let button2 = UIButton()
    
    let button3 = UIButton()
    
    let favorite = UIAction(title: "Favorite",
      image: UIImage(systemName: "heart.fill")) { _ in
      // Perform action
    }
    
    let favorite1 = UIAction(title: "Test1",
      image: UIImage(systemName: "square.and.arrow.up.fill")) { _ in
      // Perform action
    }
    
    let favorite2 = UIAction(title: "Test2",
      image: UIImage(systemName: "trash.fill")) { _ in
      // Perform action
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        button.setTitle("pop", for: .normal)
        button.setTitleColor( .blue, for: .normal)
        
        button2.setTitle("context", for: .normal)
        button2.setTitleColor( .blue, for: .normal)
        
        button3.setTitle("menuBtn", for: .normal)
        button3.setTitleColor( .blue, for: .normal)
        
//        / this presents only on long press and makes background blur and this is from ios 13
        let interaction = UIContextMenuInteraction(delegate: self)
        button2.addInteraction(interaction)
        
        
//        / this supports only in ios 14 and above
        button3.showsMenuAsPrimaryAction = true
        button3.menu = UIMenu(title: "", children: [favorite,favorite1,favorite2])

        
        
        
        self.navigationItem.title = "Test"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action: nil)
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(button)
        self.view.addSubview(button2)
        self.view.addSubview(button3)

        button.addTarget(self, action: #selector(presentPop(sender:)), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor,constant: -100),
                                     
                                     button2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                                                  button2.centerYAnchor.constraint(equalTo: self.view.centerYAnchor,constant: -150),
                                     
                                     button3.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                                                  button3.centerYAnchor.constraint(equalTo: self.view.centerYAnchor,constant: -200)
                                    ])
        
        
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction,
                                configurationForMenuAtLocation location: CGPoint)
    -> UIContextMenuConfiguration? {

        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: nil) { _ in
            UIMenu(title: "", children: [self.favorite, self.favorite1, self.favorite2])
        }
    }
    
    @objc func presentPop(sender: UIButton){
        let popoverVC = PopoverViewController()
                popoverVC.modalPresentationStyle = .popover
                popoverVC.popoverPresentationController?.sourceView = sender
                popoverVC.popoverPresentationController?.permittedArrowDirections = .up
                popoverVC.popoverPresentationController?.delegate = popoverVC
                self.present(popoverVC, animated: true, completion: nil)
    }
    
}

