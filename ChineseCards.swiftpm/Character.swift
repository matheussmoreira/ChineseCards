//
//  Character.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 18/04/22.
//

import Foundation
import Combine

// MARK: - Character Classes
class Character: Equatable {
    var chineseWord: String
    var pinyinWord: String
    var relatedMeanings = [String]()
    
    init(chineseWord: String, pinyinWord: String, relatedMeanings: [String] = []) {
        self.chineseWord = chineseWord
        self.pinyinWord = pinyinWord
        self.relatedMeanings = relatedMeanings
    }
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return (lhs.chineseWord == rhs.chineseWord) && (lhs.pinyinWord == rhs.pinyinWord)
    }
}

class LessonOneCharacter: Character {
    var strokes: [ChineseStroke]
    var parts: [String]
    
    init(chineseWord: String, pinyinWord: String, relatedMeanings: [String] = [], strokes: [ChineseStroke], parts: [String]) {
        self.strokes = strokes
        self.parts = parts
        super.init(chineseWord: chineseWord, pinyinWord: pinyinWord, relatedMeanings: relatedMeanings)
    }
}

class LessonTwoCharacter: Character {
    var parts = [String]() // Image names
    
    init(chineseWord: String, pinyinWord: String, relatedMeanings: [String] = [], parts: [String]) {
        self.parts = parts
        super.init(chineseWord: chineseWord, pinyinWord: pinyinWord, relatedMeanings: relatedMeanings)
    }
}

class LessonThreeCharacter: Character {
    var drawings: [String] // Image names
    var description: String
    
    init(chineseWord: String, pinyinWord: String, relatedMeanings: [String] = [], drawings: [String], description: String) {
        self.drawings = drawings
        self.description = description
        super.init(chineseWord: chineseWord, pinyinWord: pinyinWord, relatedMeanings: relatedMeanings)
    }
}

// MARK: - Lesson One Characters
class Characters {
    // LESSON ONE
    static let shou = LessonOneCharacter(chineseWord: "手",
                                         pinyinWord: "Shǒu",
                                         relatedMeanings: ["手: hand"],
                                         strokes: [.heng, .shugou],
                                         parts: ["Shǒu heng black", "Shǒu heng gray", "Shǒu shugou black", "Shǒu shugou gray"])
    
    static let bu = LessonOneCharacter(chineseWord: "不",
                                       pinyinWord: "Bù",
                                       relatedMeanings: ["不: not, not"],
                                       strokes: [.heng, .shu, .pie, .dian],
                                       parts: ["bu part 1", "bu part 2", "bu part 3", "bu part 4"])
    
    static let bai = LessonOneCharacter(chineseWord: "白",
                                        pinyinWord: "Bái",
                                        relatedMeanings: ["白色的: white"],
                                        strokes: [.heng, .shu],
                                        parts: ["bai part 1", "bai part 2", "bai part 3", "bai part 4", "bai part 5", "bai part 6", "bai part 7"])
    
    static let ye = LessonOneCharacter(chineseWord: "也",
                                       pinyinWord: "Yě",
                                       relatedMeanings: ["也: also, too"],
                                       strokes: [.shu, .wogou, .hengzhegou],
                                       parts: ["ye part 1", "ye part 2", "ye part 3"])
    
    static let zhi = LessonOneCharacter(chineseWord: "只",
                                        pinyinWord: "Zhǐ",
                                        relatedMeanings: ["只有: only"],
                                        strokes: [.heng, .shu, .pie, .dian],
                                        parts: ["zhi part 1", "zhi part 2", "zhi part 3", "zhi part 4", "zhi part 5", "zhi part 6"])
    
    static let ofLessonOne: [LessonOneCharacter] = [shou, bu, bai, ye, zhi]
}

// MARK: - Lesson Two Characters
extension Characters {
    // 1. Single Component
    static let mu = LessonTwoCharacter(chineseWord: "目",
                                       pinyinWord: "Mù",
                                       relatedMeanings: ["目: eye", "目标: target"],
                                       parts: ["Ma single"])
    
    static let ren = LessonTwoCharacter(chineseWord: "人",
                                        pinyinWord: "Rén",
                                        relatedMeanings: ["人: person", "人们: people"],
                                        parts: ["Ren single"])
    
    static let tu = LessonTwoCharacter(chineseWord: "土",
                                       pinyinWord: "Tǔ",
                                       relatedMeanings: ["土壤: soil"],
                                       parts: ["Tu single"])
    
    static let ma = LessonTwoCharacter(chineseWord: "马",
                                       pinyinWord: "Mǎ",
                                       relatedMeanings: ["马: horse", "Used in the end of a sentence to form a question, when we want to confirm information, where the expected answer is yes or no"],
                                       parts: ["Ma single"])
    
