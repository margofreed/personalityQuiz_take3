//
//  QuestionData.swift
//  personalityQuiz_take2
//
//  Created by Freed, Margo on 7/17/20.
//  Copyright © 2020 margofreed. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: CharacterType
}

enum CharacterType: Character {
    case thunder = "🐬", steel = "🐉", regina = "🐑", kawasemi = "🦜"
    
    var definition: String {
    switch self {
    case .thunder:
        return "You are Thunder Dolphin! You're a risk-taker who can handle change with ease. You care deeply for your friends and are very empathetic. However, you need to take care of yourself. Know your worth and your friends will get you through any obstacle life throws your way."
    case .steel:
        return "You are Steel Dragon! Strong, outgoing, and a desire to succeed! You often get too focused on the details instead of seeing the bigger picure of a problem. However, you may be rather selfish from past experiences so take a step back before jumping to conclusions. Learn to listen to your friends' points of view."
    case .regina:
        return "You are Regina! Smart, beautiful, and wanderlust! Your intelligence, intuition, and observation make you the most informative of the group, However, you often get distracted or unaware of your surroundings. Try to focus on what's around you, especially at critical points."
    case .kawasemi:
        return "You are Kawasemi! You are kind-hearted, organized, and orderly, but still rather shy. You strive for balance and stability. However, you tend to let your emotions take over and have a hard time confiding. Don't be afraid to ask for help, you're never alone."
    }
    }
}
