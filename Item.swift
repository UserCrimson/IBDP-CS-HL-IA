import Foundation
import RealmSwift

final class Item: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var _id:ObjectId
    @Persisted var name = "\(randomAdjectives.randomElement()!) \(randomNouns.randomElement()!)"
    @Persisted var isFavorite = false
    
    @Persisted(originProperty: "Items") var Group: LinkingObjects<Group>
}
    // Temp
    let randomAdjectives = [
        "fluffy", "classy", "bumpy", "bizarre", "wiggly", "quick", "sudden",
        "acoustic", "smiling", "dispensable", "foreign", "shaky", "purple", "keen",
        "aberrant", "disastrous", "vague", "squealing", "ad hoc", "sweet"
    ]
    // Temp
    let randomNouns = [
        "floor", "monitor", "hair tie", "puddle", "hair brush", "bread",
        "cinder block", "glass", "ring", "twister", "coasters", "fridge",
        "toe ring", "bracelet", "cabinet", "nail file", "plate", "lace",
        "cork", "mouse pad"
    ]

