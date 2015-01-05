//
//  Pipeline.swift
//  Pipeline
//
//  Created by Giles Van Gruisen on 12/29/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

infix operator --> { associativity left }

/** Returns the result of the function on the right, called
    with the value on the left */
public func --><In, Out>(left: In, fn: In -> Out) -> Out {
    return fn(left)
}


/** Returns a curried function that accepts A and returns C,
based on a function that accepts A and returns B and another
function that accepts B and returns C */
public func --><A, B, C>(ab: A -> B, bc: B -> C) -> (A -> C) {
    return { a in
        return bc(ab(a))
    }
}


infix operator -?> { associativity left }

/** Returns the result of the function on the right, called
    with the unwrapped value on the left if that optional is not nil */
public func -?><In, Out>(left: In?, fn: (In) -> (Out?)) -> Out? {

    if let arg = left {
        return fn(arg)
    } else {
        return nil
    }
    
}
