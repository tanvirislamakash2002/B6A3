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
(https://lucid.app/lucidchart/ece5505f-394f-4a4f-9d0c-258bdedd6480/edit?viewport_loc=-441%2C527%2C1542%2C707%2C0_0&invitationId=inv_10236520-df49-4f7d-8999-8878b232b8f5)

---

## SQL Queries

All SQL queries are stored in the `queries.sql` file.

### Query 1 – INNER JOIN
Retrieve booking information along with customer name and vehicle name.

```sql
select
  booking_id,
  u.name as customer_name,
  v.name as vehicle_name,
  start_date,
  end_date,
  b.status
from
  bookings as b
  inner join users as u on b.user_id = u.user_id
  inner join vehicles as v on b.vehicle_id = v.vehicle_id
```

---

### Query 2 – NOT EXISTS
Find all vehicles that have never been booked.

```sql
select
  v.vehicle_id,
  v.name as name,
  type,
  model,
  registration_number,
  rental_price,
  v.status
from
  vehicles as v
  where 
  not exists (
    select 1
    from bookings b
    where b.vehicle_id = v.vehicle_id
  );
```

---

### Query 3 – WHERE Clause
Retrieve all available vehicles of a specific type (Car).

```sql
select
  *
from
  vehicles
where
  type = 'car' and status = 'available'
```

---

### Query 4 – GROUP BY and HAVING
Find the total number of bookings for each vehicle and display only vehicles with more than 2 bookings.

```sql
select
  v.name as vehicle_name,
  count(b.vehicle_id) as total_bookings
from
  bookings as b
  join vehicles as v on b.vehicle_id = v.vehicle_id
group by
  b.vehicle_id,
  v.name
having
  count(b.vehicle_id) > 2
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
