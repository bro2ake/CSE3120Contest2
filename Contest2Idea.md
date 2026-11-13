Simple roguelike deck-building game inspired by games like Slay the Spire and Balatro
Contains 3 distinct stages where you fight increasingly difficult enemies.
- Warm-up Monster
- Elite Monster
- Final Boss
There will be variability in the health/defense/attacks that the enemies do since there are only 3 enemy encounters; adding variability will increase the strategy required.

At the beginning of the game, the player will be given a set amount of attack/defend cards, as well as a couple of special alternate cards
They will be able to choose 2 additional card rewards chosen from a random pool of cards.

After each enemy encounter, the player will be given the option to choose one of three card rewards to be added to their deck of future encounters.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
File layout intent:
- Main.asm: Initialize the console handles, seed RNG for variability & card rewards, run the outer loop for the 3-stage game loop, and handle victory/loss screens.
- InitStage.asm: Loads enemy stats for the 'CurrentStage', copies the player's deck into their 'DrawPile ', and calls 'ShuffleDeck'.
- StartTurn.asm/EndTurn.asm: Resets 'PlayerEnergy=3', zeroes 'PlayerBlock' at the turn start, draws 5 cards, rolls enemies' next-turn intent, and executes enemy actions at turn end.
- PlayCard.asm: Validates energy cost (Whether they can actually play it), applies card effects (if strength/weakness/vulnerability/etc. are added), Moves the card ID from 'Hand' to 'DiscardPile', and shifts the remaining elements.
- RenderScreen.asm: Draws the player status bar, including: 'CurrentStage', 'PlayerHP', 'Block', 'Energy'. Draw enemy ASCII art and their intent box, Deck/Discard pile counters, and the 5-card hand dealt.
- GameData.asm: contains the .data segment for CardTable, EnemyTable, and StarterDeck are allocated and init.
- GameData.inc: Declares the EXTERNDEF for each of the cross-file variable names like: CardTable, EnemyTable, StarterDeck, and StarterDeckCount.
- Constants.inc: INCLUDE in all .asm files. Will hold Symbolic constants for card IDs, card types, intent types, and limits.
- Stucts.inc: STRUCT blueprints for CARD, ENEMY; also holds PROTO declarations for cross-file procedures like ShuffleDeck, PlayCard, and RenderHand.
- Macros.inc: any helper macros that are needed like mDrawCard, mPrintAt
- More files can be added as needed.
