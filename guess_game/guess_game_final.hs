module Main where

-- Pure function: Checks if the guess is correct and returns a hint
checkGuess :: Int -> Int -> String
checkGuess secret guess
    | guess < secret  = "Too low!"
    | guess > secret  = "Too high!"
    | otherwise       = "Correct!"

-- Pure function: Returns the updated guesses list after a new guess
trackGuesses :: [Int] -> Int -> [Int]
trackGuesses guesses guess = guesses ++ [guess]

-- Impure function: Loops until the correct guess is made or attempts run out, tracks guesses
gameLoop :: Int -> Int -> [Int] -> IO ()
gameLoop secret remainingGuesses guesses
    | remainingGuesses <= 0 = do
        putStrLn "Out of guesses! Game over."
        putStrLn $ "Guesses made: " ++ show guesses  -- Fix here: Use `show guesses` to convert to string
    | otherwise = do
        putStrLn $ "You have " ++ show remainingGuesses ++ " guesses left."
        putStrLn "Enter your guess: "
        guess <- readLn
        let result = checkGuess secret guess
        putStrLn result
        let updatedGuesses = trackGuesses guesses guess
        if result == "Correct!"
            then do
                putStrLn "Congratulations, you guessed the number!"
                putStrLn $ "Guesses made: " ++ show updatedGuesses  -- Fix here: Use `show updatedGuesses`
            else gameLoop secret (remainingGuesses - 1) updatedGuesses

-- Impure function: Gets the secret number and max attempts, then starts the game
main :: IO ()
main = do
    putStrLn "Player 1, enter the secret number: "
    secret <- readLn
    putStrLn "Enter the maximum number of guesses: "
    maxGuesses <- readLn
    putStrLn "Player 2, start guessing!"
    gameLoop secret maxGuesses []
