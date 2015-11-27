# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all
Profile.destroy_all

User.create! [
  {username: "Fiorina", password_digest: "placeholder"},
  {username: "Trump", password_digest: "placeholder"},
  {username: "Carson", password_digest: "placeholder"},
  {username: "Clinton", password_digest: "placeholder"}
]

Profile.create! [
  {first_name: "Carly", last_name: "Fiorina", birth_year: 1954, gender: "female"},
  {first_name: "Donald", last_name: "Trump", birth_year: 1946, gender: "male"},
  {first_name: "Ben", last_name: "Carson", birth_year: 1951, gender: "male"},
  {first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female"}
]

users = User.all
due_date = Date.today + 1.year

users.each do |e|
  e.todo_lists.create!(
    list_name: "#{e.username}'s list",
    list_due_date: due_date
  )

  5.times do
    e.todo_lists.first.todo_items.create!(
      due_date: due_date,
      title: "TITLE",
      description: "DESC"
    )
  end
end