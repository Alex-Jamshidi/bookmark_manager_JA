require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end
  
  def self.all
    if 'test' == ENV['ENVIRONMENT']
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url']) }
  end

  def self.create(url:, title:)
    if 'test' == ENV['ENVIRONMENT']
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec_params('INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;' , [url, title])

    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    if 'test' == ENV['ENVIRONMENT']
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    
    result = connection.exec_params("DELETE FROM bookmarks WHERE id = $1", [id])
  end
  
  def self.update(id: , title:, url:)
    if 'test' == ENV['ENVIRONMENT']
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec_params('UPDATE bookmarks SET title = $2, url = $3 WHERE id = $1' \
    'RETURNING id, title, url;', [id, title, url])

    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end
end




#<PG::Result:0x0000000158990800 status=PGRES_TUPLES_OK ntuples=1 nfields=3 cmd_tuples=1>

#<PG::Result:0x000000014e20dec0 status=PGRES_COMMAND_OK ntuples=0 nfields=0 cmd_tuples=1>