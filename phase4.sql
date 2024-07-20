
SELECT *
FROM Patient
ORDER BY PatientLName;

SELECT *
FROM Employee
ORDER BY EmployeeLName;

SELECT CONCAT(PatientFName, ' ', PatientLName) AS FullName, City, State
FROM Patient
WHERE State = 'MA'
ORDER BY City, PatientLName;

SELECT CONCAT(e.EmployeeFName, ' ', e.EmployeeLName) AS FullName
FROM Employee e
JOIN EmployeeType et ON e.TypeID = et.TypeID
WHERE et.Description IN ('Physician', 'Surgeon')
ORDER BY et.Description, e.EmployeeLName;

SELECT *
FROM MedicalConditions
ORDER BY Description;

SELECT *
FROM Prescription
WHERE Description = '20mg'
ORDER BY PrescriptionID;

SELECT CONCAT(EmployeeFName, ' ', EmployeeLName) AS FullName, DateOfHire
FROM Employee
WHERE DateOfHire >= '2019-01-01'
ORDER BY DateOfHire DESC;

SELECT *
FROM Employee
WHERE Gender = 'F'
ORDER BY EmployeeLName;

SELECT *
FROM Specialty
WHERE Description LIKE '%surgery%';

SELECT CONCAT(PatientFName, ' ', PatientLName) AS FullName, City, State
FROM Patient
WHERE Gender = 'M' AND State <> 'MA';
