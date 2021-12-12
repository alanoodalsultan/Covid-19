//
//  NewsModel.swift
//  Covid-19-
//
//  Created by alanood on 19/04/1443 AH.
//

import Foundation
import UIKit


struct News {
    var image: UIImage
    var title: String
    var article: String
    var date: String
    var source: String
    static let news = [
        
        News(image: UIImage(named: "news1")!, title: "Saudi Arabia allows all travelers with one dose of COVID-19 vaccine into Kingdom", article: """
Saudi Arabia announced on Monday that travelers from all countries will be allowed in if they have received at least one dose of the COVID-19 vaccine inside the Kingdom.

According to the Saudi Press Agency (SPA), the General Authority of Civil Aviation sent the new directive to all airlines operating in Saudi Arabia’s airports, which will come into effect from 1:00 a.m. on Saturday, Dec. 4.

The circular clarified that direct flights from all countries will be allowed in the country, however, a mandatory three-day institutional quarantine period will be implemented in addition to having received at least one vaccine shot in Saudi Arabia.

Airlines are also being advised to educate travelers on the importance of adhering to the precautionary measures implemented by Saudi Arabia's authorities.
""", date: "November 29, 2021", source: "Arab News"),
        
        
        News(image: UIImage(named: "news2")!, title: "Covid: South Africa 'punished' for detecting new Omicron variant", article: """
South Africa has complained it is being punished - instead of applauded - for discovering Omicron, a concerning new variant of Covid-19.

The foreign ministry made the statement as countries around the world restricted travel from southern Africa as details of the spread emerged.

Early evidence suggests Omicron has a higher re-infection risk.

The World Health Organization (WHO) said on Friday that the new variant was "of concern".

Several cases have now been identified in Europe - two in the UK, two in Germany, one in Belgium and another one in Italy, while a suspected case was found in the Czech Republic.

Israel, where the new variant has been confirmed, has decided to ban all foreigners from entering the country from midnight Sunday.
""", date: "November 28, 2021", source: "BBC NEWS"),
        
        
        News(image: UIImage(named: "news3")!, title: "Health authorities report 25 new COVID-19 cases in Saudi Arabia", article: """
RIYADH: The Ministry of Health reported 25 new confirmed coronavirus disease (COVID-19) cases, 44 critical cases and 29 recoveries in the Kingdom on Monday.
The total number of infections in the country reached 549,720, while the recovery tally reached 538,885. One new death was reported, bringing the tally of fatalities in the Kingdom to 8,834.
The ministry advised everyone to contact the toll-free number 937 for consultations and inquiries around the clock and to obtain health information and services.
Meanwhile, The WHO warned on Monday that omicron variant of coronavirus carries a very high global risk of surges, as more countries reported cases, prompting border closures and reviving worries about the economic recovery from a two-year pandemic.

Scientists have said it could take weeks to understand the severity of omicron, which was first identified in southern Africa. Its emergence has caused a strong global reaction, with countries imposing travel curbs and other restrictions, worried that it could spread fast even in vaccinated populations.
On Sunday, a South African doctor who was one of the first to suspect a new strain said omicron appeared so far to be producing mild symptoms.
""", date: "November 30, 2021 ", source: "ARAB NEWS"),
        News(image: UIImage(named: "news4")!, title: "Covid news – live: Face masks return in England in bid to curb omicron variant, as PM to hold press conference", article: """
The government’s measures to protect against the new omicron variant of coronavirus come into force on Tuesday, with face masks becoming mandatory once again in England’s shops and settings such as post offices, hairdressers and public transport.

All travellers returning to the UK will also be required to take a PCR test, and self-isolate until they receive a negative result, as Boris Johnson continues to insist vaccines and boosters remain the best line of defence.

There are now 14 confirmed cases of omicron in the UK – five in England and nine in Scotland – after two new cases were found in London over night, and six across Lanarkshire and Glasgow this morning. Anyone who believes they might be a contact of one of these people is being told to self-isolate immediately, regardless of their age or vaccination status.

Mr Johnson will address the nation this evening, at around 5pm, in a bid to urge everyone to follow the new rules and “do their bit” to help slow the spread of the new variant. He will also encourage all non-vaccinated members of the public to come forward and get a jab.
""", date: "November 30, 2021", source: "INDEPENDENT")
    ]
}

var currentLanguage: String? {
    get {
        UserDefaults.standard.array(forKey: "AppleLanguages")?.first as? String
    }
    set {
        if let newValue = newValue{
            UserDefaults.standard.set([newValue], forKey: "AppleLanguages")
        }else{
            UserDefaults.standard.removeObject(forKey: "AppleLanguages")
        }
    }
}
