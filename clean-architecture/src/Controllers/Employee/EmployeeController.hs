-- 従業員コントローラ―
module Controllers.Employee.EmployeeController(callCreateEmployee) where
    import Presenters.Converters.Employee.InputEmployeeData
    import Presenters.Converters.Employee.InputGetEmployeeData
    import UseCases.Services.Employee.CreateEmployeeService (createEmployee)
    import UseCases.Services.Employee.GetEmployeeService (getEmployeeById)

    -- Employee Get
    callGetEmployeeById :: String -> IO()
    callGetEmployeeById inputId =
        id = generateInputGetData inputId

    -- Employee Create
    callCreateEmployee :: String -> String -> IO ()
    callCreateEmployee inputName inputAge =
        getEmployeeById $ generateInputEmployeeData inputName inputAge
        

    generateInputEmployeeData :: String -> String -> InputEmployeeData
    generateInputEmployeeData inputName inputAge =
        InputEmployeeData {
            name = inputName,
            age = read inputAge
        }
    
    generateInputGetEmployeeData inputId = 
        InputGetEmployeeData {
            id = inputId
        } :: InputGetEmployeeData