    static let shou2 = LessonTwoCharacter(chineseWord: "手",
                                          pinyinWord: "Shǒu",
                                          relatedMeanings: ["手: hand"],
                                          parts: ["Shou single"])
    
    static let singleComponent = [[mu], [ren], [tu], [ma], [shou2]]
    
    // 2. Above Below
    static let cha  = LessonTwoCharacter(chineseWord: "茶",
                                         pinyinWord: "Chá",
                                         relatedMeanings: ["茶: tea"],
                                         parts: ["AB radical 1", "Cha body"])
    
    static let yi  = LessonTwoCharacter(chineseWord: "艺",
                                        pinyinWord: "Yì",
                                        relatedMeanings: ["艺术: art"],
                                        parts: ["AB radical 1", "Yi body"])
    
    static let ba  = LessonTwoCharacter(chineseWord: "爸",
                                        pinyinWord: "Bà",
                                        relatedMeanings: ["爸爸: dad"],
                                        parts: ["AB radical 2", "Ba body"])
    
    static let ye2  = LessonTwoCharacter(chineseWord: "爷",
                                         pinyinWord: "Yé",
                                         relatedMeanings: ["爷爷: grandpa"],
                                         parts: ["AB radical 2" , "Ye body"])
    
    static let zi  = LessonTwoCharacter(chineseWord: "字",
                                        pinyinWord: "Zì",
                                        relatedMeanings: ["名字： first name"],
                                        parts: ["AB radical 3", "Zi body"])
    
    static let xue  = LessonTwoCharacter(chineseWord: "穴",
                                         pinyinWord: "Xué",
                                         relatedMeanings: ["孔穴 hole, cavity"],
                                         parts: ["AB radical 3", "Xue body"])
    
    static let aboveBelow = [[cha, yi], [ba, ye2], [zi, xue]]
    
    // 3. Left Right
    static let shen = LessonTwoCharacter(chineseWord: "什",
                                         pinyinWord: "Shén",
                                         relatedMeanings: ["什么: what"],
                                         parts: ["LR radical 1", "Shen body"])
    
    static let ni = LessonTwoCharacter(chineseWord: "你",
                                       pinyinWord: "Nǐ",
                                       relatedMeanings: ["你: you", "你们: you (plural form)"],
                                       parts: ["LR radical 1", "Ni body"])
    
    static let ma2 = LessonTwoCharacter(chineseWord: "妈",
                                        pinyinWord: "Mā",
                                        relatedMeanings: ["妈妈: mother"],
                                        parts: ["LR radical 2", "Ma body"])
    
    static let hao = LessonTwoCharacter(chineseWord: "好",
                                        pinyinWord: "Hǎo",
                                        relatedMeanings: ["好: good", "word+好: compliment", "你好: hello"],
                                        parts: ["LR radical 2", "Hao body"])
    
    static let chi = LessonTwoCharacter(chineseWord: "吃",
                                        pinyinWord: "Chī",
                                        relatedMeanings: ["吃: to eat"],
                                        parts: ["LR radical 3", "Chi body"])
    
    static let he = LessonTwoCharacter(chineseWord: "喝",
                                       pinyinWord: "He",
                                       relatedMeanings: ["喝: to drink"],
                                       parts: ["LR radical 3", "He body"])
    
    static let leftRight = [[shen, ni], [ma2, hao], [chi, he]]
    
    // 4. Above Middle Below
    static let ai = LessonTwoCharacter(chineseWord: "哀",
                                       pinyinWord: "Āi",
                                       relatedMeanings: ["悲哀: sorrow"],
                                       parts: ["Ai above", "Ai middle", "Ai below"])
    
    static let shi = LessonTwoCharacter(chineseWord: "是",
                                        pinyinWord: "Shì",
                                        relatedMeanings: ["是: to be", "是: yes (as a confirmation of a previous sentence)"],
                                        parts: ["Shi above", "Shi middle", "Shi below"])
    
    static let aboveMiddleBelow = [[ai], [shi]]
    
    // 5. Left Middle Right
    static let gou = LessonTwoCharacter(chineseWord: "构",
                                        pinyinWord: "Gòu",
                                        relatedMeanings: ["结构体: structure"],
                                        parts: ["LMR radical 1", "Gou middle", "Gou right"])
    
    static let shu = LessonTwoCharacter(chineseWord: "树",
                                        pinyinWord: "Shù",
                                        relatedMeanings: ["树: tree"],
                                        parts: ["LMR radical 1", "Shu middle", "Shu right"])
    
    static let ka = LessonTwoCharacter(chineseWord: "咖",
                                       pinyinWord: "Kā",
                                       relatedMeanings: ["咖啡: coffee"],
                                       parts: ["LMR radical 2", "Ka middle", "Ka right"])
    
