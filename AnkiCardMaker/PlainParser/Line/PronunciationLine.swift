//
//  PronunciationLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/6/1.
//

import Foundation

class PronunciationLine: Line  {
    override var disposable: Bool {
        if self.text == self.previousLine?.text {
            return true
        } else {
            return false
        }
    }
}

extension PronunciationLine: LineTypeMatchable {
    static func match(by text: String, previousLine: Line?) -> Bool {
        let regex = /\s*\/\b[pbtdʈɖcɟkɡqɢʔmɱnɳɲŋɴʙrʀⱱɾɽɸβfvθðszʃʒʂʐçʝxɣχʁħʕhɦɬɮʋɹɻjɰlɭʎʟʘǀǃǂǁɓɗʄɠʛʼiyɨʉɯuɪʏʊeøɘɵɤoəɛœɜɞʌɔæɐaɶɑɒʍwɥʜʢʡɕʑɺɧ͜͡ˈˌːˑ̆|‖.‿̥̬ʰ̹̜̟̠̩̯̈̽˞̤̰̼ʷʲˠˤ̴̝̞̘̙̪̺̻̃ⁿˡ̋̚˥̌˩́˦̂̄˧᷄̀˨᷅̏᷈]+\b\//
        return text.wholeMatch(of: regex) != nil
    }
}
