-- 従業員モデル（データ型）を作成するサービスの実装
module UseCases.Services.Employee.GetEmployeeService (getEmployeeById) where
    import Gateways.Repositories.Employee.EmployeeRepository(readEmployeeById)

    getEmployeeById :: inputGetEntityData -> IO ()
    getEmployeeById inputGetEntityData = readEmployeeById $ id inputGetEntityData