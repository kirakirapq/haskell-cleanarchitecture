module Main where

import Controllers.Employee.EmployeeController(callCreateEmployee)

main :: IO ()
main = do
    createMethod


createMethod :: IO ()
createMethod = do
    putStrLn "what`s your  name?"
    name <- getLine
    putStrLn "how old are you?"
    age <- getLine

    callCreateEmployee name age
