-- 従業員の入力データ型
module Presenters.Converters.Employee.InputEmployeeData where

    data InputEmployeeData = InputEmployeeData {
            name :: String,
            age :: Int
        } deriving (Show)

    class InputEmployeeClass a where
        getNameRaw :: a -> String
        getAgeRaw  :: a -> Int

    instance InputEmployeeClass InputEmployeeData where
        getNameRaw a = name a
        getAgeRaw a = age a