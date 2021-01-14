import Foundation

public enum GenderTypes: Int64, CaseIterable {
    case Man = 0
    case Women = 1
    case Other = 2
    
    public var name: String {
        // 💋💄👠👞🎩🚹🚺⚧⚧♀︎♁♂︎⚧♔♕⚧
        switch self {
        case .Man:
            return "♂"
        case .Women:
            return "♀"
        case .Other:
            return "🏳️‍⚧️"
        }
    }
    
//    var imageName: String {
//        switch self {
//        case .Man:
//            return "mustache"
//        case .Women:
//            return "mouth"
//        case .Other:
//            return ""
//        }
//    }
}
