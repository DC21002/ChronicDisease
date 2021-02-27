/* Generated Code (IMPORT) */
/* Source File: Lv4_NCI_HINTS_Public.sav */
/* Source Path: /home/u49686621/sasuser.v94 */
/* Code generated on: 2/20/21, 10:12 AM */

%web_drop_table(hints5cycle4);


FILENAME REFFILE '/home/u49686621/sasuser.v94/Lv4_NCI_HINTS_Public.sav';

PROC IMPORT DATAFILE=REFFILE
	DBMS=SAV
	OUT=hints5cycle4;
RUN;

PROC CONTENTS DATA=hints5cycle4; RUN;


%web_open_table(hints5cycle4);



PROC SQL;
	CREATE TABLE HINTS_Recoded AS
    SELECT 	*,
	case 
	when WhenPapTest in (1,2,3,4,5) then "Yes"
	when WhenMammogram in (1,2,3,4,5) then "Yes" 
	when EverTestedColonCa = 1 then "Yes" else "No"
	end as CancerScreened
    FROM hints5cycle4
    ;
QUIT;


PROC SGPLOT DATA = hints5cycle4;
	TITLE "Past Cancer Diagnosis of People with Diabetes of HighBP";
	VBar EverHadCancer / stat=percent;
	where MedConditions_Diabetes =1 or MedConditions_HighBP = 1;
	RUN;
QUIT;
TITLE;

PROC SGPLOT DATA = hints5cycle4;
	TITLE "Past Cancer Diagnosis of People without Diabetes of HighBP";
	VBar EverHadCancer / stat=percent;
	where MedConditions_Diabetes =2 or MedConditions_HighBP = 2;
	RUN;
QUIT;
TITLE;

PROC SGPLOT DATA = hints5cycle4;
	TITLE "Preventing Cancer Not Possible According to People with Diabetes of HighBP";
	VBar PreventNotPossible / stat=percent;
	where MedConditions_Diabetes =1 or MedConditions_HighBP = 1;
	RUN;
QUIT;
TITLE;

PROC SGPLOT DATA = hints5cycle4;
	TITLE "Preventing Cancer Not Possible According to People without Diabetes of HighBP";
	VBar PreventNotPossible / stat=percent;
	where MedConditions_Diabetes =2 or MedConditions_HighBP = 2;
	RUN;
QUIT;
TITLE;


PROC SGPLOT DATA = HINTS_Recoded;
	TITLE "Percent of People with Diabetes of HighBP that were Screened for Cancer";
	VBar CancerScreened / stat=percent;
	where MedConditions_Diabetes =1 or MedConditions_HighBP = 1;
	RUN;
QUIT;
TITLE;

PROC SGPLOT DATA = HINTS_Recoded;
	TITLE "Percent of People without Diabetes of HighBP that were Screened for Cancer";
	VBar CancerScreened / stat=percent;
	where MedConditions_Diabetes =2 or MedConditions_HighBP = 2;
	RUN;
QUIT;
TITLE;

















