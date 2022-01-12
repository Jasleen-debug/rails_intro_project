# rails_intro_project

The goal of this project was to create a Ruby on Rails application using data collected from one or more data sources. This was a two part project.The first part involved creating the required database tables and pulling data from various data sources. The second part involved using Ruby on Rails to create reports, allow searching, and/or display visualizations based on this data.

The data was pulled from public API in csv format from kaggle. Next, I used rails to generate active record models and tables required to store data from the CSV data source.My database model has 1 one-to-many and 1 many-to-many association.I also used appropriate validations for all of my ActiveRecord models to ensure that the data imported into tables was valid.

My Web Application has a menu or navigation bar that provides a way to navigate to books, authors or publishers. I also implemented a simple search functionality. Large collections of data are represented in a paginated format. The markup and styling was built around the Bootstrap framework.
