Welcome to my dbt project!

The idea of the project is to demonstrate my ability to work on ELT projects on an end to end capacity; From extraction through modelling to visualisation:

- Here normalized start up investment data is downlowded from kaggle via https://www.kaggle.com/datasets/justinas/startup-investments?select=people.csv
- The data is stored in an S3 bucket, user, roles are created and necessary permissions are set 
- A snowpipe pipeline is set up and automated via sqs messaging service 
- This sqs messaging service's linked to the S3 bucket and triggers the snowpipe pipeline to extract and load data to snowflake whenever a new file will be dumped into the S3 bucket



#### User
AWS user with programmatic access is created with attached AWS S3 full access policy

#### Role
A new role is created under `another aws account` with third party access activated and external id along side AWS S3 full access policy assigned

#### Dataset 
normalized dataset are downloaded from Kaggle and uploaded into S3 bucket

#### Extract and load 
Snowpipe is set up to extract and load files from S3 to Snowflake

#### Messaging
SQS service is set up and tested at the bucket level to alert snowpipe whenever there is a new file demped into the bucket

### Architecture Design

Below is the Architecture diagram:

![flow](https://github.com/leviizu/ELT-project-S3-Snowpipe-SQS-Snowflake-dbt-Tableau/assets/96123459/215adbec-8168-4ab6-bb27-5fe4edf058a6)


 
### Conceptual Model
Below is the Conceptual diagram:

![conceptual](https://github.com/leviizu/ELT-project-S3-Snowpipe-SQS-Snowflake-dbt-Tableau/assets/96123459/09e1d032-f105-4633-b06e-502f5026d9f2)



 
### Logical Model
Below is the Conceptual diagram:

![logcal](https://github.com/leviizu/ELT-project-S3-Snowpipe-SQS-Snowflake-dbt-Tableau/assets/96123459/e89390d7-e3f9-4eb1-8b94-c722e05ded24)



 
### Physical Model
Below is the Conceptual diagram:

![physical](https://github.com/leviizu/ELT-project-S3-Snowpipe-SQS-Snowflake-dbt-Tableau/assets/96123459/ca3e75b9-25b9-4675-a815-97173a616d97)


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
