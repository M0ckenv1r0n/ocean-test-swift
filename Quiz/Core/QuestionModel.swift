import Foundation

struct Quiz: Decodable, Hashable {
    var title: String
    var questions: [Question]
}

struct Question: Decodable, Hashable {
    var question: String
    var options: [String]
}

extension Quiz {
    static var empty: Self = .init(title: "", questions: [])
}

var questionMock =
"""
{
  "title": "Brief Big Five Personality Inventory (BFI-10)",
  "questions": [
    {
      "question": "I see myself as someone who is reserved.",
      "options": ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"]
    },
    {
      "question": "I see myself as someone who is generally trusting.",
      "options": ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"]
    },
    {
      "question": "I see myself as someone who tends to be lazy.",
      "options": ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"]
    },
    {
      "question": "I see myself as someone who is relaxed, handles stress well.",
      "options": ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"]
    },
    {
      "question": "I see myself as someone who has few artistic interests.",
      "options": ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"]
    },
    {
      "question": "I see myself as someone who is outgoing, sociable.",
      "options": ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"]
    },
    {
      "question": "I see myself as someone who tends to find fault with others.",
      "options": ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"]
    },
    {
      "question": "I see myself as someone who does a thorough job.",
      "options": ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"]
    },
    {
      "question": "I see myself as someone who gets nervous easily.",
      "options": ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"]
    },
    {
      "question": "I see myself as someone who has an active imagination.",
      "options": ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"]
    }
  ]
}

"""

func getNumericValue(s: String) -> Int {
    let dict: [String: Int] = [
        "Strongly Disagree": 1,
        "Disagree": 2,
        "Neutral": 3,
        "Agree": 4,
        "Strongly Agree": 5
    ]
    
    return dict[s]!
}


var questionsArrayMock: [Question] = [
    .init(question: "Which country won the FIFA World Cup in 2018?", options: ["France", "Brazil", "Germany", "Spain"] ),
    
        .init(question: "Who is the all-time leading scorer in NBA history?", options: ["Kareem Abdul-Jabbar", "LeBron James", "Michael Jordan", "Kobe Bryant"]),
    
        .init(question: "Which team has won the most Super Bowl titles?", options: ["New England Patriots", "San Francisco 49ers", "Pittsburgh Steelers", "Dallas Cowboys"])
]
