-- Populating Disasters Table
INSERT INTO Disasters (Disaster_ID, Disaster_Type, Location, Severity, Start_Date, End_Date, Status)
VALUES 
(1, 'Earthquake', 'Nairobi', 'Severe', '2024-10-10', NULL, 'Ongoing'),
(2, 'Flood', 'Kisumu', 'Moderate', '2024-09-15', '2024-10-05', 'Resolved'),
(3, 'Wildfire', 'Nyeri', 'Severe', '2024-08-01', '2024-08-15', 'Resolved');

-- Populating Victims Table
INSERT INTO Victims (Victim_ID, Name, Age, Gender, Contact, Address, Affected_Date, Disaster_ID)
VALUES
(1, 'Jane Doe', 35, 'Female', '123456789', 'Nairobi', '2024-10-10', 1),
(2, 'John Smith', 40, 'Male', '987654321', 'Kisumu', '2024-09-15', 2),
(3, 'Emily Davis', 29, 'Female', '555123456', 'Nyeri', '2024-08-01', 3);

-- Populating Relief_Items Table
INSERT INTO Relief_Items (Item_ID, Item_Name, Item_Type, Quantity)
VALUES
(1, 'Tents', 'Shelter', 200),
(2, 'Blankets', 'Clothing', 500),
(3, 'Water Bottles', 'Food & Drink', 1000),
(4, 'First Aid Kits', 'Medical', 150);

-- Populating Relief_Centers Table
INSERT INTO Relief_Centers (Center_ID, Center_Name, Location, Capacity)
VALUES
(1, 'Nairobi Relief Center', 'Nairobi', 1000),
(2, 'Kisumu Relief Hub', 'Kisumu', 700),
(3, 'Nyeri Emergency Camp', 'Nyeri', 500);

-- Populating Relief_Center_Items Table
INSERT INTO Relief_Center_Items (Center_ID, Item_ID, Quantity)
VALUES
(1, 1, 100), -- Nairobi Relief Center has 100 Tents
(1, 3, 500), -- Nairobi Relief Center has 500 Water Bottles
(2, 2, 200), -- Kisumu Relief Hub has 200 Blankets
(3, 4, 50);  -- Nyeri Emergency Camp has 50 First Aid Kits

-- Populating Donors Table
INSERT INTO Donors (Donor_ID, Donor_Name, Contact, Donation_Type)
VALUES
(1, 'Red Cross', 'contact@redcross.org', 'Financial'),
(2, 'Local NGO', 'contact@localngo.org', 'Relief Items'),
(3, 'John Doe', 'johndoe@example.com', 'Volunteer Service');

-- Populating Donations Table
INSERT INTO Donations (Donation_ID, Donor_ID, Item_ID, Quantity, Donation_Date)
VALUES
(1, 1, 1, 50, '2024-10-12'), -- 50 Tents donated by Red Cross
(2, 2, 3, 300, '2024-09-20'), -- 300 Water Bottles donated by Local NGO
(3, 1, 4, 20, '2024-08-10');  -- 20 First Aid Kits donated by Red Cross

-- Populating Volunteers Table
INSERT INTO Volunteers (Volunteer_ID, Name, Role, Contact, Availability_Status, Organization_ID)
VALUES
(1, 'Alice Green', 'Field Worker', 'alice@example.com', 'Available', 1),
(2, 'Bob White', 'Logistics', 'bob@example.com', 'Unavailable', 2),
(3, 'Charlie Brown', 'Medical Assistant', 'charlie@example.com', 'Available', 3);

-- Populating Organizations Table
INSERT INTO Organizations (Organization_ID, Name, Type, Contact_Info)
VALUES
(1, 'World Health Organization', 'Medical', 'info@who.org'),
(2, 'UNICEF', 'Child Support', 'contact@unicef.org'),
(3, 'Red Cross Society', 'Relief Organization', 'support@redcross.org');
