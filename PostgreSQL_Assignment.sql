

CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY key,
    name VARCHAR(100) NOT NULL,
    region TEXT NOT NULL
);

CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name TEXT NOT NULL,
    scientific_name TEXT NOT NULL,
    discovery_date DATE,
    conservation_status TEXT
);

CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER NOT NULL REFERENCES rangers(ranger_id) on delete CASCADE,
    species_id INTEGER NOT NULL REFERENCES species(species_id) on delete CASCADE,
    sighting_time TIMESTAMP NOT NULL,
    location TEXT NOT NULL,
    notes TEXT
);

select * FROM sightings;
SELECT * FROM rangers;
SELECT * FROM species;

INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

--problem 1 Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT INTO rangers(name, region) VALUES
    ('Derek Fox', 'Coastal Plains')

--problem 2 Count unique species ever sighted.

SELECT count(DISTINCT species_id) AS unique_species_count FROM sightings;

--problem 3  Find all sightings where the location includes "Pass"

SELECT * FROM sightings
    WHERE location LIKE '%% Pass';

--problem 4  List each ranger's name and their total number of sightings.

SELECT name, count(sighting_id) as total_sightings FROM rangers
    JOIN sightings USING(ranger_id)
    GROUP BY name
    ORDER BY name;

--problem 5 List species that have never been sighted.

SELECT common_name FROM species
    WHERE species_id NOT IN (SELECT species_id FROM sightings);

--problem 6 Show the most recent 2 sightings.

SELECT sp.common_name, si.sighting_time, r.name FROM 
    sightings as si
    JOIN species as sp ON si.species_id = sp.species_id
    JOIN rangers as r on si.ranger_id = r.ranger_id
    ORDER BY sighting_time DESC
    LIMIT 2;

--problem 7  Update all species discovered before year 1800 to have status 'Historic'

UPDATE species SET conservation_status = 'Historic'
    WHERE extract(year from discovery_date) < 1800 

--problem 8 Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.

SELECT sighting_id, 
    CASE 
        WHEN extract(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN extract(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon' 
        ELSE  'Evening'
    END AS time_of_day
    FROM sightings;

--problem 9 Delete rangers who have never sighted any species

DELETE FROM rangers
    WHERE ranger_id NOT IN (
        SELECT DISTINCT ranger_id FROM sightings
    );