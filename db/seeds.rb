# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Patient.destroy_all

Patient.create(patient_id: "100", first_name: "Kate")
Patient.create(patient_id: "200", first_name: "Bob")
Patient.create(patient_id: "300", first_name: "Rick")
Patient.create(patient_id: "400", first_name: "Sam")
Patient.create(patient_id: "500", first_name: "Cherry")
