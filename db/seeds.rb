#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
    {
        email: 'email1@example.com',
        password: 'password1',
        full_name: 'Harry Potter',
        birth_date: (Time.now - 20.years),
        biography: 'I am a very nice person'
    },
    {
        email: 'email2@example.com',
        password: 'password2',
        full_name: 'Ron Weasley',
        birth_date: (Time.now - 20.years),
        biography: 'I am a very very nice person'
    },
    {
        email: 'email3@example.com',
        password: 'password3',
        full_name: 'Hermione Granger',
        birth_date: (Time.now - 20.years),
        biography: 'I am a very very very nice person'
    },
    {
        email: 'email4@example.com',
        password: 'password4',
        full_name: 'Severus Snape',
        birth_date: (Time.now - 20.years),
        biography: 'I am a very very very nice person'
    },
    {
        email: 'email4@example.com',
        password: 'password4',
        full_name: 'Remus Lupin',
        birth_date: (Time.now - 20.years),
        biography: 'I am a very very very nice person'
    }
]
users.each do |user|
  User.create(user)
end
