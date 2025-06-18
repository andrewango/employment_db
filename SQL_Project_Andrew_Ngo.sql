CREATE TABLE region (
    region_id      VARCHAR2(38) NOT NULL,
    region_name    VARCHAR2(25) NOT NULL,
    region_crtd_id VARCHAR2(40) NOT NULL,
    region_crtd_dt DATE NOT NULL,
    region_updt_id VARCHAR2(40) NOT NULL,
    region_updt_dt DATE NOT NULL,
    CONSTRAINT region_pk PRIMARY KEY ( region_id ) ENABLE
);

ALTER TABLE region ADD CONSTRAINT region_uk1 UNIQUE ( region_name ) ENABLE;

CREATE TABLE job (
    job_id      VARCHAR2(38) NOT NULL,
    job_title   VARCHAR2(60) NOT NULL,
    min_salary  NUMBER(8),
    max_salary  NUMBER(8),
    job_crtd_id VARCHAR2(40) NOT NULL,
    job_crtd_dt DATE NOT NULL,
    job_updt_id VARCHAR2(40) NOT NULL,
    job_updt_dt DATE NOT NULL,
    CONSTRAINT job_pk PRIMARY KEY ( job_id ) ENABLE
);

CREATE TABLE email (
    email_id         VARCHAR2(38) NOT NULL,
    email_verify_ind NUMBER(1) NOT NULL,
    email_adrs_txt   VARCHAR2(200) NOT NULL,
    email_crtd_id    VARCHAR2(40) NOT NULL,
    email_crtd_dt    DATE NOT NULL,
    email_updt_id    VARCHAR2(40) NOT NULL,
    email_updt_dt    DATE NOT NULL,
    CONSTRAINT email_pk PRIMARY KEY ( email_id ) ENABLE
);

CREATE TABLE employee (
    employee_id         VARCHAR2(38) NOT NULL,
    employee_first_name VARCHAR2(20),
    employee_last_name  VARCHAR2(30) NOT NULL,
    employee_crtd_id    VARCHAR2(40) NOT NULL,
    employee_crtd_dt    DATE NOT NULL,
    employee_updt_id    VARCHAR2(40) NOT NULL,
    employee_updt_dt    DATE NOT NULL,
    CONSTRAINT employee_pk PRIMARY KEY ( employee_id ) ENABLE
);

CREATE TABLE department (
    department_id      VARCHAR2(38) NOT NULL,
    department_name    VARCHAR2(40) NOT NULL,
    department_crtd_id VARCHAR2(40) NOT NULL,
    department_crtd_dt DATE NOT NULL,
    department_updt_id VARCHAR2(40) NOT NULL,
    department_updt_dt DATE NOT NULL,
    CONSTRAINT department_pk PRIMARY KEY ( department_id ) ENABLE
);

ALTER TABLE department ADD CONSTRAINT department_uk1 UNIQUE ( department_name ) ENABLE;

CREATE TABLE country (
    country_id        VARCHAR2(38) NOT NULL,
    country_name      VARCHAR2(100) NOT NULL,
    country_region_id VARCHAR2(38) NOT NULL,
    country_crtd_id   VARCHAR2(40) NOT NULL,
    country_crtd_dt   DATE NOT NULL,
    country_updt_id   VARCHAR2(40) NOT NULL,
    country_updt_dt   DATE NOT NULL,
    CONSTRAINT country_pk PRIMARY KEY ( country_id ) ENABLE
);

ALTER TABLE country ADD CONSTRAINT country_uk1 UNIQUE ( country_name ) ENABLE;

ALTER TABLE country
    ADD CONSTRAINT country_fk1 FOREIGN KEY ( country_region_id )
        REFERENCES region ( region_id )
    ENABLE;

