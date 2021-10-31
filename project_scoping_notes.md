# Project Scoping   

## Data:   
>    Card Data   
>    Correct BS Plays   
>    Correct Deviation Plays   

---
>## Settings: (all Phase 1 release unless otherwise noted)   
>### Class + Page   
>Split into User settings and Trainer settings   
>    Choose Rules:    
>        DAS Allowed?   
>        Double after 2 cards   
>        Resplitting Allowed Aces?   
>        Dealer hits soft 17?   
>        Surender Allowed? Early vs late   
>        Dealer Peek   
>        Deck Quantity - 1, 2, 4, 6, 8, csm   
>        Deck Pennetration (later phase)   
>    Player Settings:   
>        Bankroll Amt - Premium Feature (later phase)   
>        Table Maximum - Set chip ranges - Premium Feature (later phase)   
>    Game/Player Settings:   
>        Show hand totals   
>        Show Running count   
>        Show true count   
>        Show House Edge at any give time - Premium Feature   

---   
>## Deck: (Phase 1)   
>### Class - Global   
>    1-8 decks of cards (or csm)   
>    Remaining   
>    Discards   
>    Cut Card   
>    Shuffle   
   

### Class - Global   
Dealer: Extends Player (Phase 1)   
    Hand [ {}, {} ]   
    Deal Function (2 cards to each player)   
    Peek for blackjack   
        Early vs late surrender   
    Offer Insurance   

### Class - Global   
Player: (Phase 1)   
    Hand [ [ {}, {} ], [], [], [] ]   
    Bankroll   
    Actions:   
        Hit (1 card to player only)   
        Stand ()   
        Double ()   
        Split ()   
        Surrender ()   
        Take Insurance ()   
    
### Class   
    Correct Plays - Parent class for some other trainers (phase 1)   
    Subclasses are:   
        Basic Stratgey   
        Game Play   

### Class   
    Correct Play Deviations - Extends Correct Plays Class (Phase 2)   
    Subclasses are:   
        Basic Stratgey   
        Game Play   

### Class   
    Counting - Parent class for some other trainers (phase 1)   
    Subclasses are:   
        Counting Systems   
        Running Count Trainer   
        True Count Calculation Trainer   
        Bet Sizing Trainer   
        Bet Camouflage   
        Shuffle Tracking Trainer   
        Game Play   


### Page + Class - Subclasses for deviations and other house rules will apply   
Basic Stratgey extends Trainer: (all Phase 1 release unless otherwise noted)   
    Extends Correct Plays Class and Deck Class   
    All plays are contingent on deck quantity and table rules   
    Practice all hand types:   
        Practice only hards   
        Practice only softs   
        Practice only splits    
        Practice any player hand by value I.E. all 15's or all 9's - Premium Feature   
        Practice against any dealer hand value I.E dealer has 8 or dealer has 17 - Premium Feature   
    Deviation Trainer:   
        Premium Feature -    
        Deviation Rules: (Phase 2)   
            Contingent upon true count   
            Illustrious 18 (non-insurance plays)   
            Fab 4 (insurance plays)   
    Stats:   
        Show session stats - allow reset   
        Show Career stats - Show Trend over time (later phase)   
    Basic Strategy Charts:   
        Show for all game and rule types.   
        Allow to flip and inverse - Premium Features (later phase)   
    
### Class    
Counting Systems: (all are later phase release unless otherwise noted)   
    Extends Counting Class and Deck Class   
    Display tutorial on each one -   
    Hi-Lo (running count and conversion to true count) - Free Version (Phase 1)   
    Hi-Opt I (running count and conversion to true count) - Premium Feature   
    Hi-Opt II (running count and conversion to true count) - Premium Feature   
    Halves (running count and conversion to true count) - Premium Feature   
    Knockout aka K-O (running count only with deck adjustments) - Premium Feature   
    Red 7 (running count only with deck adjustments) - Premium Feature   
    Zen (running count and conversion to true count) - Premium Feature   
    Omega II (running count and conversion to true count) - Premium Feature   
    Etc    
   

### Page    
Running Count Trainer: (Phase 1)   
    Extendinds Counting Class and Deck Class   
    Uses the counting System from the correct counting system class. Extends Counting System.   
    Self Paced Count   
    Speed Count Option   

   
### Page    
Deck Estimation Trainer: (Phase 2)   
    Extends Deck Class   
    Premium Feature   
   
### Page    
True Count Calculation Trainer: (Phase 2)   
    Extends Deck Class and Counting Class   
    Premium Feature   
   
### Page    
Bet Sizing Trainer: (Phase 2)   
    Extends Counting Class   
    Premium Feature   
    Calculate bet Sizing based on:   
        Count   
        Counting System (later phase)   
   
### Page    
Bet Camouflage: (later phase)   
    Extends Deck Class and Counting Class   
    Premium Feature   
   
### Page    
Shuffle Tracking Trainer: (later phase)   
    Extends Deck Class and Counting Class   
    Premium Feature   
   

### Page    
Game Play: (Phase 2)   
    Extends Deck Class, Counting Class, and Correct Plays Class   
    Simulated blackjack game where you bring all your skills to the table   

   
### Page    
Stats: (phased rollouts depending on stats)   
    Fore each training type   

   
### Page    
Quests: (later phases)   
    Meet certian objectives or find easter eggs to unlock new features   
   
### Page    
Achievements: (later phases)   
    Certian thersholds reached, like streaks or new milestones    
   
### Page    
Themes: (later phases)   
    Set table felts, chips, and cards   
    Based on membership level, quests or achievements   
   
### Page    
Player Rankings/Levels: (later phases)   
    Based on the top revenue gambling cities (show information about each as they are acheived)   
    Hide the rank, but show the requirement   
    Reno -> Atlantic City -> Singapore -> Vegas -> Macau -> Monte Carlo etc   
   
### Cloud Purchase / Page   
Membership Support: (Phase 2)   
    Levels can have different tiers based on what you want to buy   
    Based on Biggest Holding Companies (show info about each)   
        I.E.:   
        Las Vegas Sands - $14.99 unlocks everything   
        Caesars Entertainment - $9.99 unlocks more features   
        MGM Resorts - $4.99 unlocks most common features   
   

### Cloud Purchase / Page   
Tip Jar: (Phase 2)   
    For Developer Donations    
   
### Affiliate / Page   
    Risk of Ruin CVCX (later phases)   