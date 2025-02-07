module Main where

-- Pure function: Checks if the guess is correct and returns a hint
checkGuess :: Int -> Int -> String
checkGuess secret guess
    | guess < secret  = "Too low!"
    | guess > secret  = "Too high!"
    | otherwise       = "Correct!"

-- Impure function: Loops until the correct guess is made
gameLoop :: Int -> IO ()
gameLoop secret = do
    putStrLn "Enter your guess: "
    guess <- readLn
    let result = checkGuess secret guess
    putStrLn result
    if result == "Correct!" 
        then return () 
        else gameLoop secret

-- Impure function: Gets the secret number and starts the game
main :: IO ()
main = do
    putStrLn "Player 1, enter the secret number: "
    secret <- readLn
    putStrLn "Player 2, start guessing!"
    gameLoop secret
