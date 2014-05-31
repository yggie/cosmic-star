# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Patient.destroy_all

Patient.create(patient_id: "100", first_name: "Kate", surname: "Rogers", dob: 10.years.ago)
Patient.create(patient_id: "200", first_name: "Barry", surname: "Steel", dob: 13.years.ago)
Patient.create(patient_id: "300", first_name: "Rick", surname: "Waterspoon", dob: 7.years.ago)
