-- Disaster Summary Report
SELECT D.Disaster_Type, D.Location, COUNT(V.Victim_ID) AS Victim_Count, SUM(RCI.Quantity) AS Relief_Allocated
FROM Disasters D
LEFT JOIN Victims V ON D.Disaster_ID = V.Disaster_ID
LEFT JOIN Relief_Center_Items RCI ON D.Location = (SELECT Location FROM Relief_Centers WHERE Center_ID = RCI.Center_ID)
GROUP BY D.Disaster_Type, D.Location;

--Donation Report
SELECT Donor_Name, Donation_Type, SUM(Amount) AS Total_Amount, COUNT(*) AS Donation_Count
FROM Donations
JOIN Donors ON Donations.Donor_ID = Donors.Donor_ID
GROUP BY Donor_Name, Donation_Type;

--Volunteer Allocation Report
SELECT V.Name AS Volunteer_Name, O.Name AS Organization, V.Role, COUNT(*) AS Tasks_Completed
FROM Volunteers V
JOIN Organizations O ON V.Organization_ID = O.Organization_ID
JOIN Volunteer_Tasks VT ON V.Volunteer_ID = VT.Volunteer_ID
GROUP BY V.Name, O.Name, V.Role;

