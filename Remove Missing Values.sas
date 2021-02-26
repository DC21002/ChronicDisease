proc sql;
	drop table WORK.HINTS_Filtered;
	
	create table WORK.HINTS_Filtered as
		select * from WORK.HINTS 
			where OwnAbilityTakeCareHealth in (1:5) and MedConditions_HighBP in (1,2) and MedConditions_Diabetes in (1,2);