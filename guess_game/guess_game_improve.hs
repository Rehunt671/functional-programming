module Main where

-- Pure function: Checks if the guess is correct and returns a hint
checkGuess :: Int -> Int -> String
checkGuess secret guess
    | guess < secret  = "Too low!"
    | guess > secret  = "Too high!"
    | otherwise       = "Correct!"

-- Impure function: Loops until the correct guess is made or attempts run out
gameLoop :: Int -> Int -> IO ()
gameLoop secret remainingGuesses
    | remainingGuesses <= 0 = putStrLn "Out of guesses! Game over."
    | otherwise = do
        putStrLn $ "You have " ++ show remainingGuesses ++ " guesses left."
        putStrLn "Enter your guess: "
        guess <- readLn
        let result = checkGuess secret guess
        putStrLn result
        if result == "Correct!"
            then putStrLn "Congratulations, you guessed the number!"
            else gameLoop secret (remainingGuesses - 1)

-- Impure function: Gets the secret number and max attempts, then starts the game
main :: IO ()
main = do
    putStrLn "Player 1, enter the secret number: "
    secret <- readLn
    putStrLn "Enter the maximum number of guesses: "
    maxGuesses <- readLn
    putStrLn "Player 2, start guessing!"
    gameLoop secret maxGuesses
