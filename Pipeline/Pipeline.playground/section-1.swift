
import Foundation
import UIKit

infix operator --> { associativity left }

func --><In, Out>(left: In?, fn: (In) -> (Out?)) -> Out? {

    if let arg = left {
        return fn(arg)
    } else {
        return nil
    }

}

infix operator <-- { associativity right }

func <--<In, Out>(fn: (In) -> (Out?), right: In?) -> Out? {

    if let arg = right {
        return fn(arg)
    } else {
        return nil
    }

}


let imgURL = "http://upload.wikimedia.org/wikipedia/commons/c/c0/Harvard_square_2009j.JPG"

    imgURL --> { NSURL(string: $0) }
    --> { NSData(contentsOfURL: $0) }
    --> { UIImage(data: $0) }
    --> { UIImageView(image: $0) } {


func add(x: Int) -> Int -> Int {
    return { y in
        return x + y
    }
}

add(3)(7)