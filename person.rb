class Person
    attr_reader :first_name, :last_name, :gender, :title

    def initialize(first_name, last_name, gender, title)
        @first_name = first_name
        @last_name = last_name
        @gender = gender
        @title = title
    end

    def fullname
        "#{@first_name} #{@last_name}"
    end

    def doctor_or_lawyer
      if title == "doctor"
        puts "Dr. #{last_name}"
      elsif title == "lawyer" 
        puts "#{fullname}, Esq."
      else
        puts fullname
      end

    end

end

Mary = Person.new("Mary", "Caple", "female", "lawyer")

Mary.fullname

Mary.doctor_or_lawyer