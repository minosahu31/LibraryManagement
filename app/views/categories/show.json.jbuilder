json.books @category.books do |json, book|
	json.partial! book
end