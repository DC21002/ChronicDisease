proc freq data = HINTS_FILTERED;
weight PERSON_FINWT0;
tables (MedConditions_Diabetes MedConditions_HighBP)*OwnAbilityTakeCareHealth / chisq;
run;

proc surveyfreq data = HINTS_FILTERED varmethod = jackknife;
weight PERSON_FINWT0;
repweights PERSON_FINWT1-PERSON_FINWT50 / df = 49 jkcoefs = 0.98;
tables (MedConditions_Diabetes MedConditions_HighBP)*OwnAbilityTakeCareHealth / row col wchisq;
run;