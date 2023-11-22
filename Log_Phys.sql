CREATE TABLE admin_staff (
);


CREATE TABLE adress (
);


CREATE TABLE instruments (
 instrument_id CHAR(10) NOT NULL,
 availible BIT(1) NOT NULL
);

ALTER TABLE instruments ADD CONSTRAINT PK_instruments PRIMARY KEY (instrument_id);


CREATE TABLE person (
 id CHAR(10) NOT NULL,
 SSN VARCHAR(12) NOT NULL,
 contact_details CHAR(50) NOT NULL,
 contact_person VARCHAR(10) NOT NULL,
 name VARCHAR(50) NOT NULL,
 adress CHAR(50) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE Pricing (
 sum INT
);


CREATE TABLE pricing/salary_scheme (
 no_change CHAR(10) NOT NULL,
 date_of_effect DATE NOT NULL,
 price_group INT NOT NULL,
 price_ensemble INT NOT NULL,
 price_lesson INT NOT NULL,
 salary_ensemble INT NOT NULL,
 salary_lesson INT NOT NULL,
 salary_group INT
);

ALTER TABLE pricing/salary_scheme ADD CONSTRAINT PK_pricing/salary_scheme PRIMARY KEY (no_change);


CREATE TABLE salary (
);


CREATE TABLE student (
 student_id CHAR(10) NOT NULL,
 id CHAR(10) NOT NULL,
 cost INT
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE instructor (
 instructor_id VARCHAR(50) NOT NULL,
 id CHAR(10) NOT NULL,
 salary INT
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE rented_instruments (
 rental_id CHAR(10) NOT NULL CHAR(10) NOT NULL,
 instrument_id CHAR(10) NOT NULL CHAR(10) NOT NULL,
 student_id CHAR(10) NOT NULL CHAR(10) NOT NULL,
 return_date DATE NOT NULL DATE NOT NULL,
 cost INT NOT NULL
);

ALTER TABLE rented_instruments ADD CONSTRAINT PK_rented_instruments PRIMARY KEY (rental_id CHAR(10) NOT NULL);


CREATE TABLE schedule (
 schedule_id CHAR(10) NOT NULL CHAR(10) NOT NULL,
 instructor_id VARCHAR(50) NOT NULL,
 open_timeslot TIME(10)
);

ALTER TABLE schedule ADD CONSTRAINT PK_schedule PRIMARY KEY (schedule_id CHAR(10) NOT NULL);


CREATE TABLE siblings (
 student_id CHAR(10) NOT NULL,
 sibling_id CHAR(10)
);

ALTER TABLE siblings ADD CONSTRAINT PK_siblings PRIMARY KEY (student_id);


CREATE TABLE bookings (
 booking_id CHAR(10) NOT NULL,
 student_id CHAR(10) NOT NULL,
 instructor_id VARCHAR(50) NOT NULL,
 date DATE NOT NULL
);

ALTER TABLE bookings ADD CONSTRAINT PK_bookings PRIMARY KEY (booking_id);


CREATE TABLE ensemble (
 booking_id CHAR(10) NOT NULL,
 time_slot TIMESTAMP(10) NOT NULL,
 level CHAR(1) NOT NULL,
 genre VARCHAR(50) NOT NULL,
 minimum_students INT NOT NULL,
 no_change CHAR(10) NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (booking_id);


CREATE TABLE group_lesson (
 booking_id CHAR(10) NOT NULL,
 minimum_students INT NOT NULL,
 time_slot TIMESTAMP(10) NOT NULL,
 instrument CHAR(50) NOT NULL,
 level VARCHAR(1) NOT NULL,
 no_students INT NOT NULL,
 no_change CHAR(10) NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (booking_id);


CREATE TABLE lesson (
 booking_id CHAR(10) NOT NULL,
 level VARCHAR(1) NOT NULL,
 instrument CHAR(50) NOT NULL,
 no_change CHAR(10) NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (booking_id);


CREATE TABLE billing (
 billing_id CHAR(10) NOT NULL,
 student_id CHAR(10) NOT NULL,
 booking_id CHAR(10) NOT NULL
);

ALTER TABLE billing ADD CONSTRAINT PK_billing PRIMARY KEY (billing_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (id) REFERENCES person (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (id) REFERENCES person (id);


ALTER TABLE rented_instruments ADD CONSTRAINT FK_rented_instruments_0 FOREIGN KEY (instrument_id CHAR(10) NOT NULL) REFERENCES instruments (instrument_id);
ALTER TABLE rented_instruments ADD CONSTRAINT FK_rented_instruments_1 FOREIGN KEY (student_id CHAR(10) NOT NULL) REFERENCES student (student_id);


ALTER TABLE schedule ADD CONSTRAINT FK_schedule_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE siblings ADD CONSTRAINT FK_siblings_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE bookings ADD CONSTRAINT FK_bookings_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE bookings ADD CONSTRAINT FK_bookings_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (booking_id) REFERENCES bookings (booking_id);
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (no_change) REFERENCES pricing/salary_scheme (no_change);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (booking_id) REFERENCES bookings (booking_id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (no_change) REFERENCES pricing/salary_scheme (no_change);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (booking_id) REFERENCES bookings (booking_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (no_change) REFERENCES pricing/salary_scheme (no_change);


ALTER TABLE billing ADD CONSTRAINT FK_billing_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE billing ADD CONSTRAINT FK_billing_1 FOREIGN KEY (booking_id) REFERENCES bookings (booking_id);

