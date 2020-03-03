module Main where

import Controllers.Employee.EmployeeController (callCreateEmployee, callGetEmployeeById)

typeGet = 1 :: Int
typeCreate = 2 :: Int
typeUpdate = 3 :: Int
typeDelete = 4 :: Int

main :: IO ()
main = do
    putStrLn "plese input number"
    putStrLn ("if get data then " ++ show typeGet)
    putStrLn ("and if make data then " ++ show typeCreate)
    putStrLn ("and if update data then " ++ show typeUpdate)
    putStrLn ("and if delete data then " ++ show typeDelete)
    methodType <- getLine

    excute $ read methodType

excute :: Int -> IO ()
excute methodType
    | methodType == typeGet    = getMethod
    | methodType == typeCreate = createMethod
    | methodType == typeUpdate = updateMethod
    | methodType == typeDelete = deleteMethod

createMethod :: IO ()
createMethod = do
    putStrLn "what`s your  name?"
    name <- getLine
    putStrLn "how old are you?"
    age <- getLine

    callCreateEmployee name age

getMethod :: IO ()
getMethod = do
    putStrLn "please input employee id"
    id <- getLine

    callGetEmployeeById id

updateMethod :: IO ()
updateMethod = do
    putStrLn "UPDATE!"

deleteMethod :: IO ()
deleteMethod = do
    putStrLn "DELETE!"
