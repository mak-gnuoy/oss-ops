
CREATE SCHEMA IF NOT EXISTS minio.samples
with (
	location = 's3a://samples/'
);

CREATE TABLE IF NOT EXISTS minio.samples.github (
    id bigint,
    name varchar,
    full_name varchar,
    owner ROW(
        login varchar,
        id bigint,
        html_url varchar
    ),
    html_url varchar,
    topics ARRAY(varchar)
)
WITH (
   external_location = 's3a://samples/github',
   format = 'JSON' 
);
