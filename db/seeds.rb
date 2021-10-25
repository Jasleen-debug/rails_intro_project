require "csv"
require "date"
Book.delete_all
Publisher.delete_all

file_name = Rails.root.join("db/top_books.csv")
puts "Loading books from CSV file: #{file_name}"

file_data = File.read(file_name)
books = CSV.parse(file_data, headers: true, encoding: "utf-8")
books.each do |book|
  publisher = Publisher.find_or_create_by(name: book["publisher"])
  if publisher&.valid?
    book = publisher.books.create(
      title:            book["title"],
      isbn:             book["isbn"],
      publication_date: book["publication_date"],
      num_pages:        book["num_pages"],
      average_listing:  book["average_listing"]
    )
    puts "Invalid book #{book['title']}" unless book&.valid?
  else
    puts "Invalid Publisher: #{book['publisher']} for book: #{book['title']}"
  end
end
puts "Created #{Publisher.count} Publishers."
puts "Created #{Book.count} books."
