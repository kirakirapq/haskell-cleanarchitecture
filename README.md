# haskell-cleanarchitecture
### 構成図
UseCase層からGateways層のRepository呼び出しは依存の向きが逆転しているのでデータクラスをUseCase層で持たせ、Repositoryで実装させたかったがうまくいかなかった。
![](https://user-images.githubusercontent.com/43517870/75620578-c2a15e00-5bcd-11ea-9f9a-28214d3e6776.png)

### DB設定
`configs/PostgresqlConfig/Setting.hs`ファイルを作成して記述

```Setting.hs
module PostgresqlConfig.Setting(getConn) where
data PostgresqlConfig = PostgresqlConfig {
    postgressHost :: String,
    postgressDbname :: String,
    postgressUser :: String,
    postgressPassword :: String,
    postgressPort :: String
}

dbconfig :: PostgresqlConfig
dbconfig = PostgresqlConfig {
    postgressHost = "localhost", -- ホストアドレスを指定
    postgressDbname = "my_database", -- DB名を指定
    postgressUser = "username", -- username
    postgressPassword = "password", -- password
    postgressPort = "5432" -- port番号
}

setConn :: String -> String -> String
setConn from to = from ++ "=" ++ to ++ " "

getConn x
    | x == "host" = setConn  "host" (postgressHost dbconfig)
    | x == "dbname" = setConn  "dbname" (postgressDbname dbconfig)
    | x == "user" = setConn  "user" (postgressUser dbconfig)
    | x == "password" = setConn  "password" (postgressPassword dbconfig)
    | x == "port" = setConn  "port" (postgressPort dbconfig) :: String
```

### Postgresql テーブル
- Employee

|  Field  |  型  |
| ---- | ---- |
|  id  |  bigint (PK)  |
|  name  |  character varying (NOT NULL)  |
|  age  |  bigint   |


### 起動

```
# build
> stack build
# run
> stack exec clean-architecture-exe
```



