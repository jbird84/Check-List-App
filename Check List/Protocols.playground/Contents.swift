import Cocoa

protocol Persist {
    
    func save()
    
}


class Monster: Persist {
    func save() {
        print("Monster Save")
    }
}


class Sword: Persist {
    func save() {
        print("Sword save")
    }
}

class Player {
    
}



let monster = Monster()
let sword = Monster()
let player = Player()

let items: [Persist] = [monster, sword]


class GameManager {
    
    func saveLevel (_ item: [Persist]) {
        for item in items {
            item.save()
        }
    }
}

let gameManager = GameManager()
gameManager.saveLevel(items)
