
SELECT State, COUNT(PatientID) AS TotalPatients
FROM Patient
GROUP BY State
ORDER BY State;

SELECT MIN(ApptDate) AS EarliestDate, MAX(ApptDate) AS LatestDate
FROM Appointment
WHERE ApptStatus = 'Scheduled';

SELECT et.Description AS EmployeeType, COUNT(e.EmployeeID) AS TotalEmployees
FROM Employee e
JOIN EmployeeType et ON e.TypeID = et.TypeID
GROUP BY et.Description, et.TypeID 
ORDER BY et.TypeID;

SELECT DayOfWeek, COUNT(EmployeeID) AS TotalEmployees
FROM Schedule
GROUP BY DayOfWeek;

SELECT Gender, COUNT(PatientID) AS TotalPatients
FROM Patient
GROUP BY Gender;

UPDATE Patient
SET Gender = 'F'
WHERE PatientFName = 'Deborah' AND PatientLName = 'Winsor';
SELECT *
FROM Patient
ORDER BY Gender;

UPDATE Appointment
SET ApptStatus = 'Complete'
WHERE ApptStatus = 'Scheduled';
SELECT *
FROM Appointment
ORDER BY ApptStatus;

INSERT INTO Diagnosis (AppointmentID, ConditionID, Diagnosis)
VALUES ('1', 'C01', 'Diagnosis for Appointment 1');
INSERT INTO Diagnosis (AppointmentID, ConditionID, Diagnosis)
VALUES ('2', 'C02', 'Diagnosis for Appointment 2');
SELECT *
FROM Diagnosis;

UPDATE Appointment
SET ApptStatus = 'Scheduled', ApptDate = '2024-07-15', StartTime = '09:00', Duration = '30'
WHERE ApptStatus != 'Complete';
SELECT *
FROM Appointment
ORDER BY ApptStatus;


