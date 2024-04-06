## Rock_Paper_Scissors Game -0-
game <- function() {
    ## Greeting--------------------------------
    print("Hello human, welcome to the game!")
    flush.console()
    username <- readline("What's your name: ")
    print(paste("Let's play game", username))
    print("This game you have three movement: Rock, Paper and Scissors")

    ## Set score
    player_score <- 0
    bot_score <- 0

    ## Set game
    hands <- c("Rock", "Paper", "Scissors")

    ## Loop
    while(TRUE) {
         flush.console()
        bot_choose <- sample(hands, 1)
        player_choose <- readline("Choose your choice: ")
        print(paste("You chose", player_choose,"and", "Bot chose", bot_choose))

    if(player_score > 4){
        print("Congratulation you're a winner!")
    } else if(bot_score > 4){
        print("You are lose")
          break
    }


    ## Rule of game
    if(player_choose == bot_choose){
        print("DrAw")
    } else if (player_choose == "Rock" & bot_choose == "scissors") {
        player_score <- player_score + 1
            print("You Win!")
    } else if(player_choose == "scissors" & bot_choose == "paper")
    {   player_score <- player_score + 1
            print("You Win!")
    } else if(player_choose == "Paper" & bot_choose == "Rock") {
        player_score <- player_score + 1
            print("You Win!")
    } else {
        bot_score <- bot_score + 1
            print("Bot WiN!")
    }
        print(paste("Your score:", player_score))
        print(paste("Computer score:", bot_score))
    }
}
