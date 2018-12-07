//
//  TVCNotes.swift
//  NotesApp
//
//  Created by Noirdemort on 05/11/18.
//  Copyright © 2018 Noirdemort. All rights reserved.
//

import UIKit

class TVCNotes: UITableViewCell {

    @IBOutlet weak var laTitle: UILabel!
    
    @IBOutlet weak var laDesc: UITextView!
    
    @IBOutlet weak var laDate: UILabel!
    
    @IBOutlet weak var delNote: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func setNotes(note: NotesDB){
        laTitle.text = note.title
        laDesc.text = note.detail
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yy h:mm a"
        
        let now = dateFormat.string(from: note.saved_at as! Date)
        laDate.text = now
    }

}
