require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  def initialize
  end

  class << self
    def menu
      puts "Here is a list of available commands:"
      puts "  new    - Create a new contact"
      puts "  list   - List all contacts"
      puts "  show   - Show a contact"
      puts "  search - Search contacts"
    end
    def make
      puts "enter contact's name: "
      name = STDIN.gets.chomp
      puts "enter contact's email: "
      email = STDIN.gets.chomp
      numbers = {}
      answer = "yes"
      puts "would you like to add a phone number?"
      answer = STDIN.gets.chomp
      while (answer != "no")
        puts "what type of phone number is this?"
        type = STDIN.gets.chomp
        puts "enter phone number: "
        number = STDIN.gets.chomp.to_i
        numbers[type.to_sym] = number
        puts "would you like to add a phone number?"
        answer = STDIN.gets.chomp
      end
      contact = Contact.create(name,email,numbers)
      puts "contact created: #{contact.name} (#{contact.email}) #{contact.numbers}"
    end

    def show(id)
      contact = Contact.find(id.to_i)
      if contact
        puts "#{contact.name} (#{contact.email}) #{contact.numbers}"
      else 
        puts "couldn't find contact"
      end
    end

    def list 
      counter = 0
      list = Contact.all
      list.each_with_index do |contact, index|
        puts "#{contact.id}: #{contact.name} (#{contact.email}) #{contact.numbers}"
        counter += 1
        if ((index+1) % 5 == 0 && list.size > index + 1)
          puts "press enter to view more"
          STDIN.gets.chomp
        end
      end
      puts "---"
      puts "#{counter} record(s) total"
    end

    def search(term)
      counter = 0
      list = Contact.search(term)
      if (list.size > 0)
        list.each do |contact|
          puts "#{contact.id}: #{contact.name} (#{contact.email}) #{contact.numbers}"
          counter += 1
        end
      else 
        puts "no contacts with a keyword #{term} were found"
      end
      puts "---"
      puts "#{counter} record(s) total"
    end

  end

end

case ARGV[0]
when nil 
  ContactList.menu
when "list"
  ContactList.list
when "new"
  ContactList.make
when "show"
  ContactList.show(ARGV[1])
when "search"
  ContactList.search(ARGV[1])
end

