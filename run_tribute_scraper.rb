require '/Users/burke/workbench/tribute_scraper/tribute_scraper.rb'

ts = TributeScraper.new
ts.do_all

links_list = ts.get_local_links_list


File.open("index.html", "w") do |f|
  f.puts "<html>"
  f.puts "<head><link href='bootstrap/css/bootstrap.min.css' rel='stylesheet' media='screen'></head>"
  f.puts "<body>"
  f.puts "<script src='http://code.jquery.com/jquery-latest.js'></script>"
  f.puts "<script src='bootstrap/js/bootstrap.min.js'></script>"
  f.puts "<h3>PDFTributeScraper</h3>"
  f.puts "<p>This scraper gets all of the PDF filetype links from within the links posted on <a href='https://twitter.com/search/realtime?q=%23PDFTribute&src=hash'>#PDFTribute</a></p>"
  f.puts "[<a href='current_list.txt'>full list of PDF files</a>]<br />"
  f.puts "[<a href='https://github.com/birk5437/tribute_scraper'>source code</a>]<br />"
  f.puts "<hr /><br />"
  links_list.each do |ltw|
    f.puts "<a href='#{ltw}'>#{ltw}</a><br />"
  end
  f.puts "</body>"
  f.puts "</html>"
end