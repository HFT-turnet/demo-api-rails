# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Entry.destroy_all
User.destroy_all
user1=User.create(login:"test1", name: "Test 1", password: "test1", token: "abcdefghijk")
user2=User.create(login:"test2", name: "Test 2", password: "test2", token: "kjihgfedcba")
entry1=Entry.create(name:"Entry 1", text: "Entry Test 1", user: user1)
entry2=Entry.create(name:"Entry 2", text: "Entry Test 2", user: user1)
entry3=Entry.create(name:"Entry 3", text: "Entry Test 3", user: user1)
entry4=Entry.create(name:"Entry 4", text: "Entry Test 4", user: user2)
entry5=Entry.create(name:"Entry 5", text: "Entry Test 5", user: user2)