    static let na = LessonTwoCharacter(chineseWord: "哪",
                                       pinyinWord: "Nǎ",
                                       relatedMeanings: ["在哪里: where"],
                                       parts: ["LMR radical 2", "Na middle", "Na right"])
    
    static let leftMiddleRight = [[gou, shu], [ka, na]]
    
    // 6. Surround Upper Left
    static let fang = LessonTwoCharacter(chineseWord: "房",
                                         pinyinWord: "Fáng",
                                         relatedMeanings: ["房间: room"],
                                         parts: ["Fang radical", "Fang body"])
    
    static let miao = LessonTwoCharacter(chineseWord: "庙",
                                         pinyinWord: "Miào",
                                         relatedMeanings: ["寺庙: temple"],
                                         parts: ["Miao radical", "Miao body"])
    
    static let bing = LessonTwoCharacter(chineseWord: "病",
                                         pinyinWord: "Bìng",
                                         relatedMeanings: ["疾病: disease" , "生病的: sick"],
                                         parts: ["Bing radical", "Bing body"])
    
    static let surroundUpperLeft = [[fang], [miao], [bing]]
    
    // 7. Surround Upper Right
    static let ju = LessonTwoCharacter(chineseWord: "句",
                                       pinyinWord: "Jù",
                                       relatedMeanings: ["句子: sentence"],
                                       parts: ["Ju radical", "Ju body"])
    
    static let ke = LessonTwoCharacter(chineseWord: "可",
                                       pinyinWord: "Kê",
                                       relatedMeanings: ["可以: can", "可能的: possible"],
                                       parts: ["Ke radical", "Ke body"])
    
    static let shi2 = LessonTwoCharacter(chineseWord: "式",
                                         pinyinWord: "Shì",
                                         relatedMeanings: ["公式: formula", "方式: way"],
                                         parts: ["Shi radical", "Shi body"])
    
    static let surroundUpperRight = [[ju], [ke], [shi2]]
    
    // 8. Surround Lower Left
    static let hai = LessonTwoCharacter(chineseWord: "还",
                                        pinyinWord: "Hái",
                                        relatedMeanings: ["还: also"],
                                        parts: ["SLL radical", "Hai body"])
    
    static let zhe = LessonTwoCharacter(chineseWord: "这",
                                        pinyinWord: "Zhè",
                                        relatedMeanings: ["这: this"],
                                        parts: ["SLL radical", "Zhe body"])
    
    static let tan = LessonTwoCharacter(chineseWord: "毯",
                                        pinyinWord: "Tǎn",
                                        relatedMeanings: ["毯子: blanket"],
                                        parts: ["Tan radical", "Tan body"])
    
    static let surroundLowerLeft = [[hai, zhe], [tan]]
    
    // 9. Surround Above
    static let tong = LessonTwoCharacter(chineseWord: "同",
                                         pinyinWord: "Tóng",
                                         relatedMeanings: ["相同的: identical"],
                                         parts: ["Tong radical", "Tong body"])
    
    static let zhou = LessonTwoCharacter(chineseWord: "周",
                                         pinyinWord: "Zhōu",
                                         relatedMeanings: ["周边: surrounding", "周围: around"],
                                         parts: ["Zhou radical", "Zhou body"])
    
    static let wen = LessonTwoCharacter(chineseWord: "问",
                                        pinyinWord: "Wèn",
                                        relatedMeanings: ["问: to ask"],
                                        parts: ["SA radical 1", "Wen body"])
    
    static let nao = LessonTwoCharacter(chineseWord: "闹",
                                        pinyinWord: "Nào",
                                        relatedMeanings: ["吵闹: noisy"],
                                        parts: ["SA radical 1", "Nao body"])
    
    static let surroundAbove = [[tong], [zhou], [wen, nao]]
    
    // 10. Surround Below
    static let han = LessonTwoCharacter(chineseWord: "函",
                                        pinyinWord: "Hán",
                                        relatedMeanings: ["函件: letter, correspondence"],
                                        parts: ["SB radical 1", "Han body"])
    
    static let hua = LessonTwoCharacter(chineseWord: "画",
                                        pinyinWord: "Huà",
                                        relatedMeanings: ["绘画: painting"],
                                        parts: ["SB radical 1", "Hua body"])
    
    static let xiong = LessonTwoCharacter(chineseWord: "凶",
                                          pinyinWord: "Xiōng",
                                          relatedMeanings: ["凶猛: ferocious, violent"],
                                          parts: ["SB radical 1", "Xiong body"])
    
