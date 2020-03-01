-- 従業員コントローラ―
module Controllers.Employee.EmployeeController(callCreateEmployee) where
    import Presenters.Converters.Employee.InputEmployeeData
    import UseCases.Services.Employee.CreateEmployeeService (createEmployee)

    callCreateEmployee :: String -> String -> IO ()
    callCreateEmployee inputName inputAge =
        createEmployee $ generateInputEmployeeData inputName inputAge
        

    generateInputEmployeeData :: String -> String -> InputEmployeeData
    generateInputEmployeeData inputName inputAge =
        InputEmployeeData {
            name = inputName,
            age = read inputAge
        }