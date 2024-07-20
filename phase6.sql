
SELECT e.EmployeeID,
       CONCAT(e.EmployeeFName, ' ', e.EmployeeLName) AS FullName,
       s.DayOfWeek,
       s.StartTime,
       s.EndTime
FROM Employee e
LEFT JOIN Schedule s ON e.EmployeeID = s.EmployeeID
ORDER BY e.EmployeeID, s.StartTime;

SELECT a.ApptDate,
       CONCAT(p.PatientFName, ' ', p.PatientLName) AS PatientFullName,
       CONCAT(e.EmployeeFName, ' ', e.EmployeeLName) AS EmployeeFullName,
       a.StartTime,
       a.Duration,
       a.ApptStatus
FROM Patient p
LEFT JOIN Appointment a ON p.PatientID = a.PatientID
LEFT JOIN Employee e ON a.EmployeeID = e.EmployeeID
ORDER BY p.PatientLName, a.ApptDate;

SELECT pr.PrescriptionID,
       pr.Description
FROM Prescription pr
WHERE pr.PrescriptionID NOT IN (SELECT mhp.PrescriptionID
                                FROM MedicalHistoryPres mhp);

SELECT mc.ConditionID,
       mc.Description
FROM MedicalConditions mc
WHERE mc.ConditionID IN (SELECT mhc.ConditionID
                         FROM MedicalHistoryCond mhc);

SELECT et.TypeID,
       et.Description
FROM EmployeeType et
WHERE et.TypeID NOT IN (SELECT e.TypeID
                        FROM Employee e);
