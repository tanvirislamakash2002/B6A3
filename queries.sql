Query 1: JOIN
Retrieve booking information along with:

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

Query 2: EXISTS
Find all vehicles that have never been booked.

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

Query 3: WHERE
Retrieve all available vehicles of a specific type (e.g. cars).

select
  *
from
  vehicles
where
  type = 'car' and status = 'available'

Query 4: GROUP BY and HAVING
Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

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