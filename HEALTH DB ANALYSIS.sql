


CREATE DATABASE HealthcareDB

USE HealthcareDB


USE HealthcareDB;

SELECT COUNT(*) AS patients_count FROM [Patient.csv];
SELECT COUNT(*) AS doctors_count FROM [doctor.csv];
SELECT COUNT(*) AS departments_count FROM [department.csv];
SELECT COUNT(*) AS billing_count FROM [billing.csv];

SELECT * FROM [Patient.csv];
SELECT * FROM [billing.csv];
SELECT * FROM [department.csv];

SELECT department,
COUNT(*) AS TOTAL_PATIENTS
FROM [Patient.csv]
GROUP BY department
ORDER BY TOTAL_PATIENTS DESC;

SELECT disease,
AVG(bill_amount) AS AVG_BILLING_AMOUNT
FROM [Patient.csv]
GROUP BY disease
ORDER BY AVG_BILLING_AMOUNT DESC;


SELECT TOP 5 d.doctor_name,
COUNT(*) AS  NUMBER_OF_PATIENTS
FROM [Patient.csv] p
JOIN [doctor.csv] d ON p.doctor_id = d.doctor_id
GROUP BY d.doctor_name
ORDER BY NUMBER_OF_PATIENTS DESC;

SELECT MONTH(admission_date) AS admission_month,
COUNT(*) AS MONTHLY_ADMISSION
FROM [Patient.csv]
WHERE YEAR(admission_date) = 2024
GROUP BY MONTH(admission_date)
ORDER BY admission_month;


SELECT disease,
ROUND(AVG(DATEDIFF(DAY, admission_date, discharge_date)),2) AS avg_length_of_stay
FROM [Patient.csv]
WHERE  status = 'Discharged'
GROUP BY disease
ORDER BY avg_length_of_stay DESC;


SELECT p.patient_name,p.department,p.bill_amount,b.payment_status
FROM [Patient.csv] p
JOIN [billing.csv] b ON p.patient_id = b.patient_id
WHERE payment_status = 'Pending';

SELECT department_name,
total_beds,
occupied_beds,
ROUND((occupied_beds * 100.0 / total_beds), 2) AS occupancy_rate
FROM [department.csv];


