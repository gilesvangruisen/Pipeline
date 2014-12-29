//
//  Pipeline.swift
//  Pipeline
//
//  Created by Giles Van Gruisen on 12/29/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

infix operator --> { associativity left }

public func --><In, Out>(left: In?, fn: (In) -> (Out?)) -> Out? {

    if let arg = left {
        return fn(arg)
    } else {
        return nil
    }

}

infix operator <-- { associativity right }

public func <--<In, Out>(fn: (In) -> (Out?), right: In?) -> Out? {

    if let arg = right {
        return fn(arg)
    } else {
        return nil
    }
    
}