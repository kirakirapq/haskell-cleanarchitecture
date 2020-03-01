-- 従業員リポジトリクラスの実装
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
module Gateways.Repositories.Employee.EmployeeRepository(addEmployee) where
import           Control.Monad.IO.Class  (liftIO)
import           Control.Monad.Logger    (runStderrLoggingT)
import Data.ByteString.Char8 (pack) 
import           Database.Persist
import           Database.Persist.Postgresql
import           Database.Persist.TH
import Models.Employee.EmployeeEntity
import PostgresqlConfig.Setting(getConn)

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Employee
    name String
    age Int Maybe
    deriving Show
|]

host = getConn "host"
dbname = getConn "dbname"
user = getConn "user"
password = getConn "password"
port = getConn "port"

connStr = pack $ concat [host, dbname, user, password, port]

addEmployee :: EmployeeEntity -> IO ()
addEmployee employee = runStderrLoggingT $ withPostgresqlPool connStr 10 $ \pool -> liftIO $ do
    flip runSqlPersistMPool pool $ do
        runMigration migrateAll

        let 
            name = getName employee
            age = getAge employee

        -- -- 従業員テーブル
        empId <- insert $ Employee name $ age

        emp <- get empId
        liftIO $ print (emp :: Maybe Employee)