CREATE TABLE address (
    address_id               VARCHAR2(38) NOT NULL,
    address_street_address_1 VARCHAR2(100) NOT NULL,
    address_street_address_2 VARCHAR2(100),
    address_street_address_3 VARCHAR2(100),
    address_postal_code      VARCHAR2(12) NOT NULL,
    address_city             VARCHAR2(30) NOT NULL,
    address_country_id       VARCHAR2(38) NOT NULL,
    address_crtd_id          VARCHAR2(40) NOT NULL,
    address_crtd_dt          DATE NOT NULL,
    address_updt_id          VARCHAR2(40) NOT NULL,
    address_updt_dt          DATE NOT NULL,
    CONSTRAINT address_pk PRIMARY KEY ( address_id ) ENABLE
);

ALTER TABLE address
    ADD CONSTRAINT address_fk1 FOREIGN KEY ( address_country_id )
        REFERENCES country ( country_id )
    ENABLE;

CREATE TABLE employee_address (
    employee_address_id          VARCHAR2(38) NOT NULL,
    employee_address_employee_id VARCHAR2(38) NOT NULL,
    employee_address_address_id  VARCHAR2(38) NOT NULL,
    employee_address_actv_ind    NUMBER(1) NOT NULL,
    employee_address_dflt_ind    NUMBER(1) NOT NULL,
    employee_address_crtd_id     VARCHAR2(40) NOT NULL,
    employee_address_crtd_dt     DATE NOT NULL,
    employee_address_updt_id     VARCHAR2(40) NOT NULL,
    employee_address_updt_dt     DATE NOT NULL,
    CONSTRAINT employee_address_pk PRIMARY KEY ( employee_address_id ) ENABLE
);

ALTER TABLE employee_address
    ADD CONSTRAINT employee_address_fk1 FOREIGN KEY ( employee_address_address_id )
        REFERENCES address ( address_id )
    ENABLE;

ALTER TABLE employee_address
    ADD CONSTRAINT employee_address_fk2 FOREIGN KEY ( employee_address_employee_id )
        REFERENCES employee ( employee_id )
    ENABLE;

CREATE TABLE phone (
    phone_id      VARCHAR2(38) NOT NULL,
    phone_nbr     VARCHAR2(20) NOT NULL,
    phone_crtd_id VARCHAR2(40) NOT NULL,
    phone_crtd_dt DATE NOT NULL,
    phone_updt_id VARCHAR2(40) NOT NULL,
    phone_updt_dt DATE NOT NULL,
    CONSTRAINT phone_pk PRIMARY KEY ( phone_id ) ENABLE
);

CREATE TABLE employee_phone (
    employee_phone_id          VARCHAR2(38) NOT NULL,
    employee_phone_employee_id VARCHAR2(38) NOT NULL,
    employee_phone_phone_id    VARCHAR2(38) NOT NULL,
    employee_phone_actv_ind    NUMBER(1) NOT NULL,
    employee_phone_dflt_ind    NUMBER(1) NOT NULL,
    employee_phone_crtd_id     VARCHAR2(40) NOT NULL,
    employee_phone_crtd_dt     DATE NOT NULL,
    employee_phone_updt_id     VARCHAR2(40) NOT NULL,
    employee_phone_updt_dt     DATE NOT NULL,
    CONSTRAINT employee_phone_pk PRIMARY KEY ( employee_phone_id ) ENABLE
);

ALTER TABLE employee_phone
    ADD CONSTRAINT employee_phone_fk1 FOREIGN KEY ( employee_phone_phone_id )
        REFERENCES phone ( phone_id )
    ENABLE;

ALTER TABLE employee_phone
    ADD CONSTRAINT employee_phone_fk2 FOREIGN KEY ( employee_phone_employee_id )
        REFERENCES employee ( employee_id )
    ENABLE;

CREATE TABLE department_mgr (
    department_mgr_id            VARCHAR2(38) NOT NULL,
    department_mgr_department_id VARCHAR2(38) NOT NULL,
    department_mgr_employee_id   VARCHAR2(38) NOT NULL,
    department_mgr_start_date    DATE NOT NULL,
    department_mgr_end_date      DATE NOT NULL,
    department_mgr_crtd_id       VARCHAR2(40) NOT NULL,
    department_mgr_crtd_dt       DATE NOT NULL,
    department_mgr_updt_id       VARCHAR2(40) NOT NULL,
    department_mgr_updt_dt       DATE NOT NULL,
    CONSTRAINT department_mgr_pk PRIMARY KEY ( department_mgr_id ) ENABLE
);

