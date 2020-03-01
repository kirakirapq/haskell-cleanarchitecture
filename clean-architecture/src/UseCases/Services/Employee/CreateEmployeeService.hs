-- 従業員モデル（データ型）を作成するサービスの実装
module UseCases.Services.Employee.CreateEmployeeService (createEmployee) where
    import Gateways.Repositories.Employee.EmployeeRepository(addEmployee)
    import Models.Employee.Age
    import Models.Employee.EmployeeEntity
    import Models.Employee.EmployeeEntityFactory (generateEmployeeEntity)
    import Models.Employee.Name
    import Presenters.Converters.Employee.InputEmployeeData

    createEmployee inputEntityData = 
        let name = generateName $ getNameRaw inputEntityData
            age = generateAge $ getAgeRaw inputEntityData
            employeeEntity = generateEmployeeEntity name age
            in addEmployee employeeEntity