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