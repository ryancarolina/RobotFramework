*** Settings ***
Suite Setup     Connect To Database  pymysql  ${DB_NAME}  ${DB_USER}  ${DB_PASS}  ${DB_HOST}  ${DB_PORT}
Suite Teardown  Disconnect From Database
Library         DatabaseLibrary
Library         OperatingSystem

*** Variables ***
${DB_NAME}  OADCGS-Test
${DB_USER}  root
${DB_PASS}  root
${DB_HOST}  127.0.0.1
${DB_PORT}  3306

*** Test Cases ***
# Once the person table is created, comment out the "Connect to db and create table" block.
Connect to db and create table
  [Documentation]  Connect to the local mysql db on port 3306 and create a table
  ${output}=  Execute SQL String  Create table person(id integer,first_name varchar(20),last_name varchar(20));
  log to console  ${output}
  should be equal as strings  ${output}  None

# CREATE
Insert data into new table
  [Documentation]  Insert a new person into the person table
  ${output}=  Execute SQL String  Insert into person values(102, "Luke", "Skywalker");
  log to console  ${output}
  should be equal as strings  ${output}  None

# CREATE
Insert data into new table
  [Documentation]  Insert a new person into the person table
  ${output}=  Execute SQL String  Insert into person values(102, "C3PO", "Droid");
  log to console  ${output}
  should be equal as strings  ${output}  None

# UPDATE
*** Test Cases ***
Assert record is updated
  [Documentation]  Assert the record is updated
  ${output}=  Execute SQL String  UPDATE person SET first_name="BB-8" WHERE id=102;
  log to console  ${output}
  should be equal as strings  ${output}  None

# READ
Assert records are read
  [Documentation]  Assert records can be retrieved from the person table
  ${queryResult}=  query  SELECT * FROM person;
  log to console  ${queryResult}

# DELETE
Assert record is deleted
  [Documentation]  Assert record can be deleted from the person table
  ${output}=  Execute SQL String  DELETE FROM person WHERE id="102";
  log to console  ${output}
  should be equal as strings  ${output}  None

Assert data in person table
  [Documentation]  Assert Luke is within the person table
  check if exists in database  SELECT id FROM person WHERE first_name="Luke";

Assert data not in person table
  [Documentation]  Assert Han is not within the person table
  check if not exists in database  SELECT id FROM person WHERE first_name="Han";

Assert table exists in database
  [Documentation]  Assert the person table exists in OADCGS-Test db
  table must exist  person

Assert row count is equal to a value
  [Documentation]  Assert row count is equal to 1
  row count is equal to x  SELECT * FROM person WHERE first_name="Luke";  1

*** Keywords ***
