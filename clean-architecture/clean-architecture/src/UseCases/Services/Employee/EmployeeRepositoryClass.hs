-- 従業員（データ型）のリポジトリの振る舞いを定義
module UseCases.Services.Employee.EmployeeRepositoryClass where

class EmployeeRepositoryClass emp where
    addEmployee :: emp -> IO ()