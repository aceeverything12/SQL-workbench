
SELECT CONCAT(e.EmployeeFName, ' ', e.EmployeeLName) AS FullName,
       s.DayOfWeek,
       s.StartTime,
       s.EndTime
FROM Employee e
JOIN Schedule s ON e.EmployeeID = s.EmployeeID
ORDER BY e.EmployeeLName, s.DayOfWeek, s.StartTime;

SELECT e.EmployeeLName,
       e.EmployeeFName,
       sp.Description AS SpecialtyDescription
FROM Employee e
JOIN EmployeeSpecialty es ON e.EmployeeID = es.EmployeeID
JOIN Specialty sp ON es.SpecialtyID = sp.SpecialtyID
ORDER BY sp.Description, e.EmployeeLName;

SELECT e.EmployeeLName,
       e.EmployeeFName,
       et.Description AS TypeDescription
FROM Employee e
JOIN EmployeeType et ON e.TypeID = et.TypeID
ORDER BY e.EmployeeLName, et.Description

SELECT a.ApptDate,
       CONCAT(p.PatientFName, ' ', p.PatientLName) AS PatientFullName,
       CONCAT(e.EmployeeFName, ' ', e.EmployeeLName) AS EmployeeFullName,
       a.StartTime,
       a.Duration
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN Employee e ON a.EmployeeID = e.EmployeeID
WHERE a.ApptStatus = 'Scheduled'
ORDER BY p.PatientLName, a.ApptDate;

SELECT mhc.MHCDate AS HistoryDate,
       p.PatientLName,
       p.PatientFName,
       mc.Description,
       'Condition' AS HistoryType
FROM MedicalHistoryCond mhc
JOIN Patient p ON mhc.PatientID = p.PatientID
JOIN MedicalConditions mc ON mhc.ConditionID = mc.ConditionID

UNION ALL

SELECT mhs.MHSDate AS HistoryDate,
       p.PatientLName,
       p.PatientFName,
       s.Description,
       'Surgery' AS HistoryType
FROM MedicalHistorySurg mhs
JOIN Patient p ON mhs.PatientID = p.PatientID
JOIN Surgery s ON mhs.SurgeryID = s.SurgeryID

UNION ALL

SELECT mhp.MHPDate AS HistoryDate,
       p.PatientLName,
       p.PatientFName,
       pr.Description,
       'Prescription' AS HistoryType
FROM MedicalHistoryPres mhp
JOIN Patient p ON mhp.PatientID = p.PatientID
JOIN Prescription pr ON mhp.PrescriptionID = pr.PrescriptionID

ORDER BY PatientLName, HistoryDate;

