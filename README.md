Welcome to my dbt project!

The idea of the project is to demonstrate my ability to work on ELT projects on an end to end capacity; From extraction through modelling to visualisation:

- Here normalized start up investment data is downlowded from kaggle via https://www.kaggle.com/datasets/justinas/startup-investments?select=people.csv
- The data is stored in an S3 bucket after  user, roles have been created and necessary permissions set up
- Tables with field names and data types will be created through ddl sql queries on snowflake
- A snowpipe pipeline is set up in snowflake and automated via sqs messaging service 
- This sqs messaging service's linked to the S3 bucket and triggers the snowpipe pipeline to extract and load data to snowflake whenever a new file will be dumped into the S3 bucket
- conceptual, logical and physical models are designed utilizing a hybrid combination of Kimball and One Big Table methods
- The data architecture contains three layers; staging layer, warehouse layer, Analytics layer(OBT)
- Physical implementation of different layers will be in dbt
- dbt files are created and version control is established 
- The different layers are created, and generic test like unique and not_nulls are performed on the models
- Single tests to assert positive outcomes for certain values are also performed
- Model is built
- OBTs are visualised on Tableau

### Architecture Design

Below is the Architecture diagram:

![flow](https://github.com/leviizu/ELT-project-S3-Snowpipe-SQS-Snowflake-dbt-Tableau/assets/96123459/215adbec-8168-4ab6-bb27-5fe4edf058a6)


 
### Conceptual Model
Below is the Conceptual model diagram:

![conceptual](https://github.com/leviizu/ELT-project-S3-Snowpipe-SQS-Snowflake-dbt-Tableau/assets/96123459/09e1d032-f105-4633-b06e-502f5026d9f2)



 
### Logical Model
Below is the logical diagram model:

![logcal](https://github.com/leviizu/ELT-project-S3-Snowpipe-SQS-Snowflake-dbt-Tableau/assets/96123459/e89390d7-e3f9-4eb1-8b94-c722e05ded24)



 
### Physical Model
Below is the physical model diagram:

![physical](https://github.com/leviizu/ELT-project-S3-Snowpipe-SQS-Snowflake-dbt-Tableau/assets/96123459/ca3e75b9-25b9-4675-a815-97173a616d97)

### Tableau Workbook: https://public.tableau.com/app/profile/levy.shemtov/viz/Startup_df/Dashboard1

<img width="1052" alt="Screenshot 2023-08-28 at 9 40 52" src="https://github.com/leviizu/ELT-project-S3-Snowpipe-SQS-Snowflake-dbt-Tableau/assets/96123459/f29f40a9-02d9-4b00-846e-2d882f362c57">


### Using the starter project

Create user with programmatic access
Attach AWS S3 full access policy

Create a new role under another aws account
Activate ‘third party access and assign external id
Assign AWS S3 full access policy


Try running the following commands:
- dbt run
- dbt test


Built an SQS automated snowpipe pipeline that extracts and loads data from S3 to snowflake
Designed and built a hybrid(Kimball+OBT) data model
Transformed already loaded data using dbt
OBT visualised on Tableau


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
