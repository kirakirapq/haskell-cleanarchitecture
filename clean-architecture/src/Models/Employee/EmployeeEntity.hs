-- 従業員モデル（データ型）を定義
-- 従業員クラスのインスタンス化
{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE UndecidableInstances #-}
module Models.Employee.EmployeeEntity where
    import Models.Employee.Age
    import Models.Employee.Name

    class EmployeeEntityClass a where
        getName :: a -> Name
        getAge  :: a -> Age

    data EmployeeEntity = EmployeeEntity {
        name :: Name,
        age :: Age
    } deriving (Show)

    instance EmployeeEntityClass EmployeeEntity where
        getName a = name a
        getAge a  = age a

    