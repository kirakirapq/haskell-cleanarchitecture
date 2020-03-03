-- 従業員取得の入力データ型
module Presenters.Converters.Employee.InputGetEmployeeData where

    data InputGetEmployeeData = InputGetEmployeeData {
            id :: Int
        } deriving (Show)

    class InputGetEmployeeClass a where
        getIdRaw  :: a -> Int

    instance InputGetEmployeeClass InputGetEmployeeData where
        getIdRaw a = id a