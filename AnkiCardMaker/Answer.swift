//
//  Answer.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/23.
//

import SwiftUI
import MarkdownKit

struct Answer {
    static let mockText = """
de·velop verb
[OX3000][A2] [OPAL W] [OPAL S]
 /dɪˈveləp/
 /dɪˈveləp/
+ Verb Forms
grow/improve
1 [OX3000][A2] [intransitive, transitive] to gradually grow or become bigger, more advanced, stronger, etc.; to make something do this
The child is developing normally.
Some children develop more slowly than others.
develop into something Gradually these settlements developed into cities.
develop from something Human beings developed from earlier species of animals.
develop from something into something The place has rapidly developed from a small fishing community into a thriving tourist resort.
develop something The aim is to develop your personal skills.
develop something from something She developed the company from nothing.
develop something into something The competition helps entrants develop ideas into business concepts.
2 [OX3000][B1] [transitive, intransitive] develop (something)to start to have a skill, ability, quality, etc. that becomes better and stronger; to become better and stronger
He’s developed a real flair for management.
Their relationship has developed over a number of years.
+ Extra Examples
new idea/product
3 [OX3000][A2] [transitive] develop somethingto think of or produce a new idea, product, etc. and make it successful
The company develops and markets new software.
It takes time to develop new technology.
We are developing products for different parts of the industry.
to develop a strategy/system/programme
to develop a method/model/technique
A new type of painkilling drug has recently been developed.
+ Synonyms make
+ Extra Examples
disease/problem
4 [OX3000][B1] [transitive, intransitive] develop (something)to begin to have something such as a disease or a problem; to start to affect somebody/something
She developed lung cancer at the age of sixty.
Her son developed asthma when he was two.
The car developed engine trouble and we had to stop.
If symptoms develop, seek help quickly.
Problems can develop unexpectedly.
happen/change
5 [OX3000][B1] [intransitive] to start to happen or change, especially in a bad way
A crisis was rapidly developing in the Gulf.
We need more time to see how things develop before we take action.
develop into something The conflict quickly developed into full-scale war.
The situation is developing into a crisis.
build houses
6 [OX3000][B2] [transitive] develop somethingto build new houses, factories, etc. on an area of land, especially land that was not being used effectively before
The site is being developed by a French company.
+ Extra Examples
create/improve facilities
7 [transitive] develop somethingto build or improve a building or other facilities
The company is developing a chain of hotels.
He is enthusiastic about plans to develop the leisure facilities at the site.
become economically advanced
8 [intransitive] (economics) (of a country) to become economically and socially more advanced
There have been many attempts to explain why some countries develop whilst others remain in poverty.
China is developing at a pace that is remarkable to behold.
SEE ALSO developed (1)
idea/story/musical theme
9 [transitive] develop somethingto add further explanation or details to an idea, story or musical theme
SYNONYM elaborate (1)
She develops the theme more fully in her later books.
The piano then takes up the melody and develops it.
He began to develop these ideas in a series of paintings.
photographs
10 [transitive] develop somethingto treat film that has been used to take photographs with chemicals so that the pictures can be seen
When Lewis developed the film, he was astonished by what he saw.
+ Word Origin
"""
    static let mockText2 = """
hurry verb
[OX3000][B1]
 /ˈhʌri/
 /ˈhɜːri/
+ Verb Forms
1 [OX3000][B1] [intransitive] to move or act quickly because there is not much time
SYNONYM rush
You’ll have to hurry if you want to catch that train.
We need to hurry or we’ll be late for school.
hurry to do something The kids hurried to open their presents.
In spoken English hurry can be used with and plus another verb, instead of with to and the infinitive, especially to tell somebody to do something quickly: Hurry and eat before the soup gets cold.
2 [OX3000][B1] [intransitive] + adv./prep.to move quickly in a particular direction
SYNONYM rush
He picked up his bags and hurried across the courtyard.
She hurried away without saying goodbye.
She hurried after Gary to apologize to him.
She hurried down the street.
I hurried home to tell him the news.
+ Extra Examples
3 [OX3000][B2] [transitive] to make somebody do something more quickly
SYNONYM rush
hurry somebody I don’t want to hurry you but we close in twenty minutes.
hurry somebody into doing something She was hurried into making an unwise choice.
4 [transitive] hurry something + adv./prep.to deal with something quickly
SYNONYM rush
Her application was hurried through.
5 [transitive, usually passive] to do something too quickly
SYNONYM rush
be hurried A good meal should never be hurried.
+ Word Origin
Phrasal Verbs
ˌhurry ˈon
to continue speaking without giving anyone else time to say anything
She hurried on before he could interrupt her.
ˌhurry ˈup (with something)
to do something more quickly because there is not much time
I wish the bus would hurry up and come.
Hurry up! We’re going to be late.
Hurry up with the scissors. I need them.
Hurry up or we’ll be late!
ˌhurry somebody/something ↔ ˈup
to make somebody do something more quickly; to make something happen more quickly
Can you do anything to hurry my order up?
"""
    
    var text: String
    
    var html: String {
        let formattedText = OALDPlainParser.standard.parse(text: text)
        let markdown = MarkdownParser.standard.parse(formattedText)
        return HtmlGenerator.standard.generate(doc: markdown)
    }
    
    init(text: String = mockText2) {
        self.text = text
    }
}