ALTER TABLE department_mgr
    ADD CONSTRAINT department_mgr_fk1 FOREIGN KEY ( department_mgr_department_id )
        REFERENCES department ( department_id )
    ENABLE;

ALTER TABLE department_mgr
    ADD CONSTRAINT department_mgr_fk2 FOREIGN KEY ( department_mgr_employee_id )
        REFERENCES employee ( employee_id )
    ENABLE;

CREATE TABLE employee_email (
    employee_email_id          VARCHAR2(38) NOT NULL,
    employee_email_employee_id VARCHAR2(38) NOT NULL,
    employee_email_email_id    VARCHAR2(38) NOT NULL,
    employee_email_actv_ind    NUMBER(1) NOT NULL,
    employee_email_dflt_ind    NUMBER(1) NOT NULL,
    employee_email_crtd_id     VARCHAR2(40) NOT NULL,
    employee_email_crtd_dt     DATE NOT NULL,
    employee_email_updt_id     VARCHAR2(40) NOT NULL,
    employee_email_updt_dt     DATE NOT NULL,
    CONSTRAINT employee_email_pk PRIMARY KEY ( employee_email_id ) ENABLE
);

ALTER TABLE employee_email
    ADD CONSTRAINT employee_email_fk1 FOREIGN KEY ( employee_email_email_id )
        REFERENCES email ( email_id )
    ENABLE;

ALTER TABLE employee_email
    ADD CONSTRAINT employee_email_fk2 FOREIGN KEY ( employee_email_employee_id )
        REFERENCES employee ( employee_id )
    ENABLE;

CREATE TABLE employment (
    employment_id            VARCHAR2(38) NOT NULL,
    employment_employee_id   VARCHAR2(38) NOT NULL,
    employment_job_id        VARCHAR2(38) NOT NULL,
    employment_department_id VARCHAR2(38) NOT NULL,
    employment_crtd_id       VARCHAR2(40) NOT NULL,
    employment_crtd_dt       DATE NOT NULL,
    employment_updt_id       VARCHAR2(40) NOT NULL,
    employment_updt_dt       DATE NOT NULL,
    CONSTRAINT employment_pk PRIMARY KEY ( employment_id ) ENABLE
);

ALTER TABLE employment
    ADD CONSTRAINT employment_fk1 FOREIGN KEY ( employment_employee_id )
        REFERENCES employee ( employee_id )
    ENABLE;

ALTER TABLE employment
    ADD CONSTRAINT employment_fk2 FOREIGN KEY ( employment_job_id )
        REFERENCES job ( job_id )
    ENABLE;

ALTER TABLE employment
    ADD CONSTRAINT employment_fk3 FOREIGN KEY ( employment_department_id )
        REFERENCES department ( department_id )
    ENABLE;

CREATE TABLE employment_pay (
    employment_pay_id             VARCHAR2(38) NOT NULL,
    employment_pay_employment_id  VARCHAR2(38) NOT NULL,
    employment_pay_eff_date       DATE NOT NULL,
    employment_pay_salary         NUMBER(7, 2),
    employment_pay_commission_pct NUMBER(5, 4),
    employment_pay_crtd_id        VARCHAR2(40) NOT NULL,
    employment_pay_crtd_dt        DATE NOT NULL,
    employment_pay_updt_id        VARCHAR2(40) NOT NULL,
    employment_pay_updt_dt        DATE NOT NULL,
    CONSTRAINT employment_pay_pk PRIMARY KEY ( employment_pay_id ) ENABLE
);

ALTER TABLE employment_pay
    ADD CONSTRAINT employment_pay_fk1 FOREIGN KEY ( employment_pay_employment_id )
        REFERENCES employment ( employment_id )
    ENABLE;

--- PKG_TRIGGERS ---
CREATE OR REPLACE PACKAGE pkg_triggers AS
    PROCEDURE create_triggers_trg01;

    PROCEDURE create_triggers_trg02;

    PROCEDURE create_triggers;

END pkg_triggers;
/

CREATE OR REPLACE PACKAGE BODY pkg_triggers AS

    PROCEDURE create_triggers_trg01 AS
    BEGIN
        FOR tn IN (
            SELECT
                table_name
            FROM
                user_tables
        ) LOOP
            EXECUTE IMMEDIATE '
                CREATE OR REPLACE TRIGGER trg01_'
                              || tn.table_name
                              || ' BEFORE
                INSERT OR UPDATE ON '
                              || tn.table_name
                              || '
                FOR EACH ROW
                BEGIN
                    IF INSERTING THEN
                        IF :new.'
                              || tn.table_name
                              || '_id IS NULL THEN
                            :new.'
                              || tn.table_name
                              || '_id := SYS_GUID();
                        END IF;
                    END IF;
                    IF UPDATING THEN
                        :new.'
                              || tn.table_name
                              || '_id := :old.'
                              || tn.table_name
                              || '_id;
                    END IF;
                END;
            ';
        END LOOP;
    END create_triggers_trg01;

    PROCEDURE create_triggers_trg02 AS
    BEGIN
        FOR tn IN (
            SELECT
                table_name
            FROM
                user_tables
        ) LOOP
            EXECUTE IMMEDIATE '
                CREATE OR REPLACE TRIGGER trg02_'
                              || tn.table_name
                              || ' BEFORE
                INSERT OR UPDATE ON '
                              || tn.table_name
                              || '
                FOR EACH ROW
                BEGIN
                    IF INSERTING THEN
                        :new.'
                              || tn.table_name
                              || '_crtd_id := user;
                        :new.'
                              || tn.table_name
                              || '_crtd_dt := sysdate;
                    END IF;
                    :new.'
                              || tn.table_name
                              || '_updt_id := user;
                    :new.'
                              || tn.table_name
                              || '_updt_dt := sysdate;
                END;
            ';
        END LOOP;
    END create_triggers_trg02;

    PROCEDURE create_triggers AS
    BEGIN
        create_triggers_trg01;
        create_triggers_trg02;
    END create_triggers;

END pkg_triggers;
/
--- CREATE THE TRIGGERS ---
EXEC pkg_triggers.create_triggers;


--- PKG_EMPLOYMENT ---
CREATE OR REPLACE PACKAGE pkg_employment AS
    FUNCTION fn_create_employment (
        employee_id_in             employee.employee_id%TYPE,
        employment_job_id_in       employment.employment_job_id%TYPE,
        department_id_in           department.department_id%TYPE,
        employment_pay_eff_date_in employment_pay.employment_pay_eff_date%TYPE,
        salary_in                  employment_pay.employment_pay_salary%TYPE,
        commission_pct_in          employment_pay.employment_pay_commission_pct%TYPE
    ) RETURN VARCHAR2;

END pkg_employment;
/

CREATE OR REPLACE PACKAGE BODY pkg_employment AS

    ex_invalid_employee_id EXCEPTION;
    ex_invalid_job_id EXCEPTION;
    ex_invalid_department_id EXCEPTION;
    ex_invalid_salary EXCEPTION;
    ex_invalid_eff_date EXCEPTION;

    FUNCTION fn_create_employment (
        employee_id_in             employee.employee_id%TYPE,
        employment_job_id_in       employment.employment_job_id%TYPE,
        department_id_in           department.department_id%TYPE,
        employment_pay_eff_date_in employment_pay.employment_pay_eff_date%TYPE,
        salary_in                  employment_pay.employment_pay_salary%TYPE,
        commission_pct_in          employment_pay.employment_pay_commission_pct%TYPE
    ) RETURN VARCHAR2 AS

        v_cnt          NUMBER(3);
        v_max_eff_date DATE;
        v_min_salary   employment_pay.employment_pay_salary%TYPE;
        v_max_salary   employment_pay.employment_pay_salary%TYPE;
    BEGIN
        -- Check if Employee exists, if not, throw exception
        SELECT
            COUNT(*)
        INTO v_cnt
        FROM
            employee
        WHERE
            employee_id = employee_id_in;

        IF v_cnt = 0 THEN
            RAISE ex_invalid_employee_id;
        END IF;

        -- Check if Job exists, if not, throw exception
        SELECT
            COUNT(*)
        INTO v_cnt
        FROM
            job
        WHERE
            job_id = employment_job_id_in;

        IF v_cnt = 0 THEN
            RAISE ex_invalid_job_id;
        END IF;

        -- Check if Department exists, if not, throw exception
        SELECT
            COUNT(*)
        INTO v_cnt
        FROM
            department
        WHERE
            department_id = department_id_in;

        IF v_cnt = 0 THEN
            RAISE ex_invalid_department_id;
        END IF;

        -- Check if Salary is within Job's salary range, if not, throw exception
        SELECT
            min_salary,
            max_salary
        INTO
            v_min_salary,
            v_max_salary
        FROM
            job
        WHERE
            job_id = employment_job_id_in;

        IF salary_in < v_min_salary OR salary_in > v_max_salary THEN
            RAISE ex_invalid_salary;
        END IF;

        -- Check if Employment record exists
        SELECT
            COUNT(*)
        INTO v_cnt
        FROM
            employment
        WHERE
                employment_employee_id = employee_id_in
            AND employment_job_id = employment_job_id_in;

        IF v_cnt > 0 THEN
            -- Employment record exists
            -- Check if incoming eff_date is after latest employment_pay record
            SELECT
                MAX(employment_pay_eff_date)
            INTO v_max_eff_date
            FROM
                employment_pay
            WHERE
                employment_pay_employment_id = (
                    SELECT
                        employment_id
                    FROM
                        employment
                    WHERE
                            employment_employee_id = employee_id_in
                        AND employment_job_id = employment_job_id_in
                );

            IF employment_pay_eff_date_in <= v_max_eff_date THEN
                RAISE ex_invalid_eff_date;
            END IF;

            -- Insert new Employment_Pay record
            INSERT INTO employment_pay (
                employment_pay_id,
                employment_pay_employment_id,
                employment_pay_eff_date,
                employment_pay_salary,
                employment_pay_commission_pct
            ) VALUES (
                sys_guid(),
                (
                    SELECT
                        employment_id
                    FROM
                        employment
                    WHERE
                            employment_employee_id = employee_id_in
                        AND employment_job_id = employment_job_id_in
                ),
                employment_pay_eff_date_in,
                salary_in,
                commission_pct_in
            );

        ELSE
            -- Employment record does not exist
            -- Insert Employment record
            INSERT INTO employment (
                employment_id,
                employment_employee_id,
                employment_job_id,
                employment_department_id
            ) VALUES (
                sys_guid(),
                employee_id_in,
                employment_job_id_in,
                department_id_in
            );

            -- Insert Employment_Pay record
            INSERT INTO employment_pay (
                employment_pay_id,
                employment_pay_employment_id,
                employment_pay_eff_date,
                employment_pay_salary,
                employment_pay_commission_pct
            ) VALUES (
                sys_guid(),
                (
                    SELECT
                        employment_id
                    FROM
                        employment
                    WHERE
                            employment_employee_id = employee_id_in
                        AND employment_job_id = employment_job_id_in
                ),
                employment_pay_eff_date_in,
                salary_in,
                commission_pct_in
            );

        END IF;

    EXCEPTION
        WHEN ex_invalid_employee_id THEN
            raise_application_error(-20500, 'EmployeeID not found');
        WHEN ex_invalid_job_id THEN
            raise_application_error(-20501, 'JobID not found');
        WHEN ex_invalid_department_id THEN
            raise_application_error(-20502, 'DepartmentID not found');
        WHEN ex_invalid_salary THEN
            raise_application_error(-20503, 'Salary out of range');
        WHEN ex_invalid_eff_date THEN
            raise_application_error(-20504, 'Effective date is invalid');
        WHEN OTHERS THEN
            dbms_output.put_line('Error!');
    END fn_create_employment;

END pkg_employment;
/