-- create integration object for external storage
CREATE
or REPLACE storage integration S3_VC 
type = external_stage storage_provider = S3 
enabled = true 
storage_aws_role_arn = "arn:aws:iam::604725775849:role/snowflake_role" 
storage_allowed_locations =('s3://venturecapital.shemtech/tables')

 -- view integration
DESC integration s3_vc -- create file format

-- create file format
CREATE
or REPLACE FILE FORMAT raw.raw.csv_format 
type = csv field_delimiter = ',' 
skip_header = 1 
null_if = ('NULL', 'null') 
empty_field_as_null = true 

-- Create an external stage pointing to the S3 bucket
CREATE
or REPLACE STAGE raw.raw.ext_stage 
URL = 's3://venturecapital.shemtech/tables/' 
STORAGE_INTEGRATION = S3_VC 
file_format = raw.raw.csv_format 
DESC STAGE ext_stage 

-- Create snowpipes to distribute data to different target tables
--acquisition
CREATE
or REPLACE PIPE raw.raw.mypipe_acquisition auto_ingest = true AS COPY INTO RAW.RAW.acquisition
FROM
    @raw.raw.ext_stage/acquisition on_error = CONTINUE;

 --education
    CREATE
    or REPLACE PIPE raw.raw.mypipe_education auto_ingest = true AS COPY INTO RAW.RAW.education
FROM
    @raw.raw.ext_stage/education on_error = CONTINUE;

--funding_rounds
    CREATE
    or REPLACE PIPE raw.raw.mypipe_funding_rounds auto_ingest = true AS COPY INTO RAW.RAW.funding_rounds
FROM
    @raw.raw.ext_stage/funding_rounds on_error = CONTINUE;

--funds
    CREATE
    or REPLACE PIPE raw.raw.mypipe_funds auto_ingest = true AS COPY INTO RAW.RAW.funds
FROM
    @raw.raw.ext_stage/funds on_error = CONTINUE;

--investments
    CREATE
    or REPLACE PIPE raw.raw.mypipe_investments auto_ingest = true AS COPY INTO RAW.RAW.investments
FROM
    @raw.raw.ext_stage/investments on_error = CONTINUE;

--ipos
    CREATE
    or REPLACE PIPE raw.raw.mypipe_ipos auto_ingest = true AS COPY INTO RAW.RAW.ipos
FROM
    @raw.raw.ext_stage/ipos on_error = CONTINUE;

--milestones
    CREATE
    or REPLACE PIPE raw.raw.mypipe_milestones auto_ingest = true AS COPY INTO RAW.RAW.milestones
FROM
    @raw.raw.ext_stage/milestones on_error = CONTINUE;

--summary
    CREATE
    or REPLACE PIPE raw.raw.mypipe_summary auto_ingest = true AS COPY INTO RAW.RAW.summary
FROM
    @raw.raw.ext_stage/summary on_error = CONTINUE;

--offices
    CREATE
    or REPLACE PIPE raw.raw.mypipe_offices auto_ingest = true AS COPY INTO RAW.RAW.offices
FROM
    @raw.raw.ext_stage/offices on_error = CONTINUE;

--people
    CREATE
    or REPLACE PIPE raw.raw.mypipe_people auto_ingest = true AS COPY INTO RAW.RAW.people
FROM
    @raw.raw.ext_stage/people on_error = CONTINUE;

--relationships
    CREATE
    or REPLACE PIPE raw.raw.mypipe_relationships auto_ingest = true AS COPY INTO RAW.RAW.relationships
FROM
    @raw.raw.ext_stage/relationships on_error = CONTINUE;