    static let ji = LessonTwoCharacter(chineseWord: "击",
                                       pinyinWord: "Jī",
                                       relatedMeanings: ["击中: to hit"],
                                       parts: ["Ji radical", "Ji body"])
    
    static let surroundBelow = [[han, hua, xiong], [ji]]
    
    // 11. Surround left
    static let xia = LessonTwoCharacter(chineseWord: "匣",
                                        pinyinWord: "Xiá",
                                        relatedMeanings: ["匣: box"],
                                        parts: ["SL radical 1", "Xia body"])
    
    static let chen = LessonTwoCharacter(chineseWord: "臣",
                                         pinyinWord: "Chén",
                                         relatedMeanings: ["臣: minister, official"],
                                         parts: ["SL radical 1", "Chen body"])
    
    static let qu = LessonTwoCharacter(chineseWord: "区",
                                       pinyinWord: "Qū",
                                       relatedMeanings: ["区域: area"],
                                       parts: ["SL radical 1", "Qu body"])
    
    static let surroundLeft = [[xia, chen, qu]]
    
    // 12. Surround full
    static let hui = LessonTwoCharacter(chineseWord: "回",
                                        pinyinWord: "Huí",
                                        relatedMeanings: ["返回: to return"],
                                        parts: ["SF radical 1", "Hui body"])
    
    static let yin = LessonTwoCharacter(chineseWord: "因",
                                        pinyinWord: "Yīn",
                                        relatedMeanings: ["因为: because"],
                                        parts: ["SF radical 1", "Yin body"])
    
    static let guo = LessonTwoCharacter(chineseWord: "国",
                                        pinyinWord: "Guó",
                                        relatedMeanings: ["国家: country", "中国: China", "美国: USA"],
                                        parts: ["SF radical 1", "Guo body"])
    
    static let kun = LessonTwoCharacter(chineseWord: "困",
                                        pinyinWord: "Kùn",
                                        relatedMeanings: ["困: sleepy"],
                                        parts: ["SF radical 1", "Kun body"])
    
    static let surroundFull = [[hui, yin, guo, kun]]
    
    // 13. Overlaid
    static let you = LessonTwoCharacter(chineseWord: "幽",
                                        pinyinWord: "Yōu",
                                        relatedMeanings: ["幽静: quite"],
                                        parts: ["You overlaid"])
    
    static let shuang = LessonTwoCharacter(chineseWord: "爽",
                                           pinyinWord: "Shuǎng",
                                           relatedMeanings: ["凉爽的: cool"],
                                           parts: ["Shuang overlaid"])
    
    static let overlaid = [[you], [shuang]]
    
    static let ofLessonTwo = [singleComponent, aboveBelow, leftRight, aboveMiddleBelow, leftMiddleRight, surroundUpperLeft, surroundUpperRight, surroundLowerLeft, surroundAbove, surroundBelow, surroundLeft, surroundFull, overlaid]
}

// MARK: - Lesson Three Characters
extension Characters {
    static let kou = LessonThreeCharacter(chineseWord: "口",
                                            pinyinWord: "Kǒu",
                                            relatedMeanings: ["口: mouth, opening, orifice"],
                                            drawings: ["kou 1", "kou 2", "kou 3", "kou 4"],
                                            description: "The basic meaning of 口 is mouth, and the character is shaped like a mouth")
    
    static let jian = LessonThreeCharacter(chineseWord: "见",
                                            pinyinWord: "Jiàn",
                                            relatedMeanings: ["再见: goodbye"],
                                            drawings: ["jian 1", "jian 2", "jian 3", "jian 4"],
                                            description: "见 had an eye on the top and a person at the bottom, meaning \"watching with eyes open\"")
    
    static let shan = LessonThreeCharacter(chineseWord: "山",
                                            pinyinWord: "Shān",
                                            relatedMeanings: ["山: mountain, hill"],
                                            drawings: ["shan 1", "shan 2", "shan 3", "shan 4"],
                                            description: "山 means mountain and was originally shaped like rolling mountains")
    
    static let xin = LessonThreeCharacter(chineseWord: "心",
                                            pinyinWord: "Xīn",
                                            relatedMeanings: ["心: heart"],
                                            drawings: ["xin 1", "xin 2", "xin 3", "xin 4"],
                                            description: "心, as you can see, refers to the heart")
    
    static let nu = LessonThreeCharacter(chineseWord: "女",
                                            pinyinWord: "Nǚ",
                                            relatedMeanings: ["女: female", "女朋友: girlfriend"],
                                            drawings: ["nu 1", "nu 2", "nu 3", "nu 4"],
                                            description: "女 originally looked like a woman kneeling on the ground, meaning \"woman\"")
    
    static let ofLessonThree = [kou, jian, shan, xin, nu]
}
