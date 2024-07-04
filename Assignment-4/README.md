Instructions for the setup of the assignments using docker is in the link below:
<a href="https://github.com/shresritik/DB-Assignment">https://github.com/shresritik/DB-Assignment</a>

\_Note:
In `views_ct_temp.sql`
Without docker: copy the absolute path of the `Salary Prediction of Data Professions.csv` to import the csv file in `Professor` table
With docker:

```bash
docker cp Assignment-4/Salary\ Prediction\ of\ Data\ Professions.csv postgres_2:/
```

copy csv files in the table

```sql
copy Profession(firstName,lastName,sex,doj,currentDate,designation,age,salary,unit,leavesUsed,leavesRemaining,ratings,pastExp)
from '/Salary Prediction of Data Professions.csv' DELIMITER ',' CSV header;
```

\_
