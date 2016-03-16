require 'csv'
require 'pg'
require 'active_record'

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact < ActiveRecord::Base

  # attr_accessor :name, :email, :id, :numbers
  # @@allcontacts = []
  # Creates a new contact object
  # @param name [String] The contact's name
  # @param email [String] The contact's email address

  # def self.conn
  #   PG.connect( dbname: 'contactv2')
  # end

  # def initialize(name,email,numbers={})
  #   # TODO: Assign parameter values to instance variables.
  #   self.name = name
  #   self.email = email
  #   self.numbers = numbers
  # end

# Provides functionality for managing contacts in the csv file.
  # def self.connection
  #   puts 'Connecting to the database...'
  #   conn = PG.connect(
  #     host: 'localhost',
  #     dbname: 'contactv2',
  #     user: 'development',
  #     password: 'development'
  #   )
  # end

  # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
  # @return [Array<Contact>] Array of Contact objects
  # def self.all
    # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
    # @@allcontacts = []
    # CSV.read("contacts.csv").each_with_index do |contact, index|
    #   @@allcontacts << self.new(contact[0], contact[1], index + 1, contact[2])
    # end
    # @@allcontacts
  #   conn.exec_params("SELECT * FROM contacts").map do |row|
  #     contact = Contact.new(row['name'],row['email'],row['numbers'])
  #     contact.id = row['id']
  #     contact
  #   end
  # end

  # Creates a new contact, adding it to the csv file, returning the new contact.
  # @param name [String] the new contact's name
  # @param email [String] the contact's email
  # def self.create(name,email,numbers)
  #   if Contact.search(email).empty?
  #     contact = Contact.new(name,email,numbers)
  #     contact.save
  #     contact
  #   end
    # # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
    # contact = nil
    # if (self.all.detect {|contact| contact.email == email})
    #   raise 'Email already in Contact List'
    # end
    # CSV.open("contacts.csv", "ab") do |csv|
    #   csv << [name, email, numbers]
    #   contact = self.new(name, email, 'wc-1 #{"contacts.csv"}'.to_i, numbers)
    # end
    # @@allcontacts << contact
    # contact
  # end

  # def persisted?
  #   !id.nil?
  # end

  # def save
  #   if persisted?
  #     Contact.conn.exec_params("UPDATE contacts SET name=$1,email=$2,numbers=$3 WHERE id=$4", [name,email,numbers,id])
  #   else
  #     rows = Contact.conn.exec_params("INSERT INTO contacts (name,email,numbers) VALUES ($1,$2,$3) RETURNING id",[name,email,numbers])
  #     self.id = rows[0]['id']
  #   end
  # end

  # def delete
  #   if persisted?
  #     Contact.conn.exec_params("DELETE FROM contacts WHERE id=$1",[id])
  #   end
  # end
  
  # Find the Contact in the 'contacts.csv' file with the matching id.
  # @param id [Integer] the contact id
  # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
  # def self.find(id)
    # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
    #self.all.detect {|contact| contact.id == id}
    # res = conn.exec_params("SELECT * FROM contacts WHERE id=$1::integer",[id])
    # return false if res.count == 0
    # contact = Contact.new(res[0]['name'], res[0]['email'], res[0]['numbers'])
    # contact.id = res[0]['id']
    # contact
  # end
  
  # Search for contacts by either name or email.
  # @param term [String] the name fragment or email fragment to search for
  # @return [Array<Contact>] Array of Contact objects.
  # def self.search(term)
    # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
    # self.all.select do |contact|
    #   contact.name.to_s.include?(term) || contact.email.to_s.include?(term)
    #end
#     conn.exec_params("SELECT * FROM contacts WHERE name ILIKE $1 OR email ILIKE $1",["%#{term}%"]).map do |row|
#       contact = Contact.new(row['name'],row['email'],row['numbers'])
#       contact.id = row['id']
#       contact
#     end
#   end

end