require 'tribute_scraper.rb'
require 'date'

ts = TributeScraper.new
ts.do_all

links_list = ts.get_local_links_list.reverse


File.open("index.html", "w") do |f|
  f.puts "<html>"
  f.puts "<head><link href='bootstrap/css/bootstrap.min.css' rel='stylesheet' media='screen'></head>"
  f.puts "<body>"
  f.puts "<script src='http://code.jquery.com/jquery-latest.js'></script>"
  f.puts "<script src='bootstrap/js/bootstrap.min.js'></script>"
  f.puts "<h3>PDFTributeScraper</h3>"
  f.puts "<p>This scraper gets all of the PDF filetype links from within the links posted on <a href='https://twitter.com/search/realtime?q=%23PDFTribute&src=hash'>#PDFTribute</a></p>"
  f.puts "<p>Last Updated: #{DateTime.now.month}/#{DateTime.now.day}/#{DateTime.now.year} #{DateTime.now.hour}:#{DateTime.now.min}:#{DateTime.now.sec} UTC<br />"
  f.puts "[<a href='current_links.txt'>full list of PDF files</a>]<br />"
  f.puts "[<a href='https://github.com/birk5437/tribute_scraper'>source code</a>]<br />"
  f.puts "<hr /><br />"
  links_list.each do |ltw|
    f.puts "<a href='#{ltw}'>#{ltw}</a><br />"
  end
  f.puts "<script type='text/javascript'>"
  f.puts "  var _gaq = _gaq || [];"
  f.puts "  _gaq.push(['_setAccount', 'UA-25935389-1']);"
  f.puts "  _gaq.push(['_trackPageview']);"
  f.puts "  (function() {"
  f.puts "    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;"
  f.puts "    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';"
  f.puts "    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);"
  f.puts "  })();"
  f.puts "</script>"
  f.puts "</body>"
  f.puts "</html>"
end
