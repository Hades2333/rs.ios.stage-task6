//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var trump: Suit!

        for player in players {
            if nil != player.hand {
                for card in player.hand! {
                    if card.isTrump {
                        trump = card.suit
                        break
                    }
                }
            }
        }
        if nil == trump {
            return nil
        }

        for value in Value.allCases {
            for player in players {
                if nil != player.hand {
                    for card in player.hand! {
                        if card.suit == trump && card.value == value {
                            return player
                        }
                    }
                }
            }
        }

        return nil
    }
}
