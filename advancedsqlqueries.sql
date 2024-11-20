-- Total relief items distributed per disaster
SELECT D.Disaster_Type, SUM(RCI.Quantity) AS Total_Distributed
FROM Disasters D
JOIN Relief_Centers RC ON D.Location = RC.Location
JOIN Relief_Center_Items RCI ON RC.Center_ID = RCI.Center_ID
GROUP BY D.Disaster_Type;

-- Number of victims per disaster
SELECT D.Disaster_Type, COUNT(V.Victim_ID) AS Victim_Count
FROM Disasters D
JOIN Victims V ON D.Disaster_ID = V.Disaster_ID
GROUP BY D.Disaster_Type;

-- Rank relief centers by capacity
SELECT Center_Name, Location, Capacity,
       RANK() OVER (ORDER BY Capacity DESC) AS Rank_By_Capacity
FROM Relief_Centers;

-- Cumulative donation amounts by donor
SELECT Donor_Name, SUM(D.Amount) OVER (PARTITION BY Donor_ID) AS Total_Donated
FROM Donations D
JOIN Donors ON D.Donor_ID = Donors.Donor_ID;

DELIMITER //
CREATE PROCEDURE AllocateReliefItems(IN disaster_id INT, IN center_id INT)
BEGIN
    UPDATE Relief_Center_Items
    SET Quantity = Quantity - 100
    WHERE Center_ID = center_id;
    INSERT INTO Relief_Log (Disaster_ID, Center_ID, Allocated_Quantity, Allocation_Date)
    VALUES (disaster_id, center_id, 100, NOW());
END //
DELIMITER ;

--trigger
CREATE TRIGGER VictimUpdateLog
AFTER UPDATE ON Victims
FOR EACH ROW
BEGIN
    INSERT INTO Victim_Log (Victim_ID, Old_Contact, New_Contact, Update_Timestamp)
    VALUES (OLD.Victim_ID, OLD.Contact, NEW.Contact, NOW());
END;

--victim distribution by gender and disaster
SELECT Disaster_Type,
       SUM(CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END) AS Male_Victims,
       SUM(CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END) AS Female_Victims
FROM Victims
JOIN Disasters ON Victims.Disaster_ID = Disasters.Disaster_ID
GROUP BY Disaster_Type;


