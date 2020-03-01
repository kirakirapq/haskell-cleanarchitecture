-- 名前型(Stringクラスの別名)
module Models.Employee.Name where
type Name = String

-- メソッド定義
generateName :: String -> Name
generateName name = name :: Name