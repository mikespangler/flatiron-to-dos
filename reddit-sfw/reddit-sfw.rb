# Author: Manuel Neuhauser
# Date :  10/2/2013
# Email:  manuel.neuhauser@flatironschool.com

require 'json'
require 'rest_client'


reddit_hash = JSON.parse(RestClient.get('http://reddit.com/.json'))
html_tag = "
<html>
  <head>
  </head>
  <body>
    <ul>
    LI TAGS
    </ul>
  </body>
</html>"
li_tags  = ""
li_tag   = '
      <li>
        <a href="REDDIT URL">
            <h1>POST TITLE</h1>
            <img src="THUMBNAIL URL" />
            <h4>Upvotes:</p>
            <p>NUMBER OF UPVOTES</h4>
            <p>Downvotes:</p>
            <h4>NUMBER OF DOWNVOTES</h4>
        </a>
      </li>'


reddit_hash["data"]["children"].each do |post_hash|
  post = post_hash["data"]
  unless post["over_18"]
    li_tags << 
      li_tag.sub('REDDIT URL', post["url"]).
             sub('POST TITLE', post["title"]).
             sub('THUMBNAIL URL', post["thumbnail"]).
             sub('NUMBER OF UPVOTES', post["ups"].to_s).
             sub('NUMBER OF DOWNVOTES', post["downs"].to_s)
  end
end

html_tag.sub!(/[ ]*LI TAGS[ ]*/, li_tags)

filename = "reddit.html"

system("rm -f #{filename}")

File.open(filename, 'w') { |file| file.write(html_tag) }

system("open #{filename}")


