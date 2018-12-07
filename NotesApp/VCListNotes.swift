//
//  VCListNotes.swift
//  NotesApp
//
//  Created by Noirdemort on 05/11/18.
//  Copyright © 2018 Noirdemort. All rights reserved.
//

import UIKit
import CoreData

class VCListNotes: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var TVNotesList: UITableView!
    var listNotes = [NotesDB]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNotes()
        TVNotesList.delegate = self
        TVNotesList.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCNotes = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! TVCNotes
        cell.setNotes(note: listNotes[indexPath.row])
        cell.delNote.tag = indexPath.row
        cell.delNote.addTarget(self, action: #selector(deletePressed(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func deletePressed(_ sender: UIButton){
        context.delete(listNotes[sender.tag])
        loadNotes()
    }
    
    func loadNotes(){
        let fetchRequest:NSFetchRequest<NotesDB> = NotesDB.fetchRequest()
        do {
        listNotes = try context.fetch(fetchRequest)
            TVNotesList.reloadData()
        }catch{
            print("Not able to access database!")
            print(error)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
