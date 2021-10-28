require "csv"
require "date"

BookAuthor.delete_all
Author.delete_all
Book.delete_all
Publisher.delete_all

file_name = Rails.root.join("db/top_books.csv")
puts "Loading books from CSV file: #{file_name}"

file_data = File.read(file_name)
books = CSV.parse(file_data, headers: true, encoding: "utf-8")
books.each do |b|
  publisher = Publisher.find_or_create_by(name: b["publisher"])
  if publisher&.valid?
    book = publisher.books.create(
      title:            b["title"],
      isbn:             b["isbn"],
      publication_date: b["publication_date"],
      num_pages:        b["num_pages"],
      average_listing:  b["average_listing"]
    )
    if book&.valid?
      authors = b["author"].to_s.split("//").map(&:strip)
      authors.each do |author_name|
        author = Author.find_or_create_by(name: author_name)
        BookAuthor.create(book: book, author: author)
      end
    else
      puts "Invalid book #{book['title']}"
    end
  else
    puts "Invalid Publisher: #{book['publisher']} for book: #{book['title']}"
  end
end
puts "Created #{Publisher.count} Publishers."
puts "Created #{Book.count} books."
puts "Created #{Author.count} authors."
