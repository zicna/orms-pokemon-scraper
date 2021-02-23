class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?);
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * 
            FROM pokemon
            WHERE id = ?
            LIMIT 1
        SQL
    #binding.pry
        arr = db.execute(sql, id).flatten
        #binding.pry
        Pokemon.new(id:arr[0], name:arr[1], type:arr[2], db:db)
        # a.map do |row|
        #     binding.pry
        #     Pokemon.new(id:row[0], name:[1], type:row[2], db:db)  
        # end
    end


end
