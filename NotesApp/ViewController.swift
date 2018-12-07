//
//  ViewController.swift
//  NotesApp
//
//  Created by Noirdemort on 05/11/18.
//  Copyright © 2018 Noirdemort. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var noteDesc: UITextView!
    @IBOutlet weak var noteTitle: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveNote(_ sender: Any) {
        let note = NotesDB(context: context)
        note.title = noteTitle.text
        note.detail = noteDesc.text
        note.saved_at = NSDate() as Date
        addData.saveContext()
        noteTitle.text = ""
        noteDesc.text = ""
    }
    
}

