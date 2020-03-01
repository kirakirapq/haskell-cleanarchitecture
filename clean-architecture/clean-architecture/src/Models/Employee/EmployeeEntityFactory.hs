-- 従業員モデル（データ型）作成ファクトリーの定義
module Models.Employee.EmployeeEntityFactory (generateEmployeeEntity) where
    import Models.Employee.Age
    import Models.Employee.EmployeeEntity
    import Models.Employee.Name

    generateEmployeeEntity :: Name -> Age -> EmployeeEntity
    generateEmployeeEntity name age = 
        EmployeeEntity {
            name = name,
            age = age
        }
