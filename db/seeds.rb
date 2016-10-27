# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

susan = User.create(email: 'susan@example.com', password_hash: '657eoi567jio')
bob = User.create(email: 'bob@example.com', password_hash: '234534563')
alice = User.create(email: 'alice@example.com', password_hash: '234534563')

susan_profile = Profile.create(first_name: 'Susan', last_name: 'Boyle', phone: '55555', user: susan)
bob_profile = Profile.create(first_name: 'Bob', last_name: 'Boyle', phone: '55555', user: bob)
alice_profile = Profile.create(first_name: 'alice', last_name: 'Boyle', phone: '55555', user: alice)


photo1 = Photo.create(description: 'Doge', asset_url: 'https://images.unsplash.com/photo-1453365607868-7deed8cc7d26?dpr=2&auto=compress,format&crop=entropy&fit=crop&w=568&h=379&q=80&cs=tinysrgb', user: susan)
photo2 = Photo.create(description: 'Rex', asset_url: 'https://images.unsplash.com/photo-1453487977089-77350a275ec5?dpr=2&auto=compress,format&crop=entropy&fit=crop&w=568&h=378&q=80&cs=tinysrgb', user: susan)
photo3 = Photo.create(description: 'Bulldog', asset_url: 'https://images.unsplash.com/photo-1456534231849-7d5fcd82d77b?dpr=2&auto=compress,format&crop=entropy&fit=crop&w=568&h=321&q=80&cs=tinysrgb', user: alice)
photo4 = Photo.create(description: 'Park Warrior', asset_url: 'https://images.unsplash.com/photo-1443750200537-00fd518bdc82?dpr=2&auto=compress,format&crop=entropy&fit=crop&w=568&h=379&q=80&cs=tinysrgb', user: bob)

# Tag Bob in photo 1
PhotoTaggedUser.create(photo: photo1, user: bob)
# Tag Susan in photo 2
PhotoTaggedUser.create(photo: photo2, user: susan)
# Tag Susan and Bob in photo 3
PhotoTaggedUser.create([
    { photo: photo3, user: susan },
    { photo: photo3, user: bob }
])

# Make Bob follow Susan
UserFollowerRelationship.create(user: susan, follower: bob)
# Make Alice follow Susan
UserFollowerRelationship.create(user: susan, follower: alice)
# Make Alice follow Bob
UserFollowerRelationship.create(user: bob, follower: alice)
