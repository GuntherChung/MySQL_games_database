# Nintendo Switch Games Database
This repository that will hold MySQL school work.

This repository contains the final deliverables for our INST327 database project. The project focuses on creating a comprehensive database for Nintendo Switch exclusive games. The goal of the project is to provide Switch owners with a platform to discover new games and make informed purchase decisions.

### Introduction
Video games have undergone significant advancements in graphics and gameplay over the years. The Nintendo Switch, released in 2017, introduced a unique hybrid console that can be used both as a home console and a portable handheld device. However, there is a lack of easy access to information about new Switch exclusives. To address this problem, our team developed a database that includes details about every Nintendo Switch exclusive game, such as genre, release date, reviews, and multiplayer capabilities.

### Database Description
The database follows a logical design centered around the games table. All other tables in the database refer to the games table via the game_id primary key. The games table holds essential information about each game, including its name, release date, developer, and publisher. An Entity Relationship Diagram (ERD) illustrating the structure of the database is [included]("/ERD.pdf").

### Sample Data
To build the database, our team collected a smaller version of the Nintendo games dataset. We compiled the data into an excel sheet before splitting it into separate sheets for each table. This method streamlined data importation and ensured clean and organized data for our work.

### Views / Queries
The database includes various [views and queries](/data_queries.sql) to fulfill specific requirements. These include sorting games based on Metacritic ratings, counting game series, retrieving games developed by specific developers, obtaining single-player games, filtering games with a "T" rating, and providing general information about games.

### Changes from the Original Design
Initially, our plan was to create a database encompassing all video games released since the original Xbox. However, due to the vast number of games and limited availability of relevant datasets, we decided to narrow the scope to Nintendo games. Eventually, we further refined the scope to exclusively focus on Nintendo Switch games. This allowed us to gather readily available information and ensured a manageable project size. As a result of these changes, we adjusted our tables and queries accordingly.

### Database Ethics Considerations
While narrowing down the scope of the database to Nintendo Switch games, we acknowledge the importance of diversity, equity, and inclusion in the industry. However, we observed a gender representation gap in video games, with female characters often having lower sales and fewer ratings. This lack of inclusivity extends to players of different ethnicities as well. It is essential to recognize these issues and consider the accurate representation of participants in the database.

Regarding data collection, we focused on gathering information from reliable sources such as publishers, sales records, and ratings. We strictly avoided collecting personal user information to ensure data privacy and comply with ethical guidelines.

### Lessons Learned
Throughout the project, our team learned valuable lessons, primarily related to time management. We established a flexible schedule to accommodate our workload and prevent burnout. We also realized the importance of prioritizing quality and complexity over quantity. By downsizing the scope to Nintendo Switch games, we were able to create meaningful tables with rich content within the given time constraints.

### Potential Future Work
In the future, the database can be expanded to include newly released Nintendo Switch games. Additionally, features such as indicating motion control compatibility and displaying development costs per game could be incorporated. The current database serves as an excellent starting point for any further work related to the Nintendo Switch or specific game queries.