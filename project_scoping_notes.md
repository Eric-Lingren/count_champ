Project Scoping

Data:
    Card Data
    BS Plays
    Deviation Plays

Settings:
    Choose Rules
    DAS Allowed?
    Double after 2 cards
    Resplitting Allowed
        Aces?
    Dealer hits soft 17?
    Surender Allowed?
        Early vs late
    Dealer Peek
    Deck Quantity
    Deck Pennetration
    Bankroll Amt

Deck:
    1-8 decks of cards
    Remaining
    Discards
    Cut Card
    Shuffle
    Count

Dealer: Extends Player
    Hand [ {}, {} ]
    Deal Function (2 cards to each player)
    Peek for blackjack
        Early vs late surrender
    Offer Insurance

Player:
    Hand [ [ {}, {} ], [], [], [] ]
    Bankroll
    Actions:
        Hit (1 card to player only)
        Stand ()
        Double ()
        Split ()
        Surrender ()
        Take Insurance ()


BS Trainer:
    Deviation Trainer:
        Deviation Rules

Running Count Trainer:
    Standard
    Speed Count Option

True Count Trainer:


Deck Estimation Trainer:


Bet Trainer:


Game:


Stats: