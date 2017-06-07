CREATE TABLE member(mno NUMBER PRIMARY KEY,
					grade CHAR DEFAULT 'N',
                    password VARCHAR2(255) NOT NULL,
                    mname VARCHAR2(255) NOT NULL,
                    phone VARCHAR2(255) NOT NULL,
                    email VARCHAR2(255) NOT NULL);



CREATE TABLE noticeBoard(nno NUMBER PRIMARY KEY,
						mno NUMBER REFERENCES member(mno),
                        title VARCHAR2(255) NOT NULL,
                        CONTENTS VARCHAR2(2000),
                        ndate date
                        );

CREATE TABLE upload(uno NUMBER PRIMARY KEY,
					rfilename VARCHAR2(2000),
                    sfilename VARCHAR2(2000),
                    nno NUMBER REFERENCES noticeBoard(nno)
                    );


CREATE TABLE schedule(scode NUMBER PRIMARY KEY,
					  sname VARCHAR2(255) NOT NULL
                      );

CREATE TABLE food(fno NUMBER PRIMARY KEY,
					fname VARCHAR2(255) NOT NULL,
                    image VARCHAR2(2000)
					);

CREATE TABLE anoBoard(ano NUMBER PRIMARY KEY,
					  anopw VARCHAR2(255) NOT NULL,
                      anotitle VARCHAR2(255) NOT NULL,
                      anocontents VARCHAR2(2000),
                      anodate DATE
                      );

CREATE TABLE foodMenu(fmno NUMBER PRIMARY KEY,
					  fmdate DATE NOT NULL,
                      fno NUMBER REFERENCES food(fno),
                      scode NUMBER REFERENCES schedule(scode)
                      );

CREATE TABLE review(rno NUMBER PRIMARY KEY,
					mno NUMBER REFERENCES member(mno),
              		regdate DATE NOT NULL,
                    spoint NUMBER DEFAULT 0,
                    comments VARCHAR2(2000),
                    fmno NUMBER REFERENCES foodMenu(fmno)
                    );


CREATE TABLE psurvey(pno NUMBER PRIMARY KEY,
					mno NUMBER REFERENCES member(mno),
                    fno NUMBER REFERENCES food(fno),
                    etc VARCHAR2(2000)
                    );

CREATE TABLE dsurvey(dno NUMBER PRIMARY KEY,
					mno NUMBER REFERENCES member(mno),
                    scode NUMBER REFERENCES schedule(scode),
                    ddate DATE
                    );

CREATE TABLE alram(pno NUMBER REFERENCES psurvey(pno),
                   mno NUMBER REFERENCES member(mno),
                   fmno NUMBER REFERENCES foodmenu(fmno)
                   );

CREATE OR REPLACE TRIGGER alram_trigger
BEFORE INSERT OR UPDATE
ON alram
FOR EACH ROW
DECLARE
	check_fmno NUMBER; check_pno NUMBER; check_mno NUMBER;
BEGIN
	SELECT f.fmno, p.pno, p.MNO
    INTO check_fmno, check_pno, check_mno
    FROM foodmenu f, psurvey p
    WHERE f.FNO = p.FNO ;

    IF updating THEN
    	UPDATE alram SET pno=check_pno, fmno=check_fmno
        WHERE mno = check_mno;
    END IF;
END;

SELECT * FROM foodmenu;
SELECT * FROM psurvey;

CREATE SEQUENCE dsurvey_no;
CREATE SEQUENCE anoboard_no;
CREATE SEQUENCE food_no;
CREATE SEQUENCE foodmenu_no;
CREATE SEQUENCE noticeboard_no;
CREATE SEQUENCE psurvey_no;
CREATE SEQUENCE review_no;
CREATE SEQUENCE schedule_no;
CREATE SEQUENCE upload_no;



