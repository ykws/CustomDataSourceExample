//
//  AppState.swift
//  CustomDataSourceExample
//
//  Created by KAWASHIMA Yoshiyuki on 2021/05/18.
//

import ReSwift

struct AppState {
    var counter: Int = 0
    var increasable: Bool { counter < 9 }
    var decreasable: Bool { counter > 0 }
}

struct CounterActionInitialize: Action { }
struct CounterActionIncrease: Action { }
struct CounterActionDecrease: Action { }

func counterReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    
    switch action {
    case _ as CounterActionInitialize:
        state.counter = 0
    case _ as CounterActionIncrease:
        state.counter += 1
    case _ as CounterActionDecrease:
        state.counter -= 1
    default: break
    }

    return state
}
