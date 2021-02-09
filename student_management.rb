=begin
Creating a student management system
Syntax: Class -> class Classname 
Class name with uppercase
=end

class Student
	# class variables, one copy for entire class - @@var_name
	#initialize is a special method, basically a constructor
	# instance variables, one copy for each instance object - @var_name

	def initialize(name,rollno,age)
		@name = name
		@rollno = rollno
		@age = age
	end
	
	# attribute accesors - reader and writer
	attr_reader :name, :rollno, :age
	attr_writer :name, :rollno, :age
	
	# alternate is to use the attr_reader :name, :rollno, :age
	# :age is the symbol name and age is the value of the symbol.
	
end

#utility of array 
class StudentList
	#constructor and initial array declaration
	def initialize
		@student_array = Array.new
	end

	def append(aLocalStudentVariable)
		@student_array.push(aLocalStudentVariable)
	end

	def deleteFirst
    	@student_array.shift
  	end
  	
  	def deleteLast
    	@student_array.pop
  	end

  	def [](key)
    	if key.kind_of?(Integer)
      		#puts 'Record found'
      		result = @student_array.find { |blockStudentVar| key == blockStudentVar.rollno }
      			if result!=nil
		      		puts 'Search Result'
			  		puts '----------------------------------'	
			  			puts 
			  			puts 'Name: ' + result.name
			  			puts 'Rollno: ' + result.rollno.to_s
			  			puts 'Age: ' + result.age.to_s
			  		puts '----------------------------------'
	  			else
	  				puts 'Record not found'
	  			end
	  	else
      		puts 'Record not found'
    	end
  	end
=begin   	
    	elsif 
    		result = @student_array.find { |blockStudentVar| key == blockStudentVar.name }
    		puts 'Search Result'
	  		puts '----------------------------------'	
	  			puts 
	  			puts 'Name: ' + result.name
	  			puts 'Rollno: ' + result.rollno.to_s
	  			puts 'Age: ' + result.age.to_s
	  		puts '----------------------------------'
    	else
      		puts 'Record not found'
    	end
  	end
=end

  	def display_list

  		puts 'Student List'
  		puts '----------------------------------'	
  		@student_array.each do |i|
  			puts 
  			puts 'Name: ' + i.name
  			puts 'Rollno: ' + i.rollno.to_s
  			puts 'Age: ' + i.age.to_s
  		end
  		puts '----------------------------------'	
  	end


  	#return @student_array[key] if key.kind_of?(Integer)
  	#return @student_array.find { |blockStudentVar| key == blockStudentVa.name }
end


# details input function
def getData
		puts 'Enter New Student Name'
		get_name = gets.chomp
		puts 'Enter ' + get_name + '\'s Rollno'
		get_rollno = gets.chomp.to_i
		puts 'Enter ' + get_name + '\'s Age'
		get_age = gets.chomp.to_i
		
		s=Student.new(get_name,get_rollno,get_age)
		return s
	end


# global starting point function
def program_entry_point
		
		flag=1;
		
		input_choice=0;
		student_list = StudentList.new

		while flag>0
			puts 'Student Management Program'
			puts '----------------------------------'
			puts '1. Enter New Student Data'
			puts '2. Display Student Data via Search'
			puts '3. Display Entire List'
			puts '4. Delete First Student Record'
			puts '5. Delete Last Student Record'
			puts '6. Exit'
			puts '----------------------------------'
			
			puts 'Enter Choice Number :'
			input_choice = gets.chomp.to_i;
			puts input_choice
			
			case input_choice
			when 1
				s = getData
				student_list.append(s)
			when 2
				puts 'Enter student roll number'
				key = gets.chomp.to_i
				student_list.[](key)
			when 3
				student_list.display_list			
			when 4
				student_list.deleteFirst
			
			when 5
				student_list.deleteLast

			when 6
				puts 'Exiting.........'
				flag=0	
			end
		end
end

program_entry_point			