-- 年齢型(Maybe Intクラスの別名)
module Models.Employee.Age where

type Age = Maybe Int

generateAge :: Int -> Maybe Int
generateAge age = Just age
