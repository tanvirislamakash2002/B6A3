# Vehicle Rental System – Database Design & SQL Queries

## Project Overview
This project is a simplified **Vehicle Rental System database design**. The goal of the project is to demonstrate understanding of **relational database concepts**, **ERD design**, and **SQL query writing**.

The system manages three main entities:

- Users
- Vehicles
- Bookings

It allows customers to rent vehicles while storing booking information in a structured relational database.

This project demonstrates the use of:

- Primary Keys
- Foreign Keys
- Table relationships (One-to-Many and Many-to-One)
- SQL queries using JOIN, EXISTS, WHERE, GROUP BY, and HAVING.

---

## Database Tables

### 1. Users Table
The **Users** table stores information about all users of the system.

Fields:
- user_id (Primary Key)
- name
- email (Unique)
- password
- phone
- role (Admin / Customer)

Rules:
- Each email must be unique.
- A user can create multiple bookings.

---

### 2. Vehicles Table
The **Vehicles** table stores information about vehicles available for rent.

Fields:
- vehicle_id (Primary Key)
- vehicle_name
- type (Car / Bike / Truck)
- model
- registration_number (Unique)
- price_per_day
- availability_status (Available / Rented / Maintenance)

Rules:
- Each vehicle must have a unique registration number.

---

### 3. Bookings Table
The **Bookings** table stores rental booking information.

Fields:
- booking_id (Primary Key)
- user_id (Foreign Key referencing Users)
- vehicle_id (Foreign Key referencing Vehicles)
- start_date
- end_date
- booking_status (Pending / Confirmed / Completed / Cancelled)
- total_cost

Rules:
- Each booking belongs to one user.
- Each booking is associated with one vehicle.

---

## Database Relationships

Users → Bookings  
One user can create multiple bookings. (One-to-Many)

Vehicles → Bookings  
One vehicle can appear in multiple bookings. (One-to-Many)

Bookings → Users  
Each booking belongs to exactly one user. (Many-to-One)

Bookings → Vehicles  
Each booking is linked to exactly one vehicle. (Many-to-One)

---

## ERD Design

The Entity Relationship Diagram (ERD) visually represents the database structure and relationships between tables.

The ERD includes:
- Primary Keys
- Foreign Keys
- Relationship cardinality
- Status fields such as booking status and vehicle availability.

ERD Link:  
(Add your ERD link here)

---

## SQL Queries

All SQL queries are stored in the `queries.sql` file.

### Query 1 – INNER JOIN
Retrieve booking information along with customer name and vehicle name.

```sql
SELECT 
    users.name AS customer_name,
    vehicles.vehicle_name,
    bookings.start_date,
    bookings.end_date
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id
INNER JOIN vehicles ON bookings.vehicle_id = vehicles.vehicle_id;
```

---

### Query 2 – NOT EXISTS
Find all vehicles that have never been booked.

```sql
SELECT *
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.vehicle_id
);
```

---

### Query 3 – WHERE Clause
Retrieve all available vehicles of a specific type (Car).

```sql
SELECT *
FROM vehicles
WHERE type = 'Car'
AND availability_status = 'Available';
```

---

### Query 4 – GROUP BY and HAVING
Find the total number of bookings for each vehicle and display only vehicles with more than 2 bookings.

```sql
SELECT 
    vehicle_id,
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY vehicle_id
HAVING COUNT(*) > 2;
```

---

## Project Files

```
vehicle-rental-system/
│
├── README.md
└── queries.sql
```

---

## Submission Links

GitHub Repository:  
(Add your GitHub repository link)

ERD Link:  
(Add your ERD link)

Viva Video Link:  
(Add your video link)

---

## Academic Integrity

This project was completed as part of an academic assignment. All work submitted must be original. Any form of plagiarism may result in zero marks.