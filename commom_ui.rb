module CommonUI
  def common_properties
    title = [(print 'Insert Title: '), gets.rstrip][1]
    author_first = [(print "Insert Author's first name: "), gets.rstrip][1]
    author_last = [(print "Insert Author's last name: "), gets.rstrip][1]
    genre_name = [(print 'Insert Genre: '), gets.rstrip][1]
    color = [(print 'Insert Label Color: '), gets.rstrip][1]
    publish_date = [(print 'Insert Publish Date [DD-MM-YYYY]: '), gets.rstrip][1]
    { title: title, author_first: author_first, author_last: author_last, genre_name: genre_name, color: color,
      publish_date: publish_date }
  end
end
