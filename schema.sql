-- 1. Disasters Table
CREATE TABLE Disasters (
    Disaster_ID INT PRIMARY KEY,
    Disaster_Type VARCHAR(100) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Severity VARCHAR(50),
    Start_Date DATE NOT NULL,
    End_Date DATE,
    Status VARCHAR(50)
);

-- 2. Victims Table
CREATE TABLE Victims (
    Victim_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Contact VARCHAR(50),
    Address VARCHAR(255),
    Affected_Date DATE,
    Disaster_ID INT,
    FOREIGN KEY (Disaster_ID) REFERENCES Disasters(Disaster_ID)
);

-- 3. Relief Items Table
CREATE TABLE Relief_Items (
    Item_ID INT PRIMARY KEY,
    Item_Name VARCHAR(100) NOT NULL,
    Item_Type VARCHAR(50),
    Quantity INT NOT NULL
);

-- 4. Relief Centers Table
CREATE TABLE Relief_Centers (
    Center_ID INT PRIMARY KEY,
    Center_Name VARCHAR(100) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Capacity INT
);

-- 5. Relief Center Items (Junction Table for Many-to-Many Relationship)
CREATE TABLE Relief_Center_Items (
    Center_ID INT,
    Item_ID INT,
    Quantity INT,
    PRIMARY KEY (Center_ID, Item_ID),
    FOREIGN KEY (Center_ID) REFERENCES Relief_Centers(Center_ID),
    FOREIGN KEY (Item_ID) REFERENCES Relief_Items(Item_ID)
);

-- 6. Volunteers Table
CREATE TABLE Volunteers (
    Volunteer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Contact VARCHAR(50),
    Availability_Status VARCHAR(20),
    Organization_ID INT,
    FOREIGN KEY (Organization_ID) REFERENCES Organizations(Organization_ID)
);

-- 7. Organizations Table
CREATE TABLE Organizations (
    Organization_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Type VARCHAR(50),
    Contact_Info VARCHAR(100)
);

-- 8. Donations Table
CREATE TABLE Donations (
    Donation_ID INT PRIMARY KEY,
    Donor_ID INT,
    Item_ID INT,
    Quantity INT NOT NULL,
    Donation_Date DATE,
    FOREIGN KEY (Donor_ID) REFERENCES Donors(Donor_ID),
    FOREIGN KEY (Item_ID) REFERENCES Relief_Items(Item_ID)
);

-- 9. Donors Table
CREATE TABLE Donors (
    Donor_ID INT PRIMARY KEY,
    Donor_Name VARCHAR(100) NOT NULL,
    Contact VARCHAR(50),
    Donation_Type VARCHAR(50)
);
