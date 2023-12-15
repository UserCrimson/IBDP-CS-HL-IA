import Foundation
import RealmSwift

final class Group: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var _id:ObjectId
    
    @Persisted var Items = RealmSwift.List<Item>()
    
}

